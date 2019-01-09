package com.semi.approval.document.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.approval.approve.model.vo.DetailDoc;
import com.semi.approval.document.service.DocumentService;

@WebServlet("/updateone.uo")
public class UpdateSelectOne extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateSelectOne() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int docno = Integer.parseInt(request.getParameter("docNum"));
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		DetailDoc detaildoc = new DetailDoc();
		detaildoc.setTitle(title);
		detaildoc.setContents(contents);
		detaildoc.setManagedocno(docno);
		int result = new DocumentService().updateReturn(detaildoc);
		String page = "";
		if(result>0) {
			
			page = "/semi/selectOne.so?docno="+docno;
			response.sendRedirect(page);
		}
		else {
			System.out.println("에러");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
