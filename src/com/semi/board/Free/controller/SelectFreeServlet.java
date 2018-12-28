package com.semi.board.Free.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.board.Free.model.service.FreeService;
import com.semi.board.Free.model.vo.Free;

/**
 * Servlet implementation class SelectFreeServlet
 */
@WebServlet("/selectFree.fr")
public class SelectFreeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectFreeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num = request.getParameter("num");
		
		Free f = new FreeService().selectOne(num);
		
		String page="";
		
		if(f != null) {
			page="views/board/free/modifyFree.jsp";
			request.setAttribute("f", f);
			
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "자유 게시판 글 수정 상세보기 실패");
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
