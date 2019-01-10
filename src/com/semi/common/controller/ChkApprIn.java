package com.semi.common.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.admin.user.model.vo.Employee;
import com.semi.common.service.AddressService;
import com.semi.common.service.AlarmService;
import com.semi.common.vo.DeptEmp;
import com.semi.schedule.model.service.ScheduleService;

@WebServlet("/chkApprLine")
public class ChkApprIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ChkApprIn() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int empid = Integer.parseInt(request.getParameter("empid"));
		System.out.println(empid + "가즈아아아아아아아아아아아아");
		int result = new AlarmService().checkingApprLine(empid);
		
		String page = "";
		
		page = "selectSubmitDocumentServlet.sds";
	
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
