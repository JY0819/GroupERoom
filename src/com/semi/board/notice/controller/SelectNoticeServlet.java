package com.semi.board.notice.controller;

import java.io.IOException;
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

/**
 * Servlet implementation class SelectNoticeServlet
 */
@WebServlet("/selectNotice.no")
//수정용
public class SelectNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectNoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println("select servlet num: "+num);

		String fileName = request.getParameter("fileName");
		System.out.println("select servlet fileName: "+fileName);
		
		String page="";
		
		
		
		
		if(Integer.parseInt(fileName) != 0) {
			HashMap<String, Object> hmap = new NoticeService().editOne(num);
			Notice n = (Notice)hmap.get("Notice");
			Attachment at 
	        = (Attachment)hmap.get("attachment");
			
			if(n != null) {
				page="views/board/notice/updateNotice.jsp";
				request.setAttribute("n", n);
				request.setAttribute("at", at);
			}else {
				page="views/common/errorPage.jsp";
				request.setAttribute("msg", "공지사항 글 수정 상세보기 실패");
			}
		}else {
			Notice n=new NoticeService().editNoFile(num);
			
			System.out.println("노파일 수정 상세보기 가기 전 num: "+num);
			System.out.println("노파일 수정 상세보기 가기 전 n : "+n);
			if(n!=null) {
				page="views/board/notice/updateNotice.jsp";
				request.setAttribute("n", n);
			}else {
				page="views/common/errorPage.jsp";
				request.setAttribute("msg", "공지사항 게시글 수정용 상세보기 실패!");
			
			}
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
