package com.semi.board.team.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.board.Free.model.service.FreeService;
import com.semi.board.Free.model.vo.Free;
import com.semi.board.team.model.service.TeamService;
import com.semi.board.team.model.vo.Attachment;
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
		int num = Integer.parseInt(request.getParameter("num"));
		
		System.out.println("수정페이지 가기 전 서블릿 num: "+num);

		String fileName = request.getParameter("fileName");
		System.out.println("select servlet fileName: "+fileName);
		
		String page="";

		if(Integer.parseInt(fileName) != 0) {
			HashMap<String, Object> hmap = new TeamService().editOne(num);
			Team t = (Team)hmap.get("Team");
			Attachment at 
	        = (Attachment)hmap.get("attachment");
			
			
			if(t != null) {
				page="views/board/team/modifyTeam.jsp";
				request.setAttribute("t", t);
				request.setAttribute("at", at);
			}else {
				page="views/common/errorPage.jsp";
				request.setAttribute("msg", "부서 게시판 글 수정 상세보기 실패");
			}
		
		}else {
			Team t=new TeamService().editNoFile(num);
			
			System.out.println("노파일 수정 상세보기 가기 전 num: "+num);
			System.out.println("노파일 수정 상세보기 가기 전 t : "+t);
			if(t!=null) {
				page="views/board/team/modifyTeam.jsp";
				request.setAttribute("t", t);
			}else {
				page="views/common/errorPage.jsp";
				request.setAttribute("msg", "부서 게시글 수정용 상세보기 실패!");
			
			}
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
