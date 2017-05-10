package web.portfolio.controller;


import javax.annotation.Resource;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import web.portfolio.domain.Criteria;
import web.portfolio.domain.Paging;
import web.portfolio.domain.ProductVO;
import web.portfolio.domain.SampleVO;
import web.portfolio.service.FileService;
import web.portfolio.service.ProductService;

@Controller
@RequestMapping(value="/main/*")
public class MainController {
	
	private static final Logger logger=LoggerFactory.getLogger(MainController.class);
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@Inject
	private ProductService prod_service;
	

	
	@RequestMapping(value="/contents")
	public void mainPage(ProductVO vo, Model model, Criteria criteria) throws Exception {
		
		Paging paging=new Paging();
		paging.setCriteria(criteria);
		paging.setTotalCount(prod_service.listCountCriteria(criteria));
		
		model.addAttribute("list", prod_service.listCriteria(criteria));
		model.addAttribute("paging", paging);
		
	}
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public String registProductGET(Model model) throws Exception {
		logger.info("regist");
		
		return "/main/register";
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String registProductPOST(ProductVO vo, RedirectAttributes rttr) throws Exception {
		logger.info(vo.toString());
		
		System.out.println("vo.toString() : "+vo.toString());
		prod_service.createProduct(vo);
		rttr.addFlashAttribute("msg","success");
		
		return "redirect:/main/contents";
	}
	
	
	
	@RequestMapping(value="/readProduct")
	public void readProduct(@RequestParam Integer pno, Model model,Criteria criteria) throws Exception {
		model.addAttribute(prod_service.readProduct(pno));
		
	}
	
	
	@RequestMapping(value="/listProduct")
	public void listCri(Criteria criteria, Model model) throws Exception {
		
		Paging paging=new Paging();
		paging.setCriteria(criteria);
		paging.setTotalCount(prod_service.listCountCriteria(criteria));
		
		model.addAttribute("list", prod_service.listCriteria(criteria));
		model.addAttribute("paging", paging);
		
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

	
















