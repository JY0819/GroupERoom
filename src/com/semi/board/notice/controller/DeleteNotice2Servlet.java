package com.semi.board.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.board.notice.model.service.NoticeService;

/**
 * Servlet implementation class DeleteNotice2Servlet
 */
@WebServlet("/deleteNotice2.no")
public class DeleteNotice2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteNotice2Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] checkList = request.getParameterValues("checkRow");
		String num = request.getParameter("num");
		System.out.println("deleteNotice2 checkList length: "+checkList.length);
		System.out.println("delteNotice2 num: "+ num);
		ArrayList<Integer> deleteList = new ArrayList<Integer>();
		
		for(int i=0; i < checkList.length; i++) {
			deleteList.add(Integer.parseInt(checkList[i]));
		}
	
	int result = new NoticeService().deleteNotice2(deleteList);
	
	String page="";
	if(result > 0) {
		response.sendRedirect("/semi/selectList.no");

	}else {
		request.setAttribute("msg", "공지사항 글 삭제 실패");
		page="views/common/errorPage.jsp";
	
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
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
