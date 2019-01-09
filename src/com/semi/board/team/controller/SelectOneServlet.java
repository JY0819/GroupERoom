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

import com.semi.board.team.model.service.TeamService;
import com.semi.board.team.model.vo.Attachment;
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
	
		String fileName = request.getParameter("fileName");
		System.out.println("select servlet fileName: "+fileName);
		
		String page ="";
		if(Integer.parseInt(fileName) != 0) {
			HashMap<String, Object> hmap = new TeamService().selectOne(num);
			Team t = (Team)hmap.get("Team");
			Attachment at = (Attachment)hmap.get("attachment");
			ArrayList<Team> reply = new TeamService().selectReply(num);

			if(t != null) {
				if(reply != null) {
					request.setAttribute("reply", reply);
				}
				System.out.println(page + "ddddd");
				request.setAttribute("at", at);
				request.setAttribute("t", t);
				page ="views/board/team/viewTeam.jsp";
			}else {
				page = "views/common/errorPage.jsp";
				request.setAttribute("msg", "부서 게시글 상세보기 실패!");
				System.out.println(page + "ddddd");
			}
			
		}else {
			System.out.println(page + "ddddd");
			Team t = new TeamService().selectOneNoFile(num);
			Attachment at = new Attachment();
			
			System.out.println(page + "ddddd");
			if(t != null) {
				request.setAttribute("t", t);
				request.setAttribute("at", at);
				page ="views/board/team/viewTeam.jsp";
				
			}else {
				page = "views/common/errorPage.jsp";
				request.setAttribute("msg", "글 상세보기 실패!");
			}
		}
		System.out.println(page + "ddddd");
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
