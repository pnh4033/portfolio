package web.portfolio.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import web.portfolio.domain.Criteria;
import web.portfolio.domain.Paging;
import web.portfolio.domain.PaymentVO;
import web.portfolio.domain.ProductVO;
import web.portfolio.domain.SampleVO;
import web.portfolio.domain.UserVO;
import web.portfolio.service.ProductService;
import web.portfolio.service.UserService;

@Controller
@RequestMapping(value="/*")
public class MainController {
	
	private static final Logger logger=LoggerFactory.getLogger(MainController.class);
	
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@Inject
	private ProductService prod_service;
	
	@Inject UserService user_service;
	

	
	
	
	@RequestMapping(value="/contents")
	public void mainPage(ProductVO vo, Model model, Criteria criteria) throws Exception {
		
		Paging paging=new Paging();
		paging.setCriteria(criteria);
		paging.setTotalCount(prod_service.listCountCriteria(criteria));
		
		model.addAttribute("list", prod_service.listCriteria(criteria));
		model.addAttribute("paging", paging);
		
		
	}
	
	
	
	
	/*상품 등록*/
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public String registProductGET(Model model) throws Exception {
		logger.info("regist");
		
		return "/main/register";
	}
	
	
	
	/*상품 등록*/
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public void registProductPOST(ProductVO vo) throws Exception {
		logger.info(vo.toString());
		
		logger.info("vo.toString() : "+vo.toString());
		prod_service.createProduct(vo);
		/*rttr.addFlashAttribute("msg","success");*/
		

	}
	
	
	
	
	/*등록된 상품 조회*/
	@RequestMapping(value="/readProduct")
	public void readProduct(@RequestParam Integer pno, 
			Model model,Criteria criteria, ProductVO vo) throws Exception {
		
		vo=prod_service.readProduct(pno);
		
		model.addAttribute("productVO",vo);
		
		logger.info("productVO : "+vo.toString());
		
		
		
	}
	
	
	
	
	/*메인 페이지 품목 리스트*/
	@RequestMapping(value="/index")
	public void listCriteria(@ModelAttribute("criteria") Criteria criteria,
			Model model, ProductVO vo) throws Exception {
		
		logger.info(criteria.toString());
		model.addAttribute("list", prod_service.listCriteria(criteria));

		Paging paging=new Paging();
		paging.setCriteria(criteria);
		paging.setTotalCount(prod_service.listCountCriteria(criteria));
		
		model.addAttribute("paging", paging);

	}
	
	
	
	
	
	/*검색된 품목 리스트*/
	@RequestMapping(value="/searchedList")
	public void searchedList(@ModelAttribute("criteria") Criteria criteria,
			Model model, ProductVO vo) throws Exception {
		
		logger.info(criteria.toString());
		model.addAttribute("list", prod_service.searchedList(criteria));

		Paging paging=new Paging();
		paging.setCriteria(criteria);
		paging.setTotalCount(prod_service.searchedCount(criteria));

		model.addAttribute("paging", paging);

	}
	
	
	
	
	
	/*나의 정보 페이지*/
	@RequestMapping(value="/myPage", method=RequestMethod.GET)
	public void myPageGET(String userID, Model model, ProductVO productVO, UserVO userVO) throws Exception {
		
		List<ProductVO> list=new ArrayList<>();
		list=prod_service.mySelling(userID);
		
		model.addAttribute("myList", list);
		
		if(list.isEmpty()) {
			
			model.addAttribute("isEmpty", "empty");
			
		}
		
	}
	
	
	/*나의 정보 페이지*/
	@RequestMapping(value="/myPage", method=RequestMethod.POST)
	public void myPagePOST(String userID, Model model, ProductVO productVO, UserVO userVO) throws Exception {
		
		
		
	}
	
	
	
	
	
