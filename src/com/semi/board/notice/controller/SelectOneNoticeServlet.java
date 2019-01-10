package com.semi.board.notice.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.board.notice.model.service.NoticeService;
import com.semi.board.notice.model.vo.Attachment;
import com.semi.board.notice.model.vo.Notice;
import com.semi.board.team.model.service.TeamService;
import com.semi.board.team.model.vo.Team;

/**
 * Servlet implementation class SelectOneNoticeServlet
 */
@WebServlet("/selectOne.no")
public class SelectOneNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneNoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num= Integer.parseInt(request.getParameter("num"));
	
		System.out.println("글번호: "+num);

		String fileName = request.getParameter("fileName");
		System.out.println("select servlet fileName: "+fileName);
	
		String page="";
		
		if(Integer.parseInt(fileName) != 0) {
			HashMap<String, Object> hmap = new NoticeService().selectOne(num);
			Notice n = (Notice)hmap.get("Notice");
			Attachment at = (Attachment)hmap.get("attachment");
			ArrayList<Notice> reply = new NoticeService().selectReply(num);
			
			if(n != null) {
				if(reply != null) {
					request.setAttribute("reply", reply);
				}
				System.out.println(page + "ddddd");
				request.setAttribute("at", at);
				request.setAttribute("n", n);
				page ="views/board/notice/viewNotice.jsp";
			}else {
				page = "views/common/errorPage.jsp";
				request.setAttribute("msg", "공지사항 글 상세보기 실패!");
				System.out.println(page + "ddddd");
			}
			
		}else {
			System.out.println(page + "ddddd");
			Notice n = new NoticeService().selectOneNoFile(num);
			Attachment at = new Attachment();
			ArrayList<Notice> reply = new NoticeService().selectReply(num);

			if(n != null) {
				if(reply != null) {
					request.setAttribute("reply", reply);
				}
				request.setAttribute("n", n);
				request.setAttribute("at", at);
				page ="views/board/notice/viewNotice.jsp";
				
			}else {
				page = "views/common/errorPage.jsp";
				request.setAttribute("msg", "공지사항 글 상세보기 실패!");
			}
		}
		//새고하면 조회수 늘어나는 거 생각하기!->forward로 해야함
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
