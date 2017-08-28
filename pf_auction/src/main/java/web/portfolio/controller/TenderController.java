package web.portfolio.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import web.portfolio.domain.ProductVO;
import web.portfolio.domain.TenderVO;
import web.portfolio.service.ProductService;
import web.portfolio.service.TenderService;
import web.portfolio.service.UserService;

@Controller
@RequestMapping("/tender")
public class TenderController {
	
	private static final Logger logger=LoggerFactory.getLogger(TenderController.class);
	
	@Inject
	private ProductService prod_service;
	
	@Inject
	private UserService user_service;
	
	@Inject
	private TenderService tender_service;
	
	
	
	/*입찰 페이지*/
	@RequestMapping(value="/tender", method=RequestMethod.GET)
	public void tenderGET(Integer pno, ProductVO vo, TenderVO tenderVO, Model model) throws Exception {
		
		vo=prod_service.readProduct(pno);
		
		model.addAttribute("productVO", vo);
		model.addAttribute("tenderVO", tenderVO);
		
	}
	
	
	@RequestMapping(value="/tender", method=RequestMethod.POST)
	public void tenderPOST(Integer pno, ProductVO vo, TenderVO tenderVO, Model model) throws Exception {
		
		vo=prod_service.readProduct(pno);
		
		model.addAttribute("ProductVO", vo);
		model.addAttribute("tenderVO", tenderVO);
		
	}
	
	
	
	
	/*현재가 업데이트*/
	@RequestMapping(value="/tenderVal", method=RequestMethod.GET)
	public void tenderValGET() {
		
	}
	
	
	
	/*현재가 업데이트*/
	@Transactional
	@ResponseBody
	@RequestMapping(value="/tenderVal", method=RequestMethod.POST)
	public ResponseEntity<Integer> tenderValPOST(@RequestBody TenderVO tenderVO, ProductVO productVO) {
		
		ResponseEntity<Integer> entity=null;
		
		try {
			
			int pno=tenderVO.getPno();
			int val=tenderVO.getTenderValueInput();
			
			String userID=tenderVO.getUserID();
			String buyer=tenderVO.getBuyer();

			productVO=prod_service.readProduct(pno);
			
			
			//현재가+입찰가
			int tempNow=productVO.getNowprice();
			productVO.setNowprice(tempNow + val);
			
			int value=productVO.getNowprice();
			
			Map<String, Object> map=new HashMap<>();
			Map<String, Object> myTenderMap= new HashMap<>();
			
			
			map.put("pno", pno);
			map.put("value", value);
			
			//현재 최고가 입찰자
			map.put("buyer", buyer);
			
			prod_service.updateNowPrice(map);
			
			logger.info("tender update map : "+map.toString());
			
			myTenderMap.put("pno", pno);
			myTenderMap.put("newPrice", value);
			myTenderMap.put("userID", userID);
			
			tender_service.updateTenderPrice(myTenderMap);
			
			logger.info("tender_service.updateTenderPrice : "+myTenderMap.toString());
			
			
			
			entity=new ResponseEntity<Integer>(val, HttpStatus.OK);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
	
	
	@RequestMapping(value="/addMyTender")
	public ResponseEntity<String> addMyTender(String userID, Integer pno) throws Exception {
		
		logger.info("addMyTender userID : "+userID+" , pno : "+pno);
		
		ResponseEntity<String> entity=null;
		
		try {
			Map<String, Object> map=new HashMap<>();
			map.put("userID", userID);
			map.put("pno", pno);
			
			
			tender_service.addMyTender(map);
			
			entity=new ResponseEntity<>("success", HttpStatus.OK);
			
		} catch (Exception e) {
			
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			
		}
		
		return entity;
		
	}
	
	
	
	//나의 입찰 목록
	@RequestMapping(value="/myTender", method=RequestMethod.GET)
	public void myTenderGET(String userID, ProductVO vo, TenderVO tenderVO, Model model) throws Exception {
		
		List<Integer> list=new ArrayList<>();
		List<ProductVO> listVO=new ArrayList<>();
		
		list=tender_service.myTender(userID);
		logger.info("myTender list : "+list.toString());
		
		
		Iterator<Integer> it=list.iterator();
		
		while(it.hasNext()) {
			
			int pno=it.next();
			listVO.add(prod_service.readProduct(pno));
			
		}
		
		model.addAttribute("userInfo", user_service.userInfo(userID));
		model.addAttribute("myTenderList", listVO);
		
		
	}
	
	
	//나의 입찰 목록
	@RequestMapping(value="/myTender", method=RequestMethod.POST)
	public void myTenderPOST() throws Exception {
		
		
		
	}
	
	
	
	@RequestMapping(value="/myPrice", method=RequestMethod.GET)
	public void myPriceGET() throws Exception {
		
	}
	
	
	@ResponseBody
	@RequestMapping(value="/myPrice", method=RequestMethod.POST)
	public ResponseEntity<Integer> myPricePOST(Integer pno, String userID) throws Exception {
		
		ResponseEntity<Integer> entity=null;
		Map<String, Object> map=new HashMap<>();
		
		try{
			
			map.put("pno", pno);
			map.put("userID", userID);
			
			int price=tender_service.getMyTenderPrice(map);
			
			entity=new ResponseEntity<Integer>(price, HttpStatus.OK);
			
		}catch(Exception e) {
			
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			
		}
		
		return entity;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="/myAspect", method=RequestMethod.GET)
	public void myAspectGET(String userID) throws Exception {
		
	}
	

}






