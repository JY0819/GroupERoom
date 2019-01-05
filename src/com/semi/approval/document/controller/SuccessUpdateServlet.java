package com.semi.approval.document.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.approval.document.service.DocumentService;

@WebServlet("/successUpdate.su")
public class SuccessUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SuccessUpdateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] docNumList = request.getParameter("docNum").split(",");
		String apprNum = request.getParameter("apprNum");
		String apprOrder = request.getParameter("apprOrder");
		System.out.println("결재자 번호: " + apprNum);
		System.out.println("결재자 차수: " + apprOrder);
		int result = new DocumentService().updateApprStatus(docNumList);
		
		String page = "";
		if(result > 0) {
			page = "selectSubmitDocumentServlet.sds";
			response.sendRedirect(page);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "문서 승인 실패");
			RequestDispatcher view = request.getRequestDispatcher(page);
			view.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