	/*샘플 이미지 한개 표시*/
	@RequestMapping(value="/getOneImg")
	public void getOneImg(Integer pno, Model model, SampleVO svo) throws Exception {
		
		String path=uploadPath;
		
		/*db에서 pno에 해당하는 샘플이미지 경로를 하나 가져온 후 sampleVO에  샘플이미지 경로 저장*/
		svo.setSamplePath(path+prod_service.getOneImg(pno).replace("/", "\\\\"));
		
		try {
			
			model.addAttribute("sampleImg", svo.getSamplePath());
			logger.info("sample image : "+model.toString());
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
	}
	
	
	
	
	/*@RequestMapping(value="/tenderVal", method=RequestMethod.GET)
	public void tenderValGET() {
		
	}*/
	
	
	
	@RequestMapping(value="/modifyProduct", method=RequestMethod.GET)
	public void correctProdGET(Integer pno, ProductVO vo, Model model) throws Exception {
		
		vo=prod_service.readProduct(pno);
		model.addAttribute("productVO", vo);
		
	}
	
	
	@RequestMapping(value="/modifyProduct", method=RequestMethod.POST)
	public void correctProdPOST(Integer pno, ProductVO vo, Model model) throws Exception {
		
		vo=prod_service.readProduct(pno);
		prod_service.modifyProduct(vo);
		
	}
	
	

	
	/*이미지 재업로드 이후 데이터베이스에 경로 저장*/
	@RequestMapping(value="/addAttach", method=RequestMethod.GET) 
	public void addAttachGET(ProductVO vo, Model model) throws Exception {
		
		model.addAttribute("productVO",	vo);
		
	}
	
	
	/*이미지 재업로드 이후 데이터베이스에 경로 저장*/
	@Transactional
	@RequestMapping(value="/addAttach", method=RequestMethod.POST) 
	public String addAttachPOST(ProductVO vo, Model model) throws Exception {
		
		logger.info("addAttach vo : "+vo.toString());
		
		Map map=new HashMap<>();
		Integer pno=vo.getPno();
		String[] imgs=vo.getImgs();
		
		map.put("pno", pno);
		
		for(String fullName : imgs) {
			
			map.put("fullName", fullName);
			logger.info("map : "+map.toString());
			
			prod_service.updateAttach(map);
			
		}
		
		return "/main/updIframe";
		
		
	}
	
	
	
	@RequestMapping("/updIframe")
	public void updIframe() throws Exception {
		
	}
	
	
	
	
	/*즉시구매 가격 수정*/
	@RequestMapping(value="/modifyPrice", method=RequestMethod.GET)
	public void modPriceGET() throws Exception {
		
	}
	
	
	/*즉시구매 가격 수정*/
	@RequestMapping(value="/modifyPrice", method=RequestMethod.POST)
	public ResponseEntity<Integer> modPricePOST(Integer pno, Integer price) throws Exception {
		
		ResponseEntity<Integer> entity=null;
		
		Map map=new HashMap<>();
		
		try {
			
			map.put("pno", pno);
			map.put("i_price", price);
			
			prod_service.modifyPrice(map);
			
			entity=new ResponseEntity<>(HttpStatus.OK);
			
		} catch (Exception e) {
			
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			
		}
		
		
		return entity;
		
		
	}
	
	
	
	//판매 취소
	@RequestMapping(value="/removeProduct", method=RequestMethod.GET)
	public void removeProductGET(int pno, Model model, ProductVO vo) throws Exception {
		
		vo=prod_service.readProduct(pno);
		model.addAttribute("productVO", vo);
		
	}
	
	
	//판매 취소
	@ResponseBody
	@RequestMapping(value="/removeProduct", method=RequestMethod.POST)
	public ResponseEntity<Integer> removeProductPOST(Integer pno) throws Exception {
		
		ResponseEntity<Integer> entity=null;
		
		try{
			
			logger.info("removeProductPOST pno : "+pno);
			prod_service.removeProduct(pno);
			
			entity=new ResponseEntity<>(HttpStatus.OK);
			
		}catch(Exception e) {
			
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			
		}
		
		return entity;
		
	}
	
	
	
	@RequestMapping(value="/removeOK")
	public void removeOK() throws Exception {
		
	}
	
	
	
	//종료 여부 조회
	@ResponseBody
	@RequestMapping(value="/isExpired", produces="application/text;charset=UTF-8")
	public ResponseEntity<String> isExpired(Integer pno) throws Exception {
		
		ResponseEntity<String> entity=null;
		
		try{
			
			String result=prod_service.isExpired(pno);
			logger.info("/main/isExpired value : result - "+result+", pno - "+pno);
			
			entity=new ResponseEntity<>(result, HttpStatus.OK);
			
			
		}catch(Exception e) {
			
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			
		}
		
		return entity;
		
	}
	
	
	
	//관심 목록 생성
	@RequestMapping(value="/addMyFavorite")
	public ResponseEntity<Integer> addMyFavorite(String userID, Integer pno) throws Exception {
		
		
		ResponseEntity<Integer> entity=null;
		Map<String, Object> map=new HashMap<>();
		
		try{
			
			map.put("userID", userID);
			map.put("pno", pno);
			
			prod_service.addMyFavorite(map);
			
			logger.info("addMyFavorite : "+map.toString());
			
			entity=new ResponseEntity<>(HttpStatus.OK);
			
		}catch(Exception e) {
			
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			
		}
		
		return entity;
		
		
	}
	
	
	
	//관심 목록 삭제
	@RequestMapping(value="/removeMyFavorite")
	public ResponseEntity<Integer> removeMyFavorite(String userID, Integer pno) throws Exception {
		
		ResponseEntity<Integer> entity=null;
		Map<String, Object> map=new HashMap<>();
		
		try {
			
			map.put("userID", userID);
			map.put("pno", pno);
			
			prod_service.removeMyFavorite(map);
			
			logger.info("removeMyFavorite : "+map.toString());
			
			entity=new ResponseEntity<>(HttpStatus.OK);
			
		} catch (Exception e) {
			
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			
		}
		
		return entity;
		
	}
	
	
	
	//관심 목록 조회
	@RequestMapping(value="/myFavorite", method=RequestMethod.GET)
	public void myFavorite(@RequestParam String userID, 
			ProductVO vo, Model model) throws Exception {
		
		List<Integer> list=new ArrayList<>();
		List<ProductVO> prodList=new ArrayList<>();
		
		list=prod_service.readMyFavorite(userID);
		
		Iterator<Integer> it=list.iterator();
		
		while(it.hasNext()) {
			
			Integer pno=it.next();
			vo=prod_service.readProduct(pno);
			
			prodList.add(vo);
			
		}
		
		model.addAttribute("list", prodList);
		logger.info("myFavorite list : "+prodList.toString());
		
		
        if(list.isEmpty()) {
			
			model.addAttribute("isEmpty", "empty");
			
		}
		
	}
	
	
	
	
	//결제
	@RequestMapping(value="/pay", method=RequestMethod.GET)
	public void payGET(String userID, Integer pno,
			ProductVO productVO, UserVO userVO, Model model) throws Exception {
		
		logger.info("/pay : "+userID);
		
		productVO=prod_service.readProduct(pno);
		logger.info("readProduct : "+productVO.toString());
		
		userVO=user_service.userInfo(userID);
		
		model.addAttribute("productVO", productVO);
		model.addAttribute("userVO", userVO);
		
		
	}
	
	
	//결제
	@RequestMapping(value="/pay", method=RequestMethod.POST)
	public void payPOST() throws Exception {
		
		
		
		
	}
	
	
	
	
	@RequestMapping(value="/paidResult", method=RequestMethod.GET)
	public void paidResultGET(PaymentVO paymentVO, Model model) throws Exception {
		
		List<PaymentVO> list=new ArrayList<>();
		list=prod_service.paidResultsList();
		
		model.addAttribute("paymentList", list);
		
	}
	
	
	@ResponseBody
	@RequestMapping(value="/paidResult", method=RequestMethod.POST)
	public ResponseEntity<String> paidResultPOST(@RequestBody PaymentVO vo) throws Exception {
		
		ResponseEntity<String> entity=null;
		logger.info("paymentVO : "+vo.toString());
		
		Map<String, Object> map=new HashMap<>();
		Integer pno=vo.getPno();
		
		try {
			
			//결제 정보 생성
			prod_service.addPaidResult(vo);
			
			
			//상품 결제 상태 업데이트
			map.put("pno", pno);
			map.put("finished", "종료");
			map.put("paid", "결제완료");
			
			prod_service.updatePaid(map);
			
			
			
			entity=new ResponseEntity<>(vo.toString(), HttpStatus.OK);
			
		} catch (Exception e) {
			
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
	
	
	
}

	
















