package com.semi.board.team.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.board.team.model.service.TeamService;

/**
 * Servlet implementation class DeleteTeamServlet
 */
@WebServlet("/deleteTeam.tm")
public class DeleteTeamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteTeamServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		
		System.out.println("bno값: "+bno);
		
		
		
		int result = new TeamService().deleteteam(bno);
		
		String page="";
		
		if(result > 0) {
			response.sendRedirect("/semi/selectList.tm");
		}else {
			request.setAttribute("msg", "부서게시판 글 삭제 실패");
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
