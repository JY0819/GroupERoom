package com.semi.admin.user.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.admin.user.model.service.EmployeeService;
import com.semi.admin.user.model.vo.Employee;

@WebServlet("/login.me")
public class LoginServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
    }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      //로그인 여부 처리하기
	   
	  request.setCharacterEncoding("UTF-8");
	  
	  Integer userId = Integer.parseInt(request.getParameter("userId"));
	  String userPwd = request.getParameter("userPwd");
	  
	  System.out.println("ID : " + userId);
	  System.out.println("PWD : " + userPwd);
	  
	  Employee emp = new Employee();
	  emp.setEmpid(userId);
	  emp.setEmpPwd(userPwd);
	  
	  
	  Employee loginUser = new EmployeeService().loginCheck(emp);
	  
	  if(loginUser != null) {
		  request.getSession().setAttribute("loginUser", loginUser);
		  response.sendRedirect("/semi/main");
	  } else {
		  request.setAttribute("msg", "로그인에 실패했습니다.");
		  request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
	  }
	  
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doGet(request, response);
   }

}