package web.portfolio.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import web.portfolio.domain.UserVO;
import web.portfolio.dto.LoginDTO;
import web.portfolio.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Inject
	private UserService service;
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginGET(@ModelAttribute("dto") LoginDTO dto) throws Exception {
		
		return "login";
		
	}
	
	
	@RequestMapping(value="/loginPost", method=RequestMethod.POST, produces="application/text;charset=UTF-8")
	public void loginPOST(LoginDTO dto, HttpSession session, Model model) throws Exception {
		
		UserVO vo=service.login(dto);
		
		if(vo==null) {
			return;
		}
		
			model.addAttribute("userVO", vo);
			System.out.println("userVO : "+vo.toString());
			
		
	}
	
	
	
	@RequestMapping(value="/loginAjax", method=RequestMethod.GET)
	public void loginAjaxGET(String uid, String upw) throws Exception {
		
	}
	
	
	
	@RequestMapping(value="/loginAjax", method=RequestMethod.POST)
	public ResponseEntity<UserVO> loginAjaxPOST(@RequestBody LoginDTO dto,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		ResponseEntity<UserVO> entity=null;
		


		System.out.println("uid : "+dto.getUserID());
		System.out.println("upw : "+dto.getUserPassword());
		
		/*dto.setUserID(userID);
		dto.setUserPassword(userPassword);*/
		
		System.out.println(dto.toString());
		
		try {

			UserVO vo=service.login(dto);
			System.out.println("userVO : "+vo.toString());
			
			HttpSession session=request.getSession();
			
			if(vo != null) {
				session.setAttribute("dest", "/user/loginSuccess");
			}
			
			entity=new ResponseEntity(vo, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		
		return entity;
		
	}
	
	
	
	@RequestMapping("/loginSuccess")
	public String loginSuccess() throws Exception {
		
		return "/user/loginSuccess";
		
	}
	
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws Exception {
		
		Object obj=session.getAttribute("login");
		
		if(obj != null) {
			UserVO vo=(UserVO) obj;
			
			session.removeAttribute("login");
			session.invalidate();
		}
		
		return "redirect:/main/listProduct";
		
	}

}



























