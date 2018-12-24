package com.semi.admin.user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/management/user/searchAndUpdate")
public class UserSearchAndUpdateServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
    private static final String path = "/views/admin/user/";
	
    public UserSearchAndUpdateServlet() {
        super();
    }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String page = path + "userSearchAndUpdate.jsp";
      
      RequestDispatcher view = request.getRequestDispatcher(page);
      view.forward(request, response);
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doGet(request, response);
   }

}
