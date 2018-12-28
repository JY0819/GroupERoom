package com.semi.admin.base.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.admin.base.model.service.DepartmentService;
import com.semi.admin.base.model.vo.Department;

@WebServlet("/depList.dp")
public class SelectDepartmentListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SelectDepartmentListServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Department> list = new DepartmentService().selectList();

		String page = "";
		if (list != null) {
			System.out.println(list);
			page = "views/admin/base/depManagement.jsp";
			request.setAttribute("list", list);
		} else {
			page = "views/common/errorPage";
			request.setAttribute("msg", "부서 조회에 실패했습니다.");
		}

		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
