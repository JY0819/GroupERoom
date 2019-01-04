package com.semi.board.team.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.board.team.model.service.TeamService;
import com.semi.board.team.model.vo.Team;

/**
 * Servlet implementation class SearchTeamServlet
 */
@WebServlet("/search.tm")
public class SearchTeamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchTeamServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Team> list = null;		
		String searchValue = request.getParameter("searchValue");
			
		System.out.println("부서코드: "+searchValue);
			
		list=new TeamService().searchValue(searchValue);


		System.out.println("servlet: "+list.size());
		
		String page="";
		
		if(list != null) {
			request.setAttribute("list", list);
			request.setAttribute("searchValue", searchValue);
			page="views/board/team/searchViewTeam.jsp";
		}else {
			request.setAttribute("msg", "검색 실패");
			
			page="views/common/errorPage.jsp";
			
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
