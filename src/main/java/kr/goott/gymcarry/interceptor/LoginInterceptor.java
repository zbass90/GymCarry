package kr.goott.gymcarry.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.goott.gymcarry.HomeController;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	//��û��
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		if(session.getAttribute("userid")==null) {
			//���� ���
			String location =request.getContextPath()+"/user/login.do";
			response.sendRedirect(location);
			return false;
		}else {
			return true;
		}
		
		
	}
	//��û��
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		logger.info("post interceptor");
		super.postHandle(request, response, handler, modelAndView);
	}
}
