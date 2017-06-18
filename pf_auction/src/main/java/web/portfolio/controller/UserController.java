package web.portfolio.controller;

import static org.junit.Assert.assertNull;
import static org.springframework.test.web.client.response.MockRestResponseCreators.withUnauthorizedRequest;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.annotation.SuppressAjWarnings;
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
@RequestMapping("/user/*")
public class UserController {
	
	@Inject
	private UserService service;
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginGET(@ModelAttribute("dto") LoginDTO dto) throws Exception {
		
		return "login";
		
	}
	
	@RequestMapping(value="/login2", method=RequestMethod.GET)
	public String login2GET(@ModelAttribute("dto") LoginDTO dto) throws Exception {
		
		return "login2";
		
	}
	
	
	@RequestMapping(value="/loginPost", method=RequestMethod.POST, produces="application/text;charset=UTF-8")
	public void loginPOST(LoginDTO dto, HttpSession session, Model model) throws Exception {
		
		UserVO vo=service.login(dto);
		UserVO userInfo=service.userInfo(dto.getUserID());
		
		if(vo==null) {
			return;
		}
		
			model.addAttribute("userVO", vo);
			model.addAttribute("userInfo", userInfo);
			System.out.println("userInfo : "+userInfo.toString());
			
		
	}
	
	
	
	@RequestMapping(value="/loginAjax", method=RequestMethod.GET)
	public void loginAjaxGET(String uid, String upw) throws Exception {
		
	}
	
	
	@ResponseBody
	@RequestMapping(value="/loginAjax", method=RequestMethod.POST)
	public ResponseEntity<UserVO> loginAjaxPOST(@RequestBody LoginDTO dto,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		ResponseEntity<UserVO> entity=null;
		


		System.out.println(dto.toString());
		
		try {

			UserVO vo=service.login(dto);
			
			HttpSession session=request.getSession();
			
			if(vo != null) {
				session.setAttribute("dest", "/user/loginSuccess");
				entity=new ResponseEntity(vo, HttpStatus.OK);
			}else{
				entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		
		return entity;
		
	}
	
	
	@RequestMapping(value="/signIn", method=RequestMethod.GET)
	public void signInGET() throws Exception {
		
	}
	
	@RequestMapping(value="/signIn", method=RequestMethod.POST)
	public String signInPOST(UserVO vo) throws Exception {
		
		service.userSignIn(vo);
		
		String result="";
		int tempId=service.idChk(vo.getUserID());
		
		if(tempId == 1) {
			
			result="redirect:/user/signInOK";
			
		}else{
			
			result="redirect:/user/signInERR";
			
		}
		
		return result;
	}
	
	
	
	@RequestMapping("/signInOK")
	public void singInOK() throws Exception {
		
	}
	
	
	@RequestMapping("/signInERR")
	public void singInERR() throws Exception {
		
	}
	
	
	
	@RequestMapping(value="/idChk", method=RequestMethod.GET)
	public void idChkGET(String userID) throws Exception {
		
	}
	
	
	@ResponseBody
	@RequestMapping(value="/idChk", method=RequestMethod.POST)
	public ResponseEntity<Integer> idChkPOST(@RequestBody LoginDTO dto) throws Exception {
		
		ResponseEntity<Integer> entity=null;
		String userID=dto.getUserID();
		
		Integer val=service.idChk(userID);
		
		try {
			
			entity=new ResponseEntity<Integer>(val, HttpStatus.OK);
			
		}catch(Exception e) {
			
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			
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



























