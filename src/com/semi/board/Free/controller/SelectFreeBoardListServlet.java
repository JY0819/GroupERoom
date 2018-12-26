package com.semi.board.Free.controller;

import java.io.IOException;

import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.board.Free.model.service.FreeService;
import com.semi.board.Free.model.vo.Free;
import com.semi.board.Free.model.vo.PageInfo;


/**
 * Servlet implementation class SelectFreeBoardListServlet
 */
@WebServlet("/selectList.fr")
public class SelectFreeBoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectFreeBoardListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Free> list = new FreeService().selectList();
		
		String page ="";
		
		if(list != null) {
			request.setAttribute("list", list);
			page = "views/board/free/boardFree.jsp";
			
		}else {
			request.setAttribute("msg", "자유게시판 조회 실패");
			page="views/common/errorPage.jsp";
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
		
		//-------------------페이징처리---------------------
		/*
		int currentPage;	//현재 페이지를 표시
		int limit;			//한 페이지에 게시글이 몇 개가 보여질 것인지 표시
		int maxPage;		//전체 페이지의 마지막 페이지
		int startPage;		//한 번에 표시될 페이지가 시작할 페이지
		int endPage;		//한 번에 표시될 페이지가 끝나는 페이지
		
		//현재 페이지 처리
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt((request.getParameter("currentPage")));
		}
		
		//한 페이지에 보여질 목록 갯수
		limit = 10;
		
		FreeService fs = new FreeService();

		//전체 게시글 수 조회
		int listCount = fs.getListCount();
		
		//총 페이지 수 계산
		//예를 들어, 목록수가 123개면 페이지 수는 13페이지가 필요하다.
		maxPage = (int)((double)listCount / limit + 0.9);
		
		//현재 페이지에 보여줄 시작 페이지 수
		//1, 11, 21, ...
		startPage = (((int)((double)currentPage / limit + 0.9)) -1) * limit + 1; 
	
		//목록 아래쪽에 보여질 마지막 페이지 수 (10,20, 30, ...)
		endPage = startPage + 10 - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
	
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
	
		ArrayList<Free> list = new FreeService().selectList(currentPage, limit);
		
		String page = "";
		
		if(list != null) {
			page="views/board/free/boardFree.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "자유게시판 조회 실패");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
