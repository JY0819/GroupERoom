package com.semi.admin.base.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.admin.base.model.service.PositionService;

@WebServlet("/deletePos.po")
public class DeletePositionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeletePositionServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String posId = request.getParameter("posId");
		
		int result = new PositionService().deletePosition(posId);
		
		if (result > 0) {
			response.sendRedirect("/semi/posList.po");
		} else {
			request.setAttribute("msg", "직급 삭제에 실패했습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
