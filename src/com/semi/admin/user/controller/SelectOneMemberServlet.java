package com.semi.admin.user.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jsp.board.model.service.BoardService;
import com.semi.admin.user.model.service.EmployeeService;
import com.semi.admin.user.model.vo.Employee;

@WebServlet("/selectOne.me")
public class SelectOneMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectOneMemberServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String num = request.getParameter("num");
		int num = Integer.parseInt(request.getParameter("num"));
		
		HashMap<String, Object> hmap = new EmployeeService().selectOne(num);
		
		String page = "";
		if (hmap != null) {
			page = "views/admin/user/userDetail.jsp";
			request.setAttribute("hmap", hmap);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "부서 상세보기에 실패했습니다.");
		}
	
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
