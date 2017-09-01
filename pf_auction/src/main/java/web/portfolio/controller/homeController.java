package web.portfolio.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class homeController {
	
	private static final Logger logger=LoggerFactory.getLogger(homeController.class);

	
	@RequestMapping(value="/")
	public void home() throws Exception {
		
		
	}

}
