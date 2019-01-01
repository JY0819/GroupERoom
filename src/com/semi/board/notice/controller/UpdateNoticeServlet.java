package com.semi.board.notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.board.notice.model.service.NoticeService;
import com.semi.board.notice.model.vo.Notice;

/**
 * Servlet implementation class UpdateNoticeServlet
 */
@WebServlet("/updateNotice.no")
public class UpdateNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateNoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String title = request.getParameter("title");
		int bno = Integer.parseInt(request.getParameter("bno"));
		String content = request.getParameter("content");

	System.out.println(title);
	System.out.println(content);
	System.out.println(bno);

	Notice n = new Notice();
	n.setbTitle(title);
	n.setBno(bno);
	n.setbContent(content);
	
	int result = new NoticeService().updateNotice(n);
	
	String page="";
	
	if(result > 0) {
		response.sendRedirect("/semi/selectOne.no?num="+bno);
	}else {
		request.setAttribute("msg", "공지사항 글 수정 실패,,");
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
