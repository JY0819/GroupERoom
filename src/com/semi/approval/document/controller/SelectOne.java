package com.semi.approval.document.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.approval.approve.model.vo.ApprLine;
import com.semi.approval.approve.model.vo.DetailDoc;
import com.semi.approval.model.service.finishApprovalService.DetailOneService;
import com.semi.approval.model.service.finishApprovalService.FinishApprovalService;
import com.semi.board.Free.model.vo.Attachment;

/**
 * Servlet implementation class FinishServletOne
 */
@WebServlet("/selectOne.so")
public class SelectOne extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOne() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int docno = Integer.parseInt(request.getParameter("docno"));		
		String check = request.getParameter("check");
		System.out.println("docno : " + docno);
		HashMap<String,Object> hmap = new DetailOneService().selectDetailMap(docno);
		DetailDoc d =  (DetailDoc)hmap.get("detaildoc");
		ArrayList<Attachment> fileList = (ArrayList<Attachment>)hmap.get("attachment");
		ArrayList<ApprLine> linelist = new DetailOneService().selectLineList(docno);
		
		System.out.println("파일번호: " + d.getAttachno());
		
		String page = "";
		if(hmap != null) {
			
			page = "views/approval/documentList/returnDetailView.jsp";
			request.setAttribute("d", d);
			request.setAttribute("fileList", fileList);
			request.setAttribute("linelist", linelist);
		}
		else {
			System.out.println("오류");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
