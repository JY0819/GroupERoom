package com.semi.approval.document.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.approval.document.service.DocumentService;
import com.semi.approval.document.vo.MyDocument;

@WebServlet("/selectDocument.sd")
public class SelectDocumentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectDocumentServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("내문서함 서블릿으로 이동");
		ArrayList<MyDocument> list = new DocumentService().selectList();
		for(int i=0; i<list.size(); i++) {
			System.out.println(list.get(i).getWriter());
			System.out.println(list.get(i).getWriterNum());
			System.out.println(list.get(i).getDocNum());
			System.out.println(list.get(i).getSubmission());
		}
		String page = "";
		if(list != null) {
			page = "views/approval/taskBox/myDocument.jsp";
			request.setAttribute("list", list);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "작성한 문서 불러오기 실패");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
