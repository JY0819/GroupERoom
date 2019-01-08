package com.semi.board.team.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.board.team.model.vo.Attachment;
import com.semi.board.team.model.service.TeamService;
import com.semi.board.team.model.vo.Team;

/**
 * Servlet implementation class SelectOneServlet
 */
@WebServlet("/selectOne.tm")
public class SelectOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		
		System.out.println("글번호: "+num);
	
		HashMap<String, Object> hmap = new TeamService().selectOne(num);

		Team t = (Team)hmap.get("Team");
		Attachment at = (Attachment)hmap.get("attachment");
		
		
		ArrayList<Team> reply = new TeamService().selectReply(num);
		String page ="";
		
		if(t != null) {
			page ="views/board/team/viewTeam.jsp";
			if(reply != null) {
				request.setAttribute("reply", reply);
			}
			request.setAttribute("t", t);
			request.setAttribute("at", at);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "부서게시판 게시글 상세보기 실패!");
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
