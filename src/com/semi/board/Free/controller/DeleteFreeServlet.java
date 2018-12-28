package com.semi.board.Free.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.board.Free.model.service.FreeService;

/**
 * Servlet implementation class DeleteFreeServlet
 */
@WebServlet("/deleteFree.fr")
public class DeleteFreeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteFreeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int bno = Integer.parseInt(request.getParameter("bno"));
		
		
		System.out.println("bno값: "+bno);
		
		
		
		int result = new FreeService().deleteFree(bno);
		
		String page="";
		
		if(result > 0) {
			response.sendRedirect("/semi/selectList.fr");
		}else {
			request.setAttribute("msg", "자유게시판 글 삭제 실패");
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
