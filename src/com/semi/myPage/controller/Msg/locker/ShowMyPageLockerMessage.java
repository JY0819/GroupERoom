package com.semi.myPage.controller.Msg.locker;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.admin.user.model.vo.Employee;
import com.semi.myPage.model.Etc.vo.PageInfo;
import com.semi.myPage.model.Msg.service.MsgService;
import com.semi.myPage.model.Msg.vo.Msg;

@WebServlet("/myPageLockerMessage")
public class ShowMyPageLockerMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ShowMyPageLockerMessage() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Employee loginUser = (Employee) request.getSession().getAttribute("loginUser");
		
		int userId = loginUser.getEmpid();
		
		int currentPage; // 현재 페이지를 표시할 변수
		int limit;		 // 한 페이지에 게시글이 몇 개가 보여질 것인지 표시
		int maxPage;	 // 전체 페이지에서 가장 마지막 페이지
		int startPage;	 // 한번에 표시될 페이지가 시작할 페이지 넘버
		int endPage;	 // 한번에 표시될 페이지가 끝나는 페이지 넘버
		
		// 현재 페이지 처리
		currentPage = 1;
		
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		System.out.println(currentPage);
		// 한 페이지에 보여질 목록 갯수
		limit = 5;
		
		MsgService ms = new MsgService();
		
		// 전체 게시글 수 조회
		int listCount = ms.getLockerCount(userId);
		
		// 총 페이지 수 계산
		// 예를 들어, 목록 수가 123개면 페이지수는 13페이지가 필요하다.
		maxPage = (int)((double)listCount / limit + 0.9);
		
		// 현재 페이지에 보여줄 시작 페이지 수
		// 1, 11, 21, 31, 41, ~
		startPage = (((int)((double)currentPage / limit + 0.9)) - 1) * limit + 1;
		
		// 목록 아래쪽에 보여질 마지막 페이지 수 (10, 20, 30)
		endPage = startPage + 10 -1;
		
		if (maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		ArrayList<Msg> list = ms.ShowMyPageLockerMessage(userId, currentPage, limit);
		
		String page = "";
		
		if (list != null) {
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			page = "views/myPage/message/locker/mypageMessageLocker.jsp";
		}

		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
