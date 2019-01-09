package com.semi.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.semi.admin.user.model.vo.Employee;
import com.semi.wrapper.LoginWrapper;

@WebFilter("*.me")
public class IncryptFilter implements Filter {

	// 톰캣 구동시 같이 작동
    public IncryptFilter() {
//    	System.out.println("객체 생성 2!");
    	
    }

	public void destroy() {
	} 

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest hRequest = (HttpServletRequest) request;

		LoginWrapper lw = new LoginWrapper(hRequest);
		if(hRequest != null) {
			String userPwd = (String) hRequest.getAttribute("userPwd");
			if(userPwd != null) {
				String value = lw.getParameter("userPwd");
				hRequest.setAttribute("userPwd", value);
			}
		}
		chain.doFilter(lw, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
