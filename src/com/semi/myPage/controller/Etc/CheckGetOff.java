package com.semi.myPage.controller.Etc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.semi.myPage.model.Etc.service.AttendService;

@WebServlet("/chkToGetOff")
public class CheckGetOff extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CheckGetOff() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int empId = Integer.parseInt(request.getParameter("empId"));
		int result = 0;
		
		result = new AttendService().chkGetOff(empId);
		// 1 = 오늘 퇴근함
		// 0 = 오류
		
		response.setContentType("application/json");

		new Gson().toJson(result, response.getWriter());
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
