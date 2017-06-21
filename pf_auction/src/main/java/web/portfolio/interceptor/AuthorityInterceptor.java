package web.portfolio.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class AuthorityInterceptor extends HandlerInterceptorAdapter {

	
	
	private static final Logger logger=LoggerFactory.getLogger(AuthorityInterceptor.class);

	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session=request.getSession();
		
		if(session.getAttribute("login") == null) {
			
			logger.info("login empty.");
			
			/*목적 경로 저장*/
			saveDest(request);
			
			response.sendRedirect("/user/login2");
			
			return false;
			
		}
		
		return true;
	}
	
	
	
	private void saveDest(HttpServletRequest request) throws Exception {
		
		String uri=request.getRequestURI();
		String query=request.getQueryString();
		
		if(query == null || query.equals(null)) {
			
			query="";
			
		}else{
			
			query="?" + query;
			
		}
		
		if(request.getMethod().equals("GET")) {
			
			logger.info("destiny : "+(uri+query));
			
			/*세션에 목적 경로 저장*/
			request.getSession().setAttribute("dest", uri+query);
			
		}
		
	}
	
	

}



























