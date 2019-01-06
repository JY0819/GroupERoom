package com.semi.admin.user.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.admin.user.model.service.EmployeeService;
import com.semi.admin.user.model.vo.UseVac;

@WebServlet("/vacList.me")
public class SelectVacListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectVacListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<UseVac> list = new EmployeeService().selectVacList();
	
		String page = "";
		if (list != null) {
			page = "views/admin/user/userVacList.jsp";
			request.setAttribute("list", list);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "휴가 조회에 실패했습니다.");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
