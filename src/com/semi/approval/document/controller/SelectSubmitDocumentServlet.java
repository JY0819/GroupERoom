package com.semi.approval.document.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.approval.approve.model.vo.ApprLine;
import com.semi.approval.document.service.DocumentService;
import com.semi.approval.document.vo.MyDocument;

@WebServlet("/selectSubmitDocumentServlet.sds")
public class SelectSubmitDocumentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectSubmitDocumentServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp = request.getParameter("check");
		System.out.println("받은 체크값: " + temp);
		ArrayList<MyDocument> list = new DocumentService().selectSubmitList();
		int[] apprNum = new int[list.size()];
		
		for(int i=0; i<list.size(); i++) {
			apprNum[i] = list.get(i).getApprNum();
		}
		
		ArrayList<ApprLine> apprList = new DocumentService().selectSubmitApprList(apprNum);
		String page = "";
		if(list != null && apprList != null) {
			boolean check = false;
			if(temp != null) {
				check = Boolean.valueOf(temp);
				for(int i=0; i<apprList.size(); i++) {
				 apprList.get(i).setCheck(check);
				}
			}
			page = "views/approval/taskBox/approvalDocument.jsp";
			request.setAttribute("list", list);
			request.setAttribute("appr", apprList);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "문서 조회 실패");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
