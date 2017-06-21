package web.portfolio.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class LoginInterceptor extends HandlerInterceptorAdapter {

	
	private static final String LOGIN="login";
	private static final Logger logger=LoggerFactory.getLogger(LoginInterceptor.class);
	
	
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		HttpSession session=request.getSession();
		
		ModelMap modelMap=modelAndView.getModelMap();
		Object userVO=modelMap.get("userVO");
		Object userInfo=modelMap.get("userInfo");
		
		if(userVO != null) {
			
			logger.info("login success!");
			session.setAttribute(LOGIN, userVO);
			session.setAttribute("userInfo", userInfo);
			
			Object dest=session.getAttribute("dest");
			
			response.sendRedirect(dest != null ? (String)dest : "/main/listProduct");
			
		}
		
	}
	
	
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session=request.getSession();
		
		if(session.getAttribute(LOGIN) != null) {
			
			logger.info("now login data exists and will be removed!");
			session.removeAttribute(LOGIN);
			
		}
		
		return true;
		
	} 
	
	

}














