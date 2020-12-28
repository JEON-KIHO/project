package com.example.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter{
	
	public boolean preHandle(HttpSession session, HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		if(session.getAttribute("companyCode")==null) {
			response.sendRedirect("/login");
		}
		
		return super.preHandle(request, response, handler);
	}
}
