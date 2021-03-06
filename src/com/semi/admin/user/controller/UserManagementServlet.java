package com.semi.admin.user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/management/user/addUser")
public class UserManagementServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
    private static final String path = "/views/admin/user/";
	
    public UserManagementServlet() {
        super();
    }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String page = path + "addUser.jsp";
      
      RequestDispatcher view = request.getRequestDispatcher(page);
      view.forward(request, response);
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doGet(request, response);
   }

}
