package com.semi.board.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.semi.board.notice.model.service.NoticeService;
import com.semi.board.notice.model.vo.Notice;

/**
 * Servlet implementation class InsertRepleServlet
 */
@WebServlet("/insertReply.no")
public class InsertReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String writer = request.getParameter("writer");
		int bno = Integer.parseInt(request.getParameter("bno"));
		String content = request.getParameter("content");
		
		System.out.println("servlet 댓글작성자:"+writer);
		System.out.println("bno: "+bno);
		System.out.println("댓글내용: "+content);
		System.out.println("왜 값이 널이냐고..1");

		Notice n = new Notice();
		n.setBno(bno);
		n.setWriterId(writer);
		n.setbContent(content);
		
	System.out.println("왜 값이 널이냐고..2");
	
		ArrayList<Notice> replyList = new NoticeService().insertReply(n);
	
		System.out.println("list길ㅇㅣ: "+replyList.size());
		
		response.setContentType("application/json");
		new Gson().toJson(replyList, response.getWriter());
	
	
	
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
