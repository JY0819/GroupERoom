package com.semi.admin.base.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.admin.base.model.service.PositionService;
import com.semi.admin.base.model.vo.Position;

@WebServlet("/selectList.po")
public class SelectPositionListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectPositionListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Position> list = new PositionService().selectList();
		
		String page = "";
		if(list != null) {
			request.setAttribute("list", list);
			page = "views/admin/base/posManagement.jsp";
		} else {
			request.setAttribute("msg", "직책 조회 실패");
			page = "views/common/errorPage";
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
