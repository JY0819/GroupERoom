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
 * Servlet implementation class UpdateTeamServlet
 */
@WebServlet("/updateTeam.tm")
public class UpdateTeamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateTeamServlet() {
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

	Team t = new Team();
	t.setbTitle(title);
	t.setBno(bno);
	t.setbContent(content);
	
	int result = new TeamService().updateTeam(t);
	
	String page="";
	
	if(result > 0) {
		response.sendRedirect("/semi/selectOne.tm?num="+bno);
	}else {
		request.setAttribute("msg", "부서게시판 글 수정 실패");
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
