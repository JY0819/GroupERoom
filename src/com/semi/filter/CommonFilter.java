package com.semi.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter("/*")
// /* 모든 요청에 대해서
public class CommonFilter implements Filter {

	// 서버가 돌아가면 필터 객체들을 미리 만들어놓는다.
	public CommonFilter() {
//		System.out.println("객체 생성!");
	}

	// 톰캣이 종료될때
	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		// 서블릿으로 넘어가기 전에 필터에서 가로채서 작업을 한 후 서블릿으로 넘긴다.

		chain.doFilter(request, response);
	}

	// 필터가 초기화 될때
	public void init(FilterConfig fConfig) throws ServletException {
	}

}
