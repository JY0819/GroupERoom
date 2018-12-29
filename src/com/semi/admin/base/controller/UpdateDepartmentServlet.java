package com.semi.admin.base.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.admin.base.model.service.DepartmentService;
import com.semi.admin.base.model.vo.Department;

@WebServlet("/updateDept.dp")
public class UpdateDepartmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateDepartmentServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String deptId = request.getParameter("deptId");
		String deptName = request.getParameter("deptName");
		String[] arr = request.getParameterValues("deptActive");
		String deptNote = request.getParameter("deptNote");

		String deptActive = "";
		if (arr != null) {
			for (int i = 0; i < arr.length; i++)
				if (i == 0) {
					deptActive = arr[i];
				}
		}
		
		Department dept = new Department();
		dept.setDeptId(deptId);
		dept.setDeptName(deptName);
		dept.setDeptAct(deptActive);
		dept.setDeptNote(deptNote);

		int result = new DepartmentService().updateDept(dept);
		
		String page = "";
		if (result > 0) {
			page = "/depList.dp";
			RequestDispatcher view = request.getRequestDispatcher(page);
			view.forward(request, response);
		} else {
			request.setAttribute("msg", "부서 수정에 실패했습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
