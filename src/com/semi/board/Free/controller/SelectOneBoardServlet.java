package com.semi.board.Free.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.board.Free.model.service.FreeService;
import com.semi.board.Free.model.vo.Attachment;
import com.semi.board.Free.model.vo.Free;

/**
 * Servlet implementation class SelectOneBoardServlet
 */
@WebServlet("/selectOne.fr")
public class SelectOneBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		
		System.out.println("글번호: "+num);
	
		String fileName = request.getParameter("fileNameAt");
		System.out.println("select servlet fileName: "+fileName);
		
		String page ="";

		if(fileName != null) {
			HashMap<String, Object> hmap = new FreeService().selectOne(num);
			Free f = (Free)hmap.get("Free");
			Attachment at = (Attachment)hmap.get("attachment");
			
			ArrayList<Free> reply = new FreeService().selectReply(num);
			
			if(f != null) {
				page ="views/board/free/viewFree.jsp";
				if(reply != null) {
					request.setAttribute("reply", reply);
				}
				
				request.setAttribute("at", at);
				request.setAttribute("f", f);
			}else {
				page = "views/common/errorPage.jsp";
				request.setAttribute("msg", "자유게시판 게시글 상세보기 실패!");
			}
			
		}else {
			Free f = new FreeService().selectOneNoFile(num);
			
			
			
			if(f != null) {
				page ="views/board/free/viewFree.jsp";
				request.setAttribute("f", f);
				
			}else {
				page = "views/common/errorPage.jsp";
				request.setAttribute("msg", "글 상세보기 실패!");
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
