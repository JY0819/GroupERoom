package com.semi.board.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.board.Free.model.service.FreeService;
import com.semi.board.notice.model.service.NoticeService;
import com.semi.board.notice.model.vo.Notice;

/**
 * Servlet implementation class SearchNoticeServlet
 */
@WebServlet("/search.no")
public class SearchNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchNoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchCondition=request.getParameter("searchCondition");
		
		ArrayList<Notice> list = null;
		
		String searchValue = request.getParameter("searchValue");
			
		System.out.println("이름검색: "+searchValue);
			
		list=new NoticeService().searchValue(searchValue);
		
	
			
		
			

		System.out.println("servlet: "+list.size());
		
		String page="";
		
		if(list != null) {
			request.setAttribute("list", list);
			
			page="views/board/notice/searchViewNotice.jsp";
		}else {
			request.setAttribute("msg", "검색 실패");
			
			page="views/common/errorPage.jsp";
			
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
