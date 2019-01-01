package com.semi.approval.document.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.approval.document.service.DocumentService;

@WebServlet("/sendReturn.sr")
public class SendReturnServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SendReturnServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] docNumList = request.getParameter("docNum").split(",");
		
		int result = new DocumentService().sendReturn(docNumList);
		
		String page = "";
		if(result > 0) {
			response.sendRedirect("/semi/returnBox.rb");

		}else {
			page = "views/common.errorPage";
			request.setAttribute("msg", "문서조회실패");
			RequestDispatcher view = request.getRequestDispatcher(page);
			view.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
