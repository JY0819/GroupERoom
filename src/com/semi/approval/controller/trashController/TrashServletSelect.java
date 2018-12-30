package com.semi.approval.controller.trashController;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.approval.approve.model.vo.ApprLine;
import com.semi.approval.approve.model.vo.Approval;
import com.semi.approval.approve.model.vo.PageInfo;
import com.semi.approval.approve.model.vo.TrashTable;
import com.semi.approval.model.service.trashService.TrashService;

/**
 * Servlet implementation class TrashServletSelect
 */
@WebServlet("/selecttrash.tr")
public class TrashServletSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrashServletSelect() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("서블릿");
		/*ArrayList<TrashTable> list = new TrashService().selectList();
		
		
		
		
		String page = "";
		if(list != null) {
			request.setAttribute("list", list);
			
			page = "views/approval/trashBox/trash.jsp";
		}else {
			request.setAttribute("msg", "휴지통 조회실패");
			page = "views/approval/common/errorPage.jsp";
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);*/
		
		int currentPage; //현재 페이지를 표시할 변수(현재 어디페이지를 보고 있는지 표시)
		int limit;		//한페이지에 게시글이 몇 개가 보여질 것인지 표시
		int maxPage;	//전체 페이지에서 가장 마지막 페이지
		int startPage;	//한번에 표시될 페이지가 시작할 페이지
		int endPage;	//한번에 표시될 페이지가 끝나는 페이지
		
		//현재 페이지 처리
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		//한 페이지에 보여질 목록 갯수
		limit = 1;
		
		
		TrashService trashService =new TrashService();
		//전체 게시글 수 조회
		int listCount = trashService.getListCount();
		
		//총 페이지 수 계산
		//예를 들어, 목록 수가 123개면 페이지수는 13페이지가 필요하다.
		maxPage = (int)((double)listCount / limit + 0.9);
		
		//현재 페이지에 보여줄 시작페이지 수
		//1, 11, 21, 31, ...
		startPage = (((int)((double)currentPage / limit + 0.9)) - 1) * limit + 1; 
		
		//목록 아래쪽에 보여질 마지막 페이지 수(10, 20, 30, ...)
		endPage = startPage + 10 - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		ArrayList<TrashTable> list = new TrashService().selectList(currentPage,limit);
		System.out.println(list);
		String page ="";
		if(list != null) {
			page = "views/approval/trashBox/trash.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		}else {
			page="views/approval/common/errorPage.jsp";
			request.setAttribute("msg", "휴지통 조회 실패!");
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
