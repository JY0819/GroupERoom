package com.semi.admin.base.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.admin.base.model.service.PositionService;
import com.semi.admin.base.model.vo.Position;

@WebServlet("/selectOne.po")
public class SelectOnePositionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectOnePositionServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num = request.getParameter("num");
		
//		System.out.println(num);
		
		Position p = new PositionService().selectOne(num);
		
		String page = "";
		if (p != null) {
			page = "views/admin/base/posDetail.jsp";
			request.setAttribute("p", p);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "직책 상세보기에 실패했습니다.");
		}
	
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
