package com.semi.myPage.controller.Etc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.semi.myPage.model.Etc.service.AttendService;

@WebServlet("/chkToDayAttend")
public class CheckToDayAttend extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CheckToDayAttend() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int empId = Integer.parseInt(request.getParameter("empId"));
		
		int result = 0;
		
		result = new AttendService().chkToDay(empId);
		// 1 = 오늘 출근함
		// -1 = 출근 버튼을 누르지 않음
		// 0 = 오류
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(result, response.getWriter());
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
