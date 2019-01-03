package com.semi.board.team.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.board.team.model.service.TeamService;
import com.semi.board.team.model.vo.Team;

/**
 * Servlet implementation class SelectTeamServlet
 */
@WebServlet("/selectTeam.tm")
//수정용
public class SelectTeamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectTeamServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num = request.getParameter("num");
		
		Team t = new TeamService().selectOne(num);
		
		String page="";
		
		if(t != null) {
			page="views/board/team/modifyTeam.jsp";
			request.setAttribute("t", t);
			
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "부서 게시판 글 수정 상세보기 실패");
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
