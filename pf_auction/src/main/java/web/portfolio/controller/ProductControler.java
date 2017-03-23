package web.portfolio.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import web.portfolio.domain.ProductVO;
import web.portfolio.service.ProductService;

@Controller
@RequestMapping(value="/product")
public class ProductControler {
	
	private static Logger logger=LoggerFactory.getLogger(ProductControler.class);
	
	@Inject
	private ProductService service;
	
	public void registProduct(ProductVO vo) throws Exception {
		
	}

}
