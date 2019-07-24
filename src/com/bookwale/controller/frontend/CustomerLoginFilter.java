package com.bookwale.controller.frontend;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

@WebFilter("/*")
public class CustomerLoginFilter implements Filter {

	private static  final String[] loginRequiredURLs = {
			"/view_profile", "/edit_profile", "/update_profile"
	};
	
	public CustomerLoginFilter() {

	}

	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		

		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		HttpSession session = httpServletRequest.getSession(false);

		String  path = httpServletRequest.getRequestURI().substring(httpServletRequest.getContextPath().length());
		
		if(path.startsWith("/admin/")) {
			chain.doFilter(request, response);
			return;
		}
		
		boolean loggedIn = session != null && session.getAttribute("loggedCustomer") != null;
		
		String requestURL = httpServletRequest.getRequestURL().toString(); 
		
		if(!loggedIn && isLoginRequired(requestURL)) {
			String queryString = httpServletRequest.getQueryString();
			String redirectURL = requestURL;
			
			if(queryString != null) {
				redirectURL = redirectURL.concat("?").concat(queryString);
			}
			
			session.setAttribute("redirectURL",redirectURL );
			
			String loginPage = "frontend/login.jsp";
			RequestDispatcher requestDispatcher = httpServletRequest.getRequestDispatcher(loginPage);
			requestDispatcher.forward(request, response);
			
		}else {
			chain.doFilter(request, response);
		}
	}
	
	private boolean isLoginRequired(String requestURL) {
		for(String loginRequiredURL : loginRequiredURLs) {
			if(requestURL.contains(loginRequiredURL)) {
				return true;
			}
		}
		return false;
	}

	public void init(FilterConfig fConfig) throws ServletException {

	}

}
