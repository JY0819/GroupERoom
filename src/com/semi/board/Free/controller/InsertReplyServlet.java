package com.semi.board.Free.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.semi.board.Free.model.service.FreeService;
import com.semi.board.Free.model.vo.Free;

/**
 * Servlet implementation class InsertReplyServlet
 */
@WebServlet("/insertReply.fr")
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

		Free f = new Free();
		f.setBno(bno);
		f.setWriterId(writer);
		f.setbContent(content);
		
	System.out.println("왜 값이 널이냐고..2");
	
		ArrayList<Free> replyList = new FreeService().insertReply(f);
	
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
