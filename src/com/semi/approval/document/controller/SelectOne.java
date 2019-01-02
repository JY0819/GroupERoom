package com.semi.approval.document.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.approval.document.service.DocumentService;
import com.semi.approval.document.vo.Document;
import com.semi.common.vo.Attachments;

@WebServlet("/selectOne.so")
public class SelectOne extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectOne() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		Document document = new DocumentService().selectOne(num);
		Attachments attachments = new DocumentService().selectFile(num);
		
		String page = "";
		if(document != null && attachments != null) {
			page = "views/approval/documentList/documentDetail.jsp";
			request.setAttribute("document", document);
			request.setAttribute("attachments", attachments);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "문서조회 실패");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
