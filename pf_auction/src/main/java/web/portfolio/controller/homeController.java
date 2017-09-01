package web.portfolio.controller;

<<<<<<< HEAD

=======
>>>>>>> refs/remotes/origin/desktop2
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class homeController {
	
	private static final Logger logger=LoggerFactory.getLogger(homeController.class);
<<<<<<< HEAD

=======
>>>>>>> refs/remotes/origin/desktop2
	
	@RequestMapping(value="/")
	public String home() throws Exception {
		
		return "/index";
		
	}

}
