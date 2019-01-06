package com.semi.admin.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.admin.user.model.service.EmployeeService;

@WebServlet("/idCheck.me")
public class IdCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public IdCheckServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer userId = Integer.parseInt(request.getParameter("userId"));
		
		int result = new EmployeeService().idCheck(userId);
		
		PrintWriter out = response.getWriter();
		
		if(result > 0) {
			// 아이디가 있을 경우
			out.append("fail");
		} else {
			out.append("success");
		}
		
		out.flush();
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
