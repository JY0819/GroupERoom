package com.semi.admin.user.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.semi.admin.user.model.service.EmployeeService;
import com.semi.admin.user.model.vo.Employee;
import com.semi.admin.user.model.vo.UseVac;

@WebServlet("/searchVacName.me")
public class SearchVacationMemberNameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SearchVacationMemberNameServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("searchName");

		ArrayList<UseVac> list = new EmployeeService().searchVac(userName);
		
		response.setContentType("application/x-json; charset=UTF-8");
		new Gson().toJson(list, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
