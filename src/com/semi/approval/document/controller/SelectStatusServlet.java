package com.semi.approval.document.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.approval.document.service.DocumentService;
import com.semi.approval.document.vo.MyDocument;

@WebServlet("/selectStatusServlet.sss")
public class SelectStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectStatusServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<MyDocument> list = new DocumentService().selectStatus();
		
		String page = "";
		if(list != null) {
			page = "views/approval/taskBox/documentStatus.jsp";
			request.setAttribute("list", list);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "문서 조회 실패");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
