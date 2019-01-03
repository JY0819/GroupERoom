package com.semi.approval.document.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.admin.user.model.vo.Employee;
import com.semi.approval.document.service.DocumentService;
import com.semi.approval.document.vo.MyDocument;

@WebServlet("/selectMainServlet.sm")
public class SelectMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectMainServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Employee employee = (Employee)request.getSession().getAttribute("loginUser");
		int empId = employee.getEmpid();
		ArrayList<MyDocument> list = new DocumentService().selectStatus(empId);
		String page = "";
		if(list != null) {
			page = "views/approval/taskBox/documentStatus.jsp";
			request.setAttribute("list", list);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "문서 조회 실패");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
