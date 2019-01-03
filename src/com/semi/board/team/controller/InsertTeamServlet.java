package com.semi.board.team.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.semi.admin.user.model.vo.Employee;
import com.semi.board.team.model.service.TeamService;
import com.semi.board.team.model.vo.Team;

/**
 * Servlet implementation class InsertTeamServlet
 */
@WebServlet("/insert.tm")
public class InsertTeamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertTeamServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
	
		//작성자 가져오기
		HttpSession session = request.getSession();
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		String writer = String.valueOf(loginUser.getEmpid());
		
		Team t = new Team();
		t.setbTitle(title);
		t.setbContent(content);
		t.setDeptId(loginUser.getDeptId());
		t.setWriterId(writer);
		
		System.out.println("servlet 작성자: "+writer);
		System.out.println("servlet 제목: "+title);
		System.out.println("servlet 내용: "+content);
		System.out.println("servlet 부서코드: "+loginUser.getDeptId());
		int result = new TeamService().insertTeam(t);
		
		String page="";
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath()+"/selectList.tm");
		}else {
			request.setAttribute("msg", "부서게시판 글 작성 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
