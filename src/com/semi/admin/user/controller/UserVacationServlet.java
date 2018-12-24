package com.semi.admin.user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/management/user/vacationSearch")
public class UserVacationServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
    private static final String path = "/views/admin/user/";
	
    public UserVacationServlet() {
        super();
    }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String page = path + "vacationSearch.jsp";
      
      RequestDispatcher view = request.getRequestDispatcher(page);
      view.forward(request, response);
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doGet(request, response);
   }

}
