package com.semi.admin.user.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.common.vo.*;
import com.semi.admin.user.model.service.EmployeeService;
import com.semi.admin.user.model.vo.Employee;

@WebServlet("/memberList.me")
public class SelectMemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private PageInfoDetail pid;
	
    public SelectMemberListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		
		ArrayList<Employee> list = new EmployeeService().selectList();
		
		String page = "";
		if (list != null) {
			page = "views/admin/user/userList.jsp";
			request.setAttribute("list", list);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "사원 조회에 실패했습니다.");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
		*/
		
		// -----------------페이징 처리 추가---------------------- //
		int currentPage = 1;	// 현재 보고있는 페이지를 표시할 변수
		int limit = 10;			// 한 페이지에 게시글이 몇 개가 보여질 것인지 표시
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		EmployeeService es = new EmployeeService();
		
		// 전체 휴가 수 조회
		int listCount = es.getListCount();
		
		if(pid == null) {
			pid = new PageInfoDetail(currentPage, limit, listCount);
		}else {
			pid.resetPaging(currentPage, limit, listCount);
		}
		
		PageInfo pi = pid.getPageInfo(); // 페이지 정보
		
		ArrayList<Employee> list = new EmployeeService().selectList(currentPage, limit);
		
		String page = "";
		if (list != null) {
			page = "views/admin/user/userList.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "사원 조회에 실패했습니다.");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
