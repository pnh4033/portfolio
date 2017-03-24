package web.portfolio.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import web.portfolio.domain.ProductVO;
import web.portfolio.service.ProductService;

@Controller
@RequestMapping(value="/main")
public class MainController {
	
	private static final Logger logger=LoggerFactory.getLogger(MainController.class);
	
	@Inject
	ProductService prod_service;
	
	@RequestMapping(value="/contents")
	public void mainPage(ProductVO vo, Model model) throws Exception {
		model.addAttribute("list", prod_service.listAll());
		
	}

}
