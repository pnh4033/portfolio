package web.portfolio.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import web.portfolio.domain.ProductVO;
import web.portfolio.service.ProductService;

/*@Controller
@RequestMapping("/product/*")
public class ProductControler {
	
	private static Logger logger=LoggerFactory.getLogger(ProductControler.class);
	
	@Inject
	private ProductService service;
	
	@RequestMapping(value="/listProduct", method=RequestMethod.GET)
	public void product(Model model) throws Exception {
		model.addAttribute("list", service.listAll());
	}
	
	@RequestMapping(value="/registProduct", method=RequestMethod.GET)
	public void registProductGET(ProductVO vo, Model model) throws Exception {
		logger.info(vo.toString());
	}
	
	@RequestMapping(value="/registProduct",method=RequestMethod.POST)
	public String registProduct(ProductVO vo, RedirectAttributes rttr, Model model) throws Exception {
		
		
		service.registProduct(vo);
		rttr.addFlashAttribute("msg", "success");
		
		logger.info(vo.toString());
		
		return "/product/listProduct";
		
	}

}
 */
