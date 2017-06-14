package web.portfolio.controller;


import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import web.portfolio.domain.Criteria;
import web.portfolio.domain.Paging;
import web.portfolio.domain.ProductVO;
import web.portfolio.domain.SampleVO;
import web.portfolio.domain.UserVO;
import web.portfolio.service.ProductService;
import web.portfolio.service.UserService;

@Controller
@RequestMapping(value="/main/*")
public class MainController {
	
	private static final Logger logger=LoggerFactory.getLogger(MainController.class);
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@Inject
	private ProductService prod_service;
	private UserService user_service;
	

	
	@RequestMapping(value="/contents")
	public void mainPage(ProductVO vo, Model model, Criteria criteria) throws Exception {
		
		Paging paging=new Paging();
		paging.setCriteria(criteria);
		paging.setTotalCount(prod_service.listCountCriteria(criteria));
		
		model.addAttribute("list", prod_service.listCriteria(criteria));
		model.addAttribute("paging", paging);
		
		System.out.println("vo.getEnddate() : "+vo.getEnddate());
		
	}
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public String registProductGET(Model model) throws Exception {
		logger.info("regist");
		
		return "/main/register";
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public void registProductPOST(ProductVO vo) throws Exception {
		logger.info(vo.toString());
		
		System.out.println("vo.toString() : "+vo.toString());
		prod_service.createProduct(vo);
		/*rttr.addFlashAttribute("msg","success");*/
		

	}
	
	
	
	@RequestMapping(value="/readProduct")
	public void readProduct(@RequestParam Integer pno, 
			Model model,Criteria criteria, ProductVO vo) throws Exception {
		
		vo=prod_service.readProduct(pno);
		
		model.addAttribute("productVO",vo);
		
		
		
		System.out.println("vo.toString : "+vo.toString());
	}
	
	
	@RequestMapping(value="/listProduct")
	public void listCriteria(@ModelAttribute("criteria") Criteria criteria,
			Model model, ProductVO vo) throws Exception {
		
		logger.info(criteria.toString());
		model.addAttribute("list", prod_service.listCriteria(criteria));

		Paging paging=new Paging();
		paging.setCriteria(criteria);
		paging.setTotalCount(prod_service.listCountCriteria(criteria));
		
		model.addAttribute("paging", paging);

	}
	
	
	
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
	
	
	
	@RequestMapping(value="/myPage", method=RequestMethod.GET)
	public void myPageGET(String userID, Model model, ProductVO productVO, UserVO userVO) throws Exception {
		
		model.addAttribute("myList", prod_service.mySelling(userID));
		
		
	}
	
	
	@RequestMapping(value="/myPage", method=RequestMethod.POST)
	public void myPagePOST(String userID, Model model, ProductVO productVO, UserVO userVO) throws Exception {
		
		
		
		
	}
	
	
	
	
	
	@RequestMapping(value="/getOneImg")
	public void getOneImg(Integer pno, Model model, SampleVO svo) throws Exception {
		
		String path=uploadPath;
		svo.setSamplePath(path+prod_service.getOneImg(pno).replace("/", "\\\\"));
		
		try {
			model.addAttribute("sampleImg", svo.getSamplePath());
			System.out.println(model.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	

	
	

	
	
	
}

	
















