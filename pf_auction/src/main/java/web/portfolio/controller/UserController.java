package web.portfolio.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import web.portfolio.domain.ProductVO;
import web.portfolio.domain.UserVO;
import web.portfolio.dto.LoginDTO;
import web.portfolio.service.ProductService;
import web.portfolio.service.UserService;



@Controller
@RequestMapping("/user")
public class UserController {
	
	static final Logger logger=LoggerFactory.getLogger(UserController.class);
	
	
	@Inject
	private UserService service;
	
	@Inject
	private ProductService prod_service;
	
	
	
	/*새창*/
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginGET(@ModelAttribute("dto") LoginDTO dto) throws Exception {
		
		return "login";
		
	}
	
	
	/*_self*/
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
			logger.info("userInfo : "+userInfo.toString());
			
		
	}
	
	
	
	
	/*ID check*/
	@RequestMapping(value="/loginAjax", method=RequestMethod.GET)
	public void loginAjaxGET(String uid, String upw) throws Exception {
		
	}
	
	
	
	/*ID check*/
	@ResponseBody
	@RequestMapping(value="/loginAjax", method=RequestMethod.POST)
	public ResponseEntity<UserVO> loginAjaxPOST(@RequestBody LoginDTO dto,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		ResponseEntity<UserVO> entity=null;
		
		
		try {

			UserVO vo=service.login(dto);
			
			HttpSession session=request.getSession();
			
			if(vo != null) {
				
				/*세션에 목적경로 저장*/
				session.setAttribute("dest", "/user/loginSuccess");
				entity=new ResponseEntity(vo, HttpStatus.OK);
				
			}else{
				
				/*유저 정보가 없으면 BAD_REQUEST 를 반환*/
				entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
				
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			entity=new ResponseEntity(e.getMessage(), HttpStatus.BAD_REQUEST);
			
		}
		
		
		
		
		return entity;
		
	}
	
	
	
	
	/*회원 가입*/
	@RequestMapping(value="/signIn", method=RequestMethod.GET)
	public void signInGET() throws Exception {
		
	}
	
	
	/*회원 가입*/
	@RequestMapping(value="/signIn", method=RequestMethod.POST)
	public String signInPOST(UserVO vo) throws Exception {
		
		/*회원 가입 쿼리*/
		service.userSignIn(vo);
		
		String result="";
		
		/*정상 가입 여부 확인*/
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
	
	
	/*ID 존재 여부 확인*/
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
	public void loginSuccess() throws Exception {
		
		/*return "/user/loginSuccess";*/
		
	}
	
	
	/*로그아웃 처리*/
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
	
	
	
	
	/*@RequestMapping(value="/addMyTender")
	public void addMyTender(String userID, Integer pno) throws Exception {
		
		logger.info("addMyTender userID : "+userID+" , pno : "+pno);
		
		Map<String, Object> map=new HashMap<>();
		map.put("userID", userID);
		map.put("pno", pno);
		
		
		service.addMyTender(map);
		
	}
	
	
	
	//나의 입찰 목록
	@RequestMapping(value="/myTender", method=RequestMethod.GET)
	public void myTenderGET(String userID, ProductVO vo, Model model) throws Exception {
		
		List<Integer> list=new ArrayList<>();
		List<ProductVO> listVO=new ArrayList<>();
		
		list=service.myTender(userID);
		logger.info("myTender list : "+list.toString());
		
		
		Iterator<Integer> it=list.iterator();
		
		while(it.hasNext()) {
			
			int pno=it.next();
			listVO.add(prod_service.readProduct(pno));
			
		}
		
		model.addAttribute("userInfo", service.userInfo(userID));
		model.addAttribute("myTenderList", listVO);
		
		
	}
	
	
	//나의 입찰 목록
	@RequestMapping(value="/myTender", method=RequestMethod.POST)
	public void myTenderPOST() throws Exception {
		
		
		
	}
	
	
	
	@RequestMapping(value="/myAspect", method=RequestMethod.GET)
	public void myAspectGET(String userID) throws Exception {
		
	}*/
	

}



























