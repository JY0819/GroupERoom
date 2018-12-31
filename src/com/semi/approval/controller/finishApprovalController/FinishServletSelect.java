package com.semi.approval.controller.finishApprovalController;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.approval.approve.model.vo.FinishApproval;
import com.semi.approval.approve.model.vo.PageInfo;
import com.semi.approval.model.service.finishApprovalService.FinishApprovalService;

/**
 * Servlet implementation class FinishServletSelect
 */
@WebServlet("/finishappr.fi")
public class FinishServletSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FinishServletSelect() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("결재된문서서블릿들어옴");
		/*ArrayList<FinishApproval> list = new FinishApprovalService().selectList();
		String page = "";
		if(list != null) {
			request.setAttribute("list", list);
			page = "views/approval/completeBox/finishapproval.jsp";
		}else {
			request.setAttribute("msg", "완료문서함 조회실패");
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
		limit = 5;
		
		
		FinishApprovalService finishService =new FinishApprovalService();
		//전체 게시글 수 조회
		int listCount = finishService.getListCount();
		
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
		
		
		
		ArrayList<FinishApproval> list = new FinishApprovalService().selectList(currentPage,limit);
		String page = "";
		if(list != null) {
			
			page = "views/approval/completeBox/finishapproval.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		}else {
			request.setAttribute("msg", "완료문서함 조회실패");
			page = "views/approval/common/errorPage.jsp";
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
