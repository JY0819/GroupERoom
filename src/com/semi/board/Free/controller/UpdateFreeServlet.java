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
 * Servlet implementation class UpdateFreeServlet
 */
@WebServlet("/update.fr")
public class UpdateFreeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateFreeServlet() {
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
	
	Free f = new Free();
	f.setbTitle(title);
	f.setBno(bno);
	f.setbContent(content);
	
	int result = new FreeService().updateFree(f);
	
	String page="";
	
	if(result > 0) {
		response.sendRedirect("/semi/selectOne.fr?num="+bno);
	}else {
		request.setAttribute("msg", "자유게시판 글 수정 실,,패,,");
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
