package com.semi.approval.document.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.approval.approve.model.vo.DetailDoc;
import com.semi.approval.document.service.DocumentService;

/**
 * Servlet implementation class UpdateSelectOne
 */
@WebServlet("/updateone.uo")
public class UpdateSelectOne extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateSelectOne() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int docno = Integer.parseInt(request.getParameter("docNum"));
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		System.out.println("docNum : " +docno);
		System.out.println("title : "+title);
		System.out.println("contents : "+contents);
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
