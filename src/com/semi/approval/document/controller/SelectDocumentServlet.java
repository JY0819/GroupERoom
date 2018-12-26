package com.semi.approval.document.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.approval.document.service.DocumentService;
import com.semi.approval.document.vo.Document;

@WebServlet("/selectDocument.sd")
public class SelectDocumentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectDocumentServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//사원번호받아오기
		Document document = new DocumentService().selectForm();
		String page = "";
		String pageName = request.getParameter("page");
		
		if(document != null) {
			page = "views/approval/documentList/vacationDocument.jsp";
			request.setAttribute("doc", document);
			request.getRequestDispatcher(page).forward(request, response);
		}else {
			page = "views/approval/common/errorPage.jsp";
			request.setAttribute("msg", "문서양식 불러오기 실패");
			request.getRequestDispatcher(page).forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
