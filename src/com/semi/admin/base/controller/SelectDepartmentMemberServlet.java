package com.semi.admin.base.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.semi.admin.base.model.service.DepartmentService;
import com.semi.admin.user.model.service.EmployeeService;
import com.semi.admin.user.model.vo.Employee;
import com.semi.admin.user.model.vo.LogDepartment;

@WebServlet("/searchDeptMember.me")
public class SelectDepartmentMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectDepartmentMemberServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String deptId = request.getParameter("deptId");
		
		System.out.println(deptId); 
		
		ArrayList<Employee> list = new DepartmentService().deptMember(deptId);

		System.out.println(" 조회 결과 리스트 사이즈 : " + list.size());
		response.setContentType("application/x-json; charset=UTF-8");
		new Gson().toJson(list, response.getWriter());
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
