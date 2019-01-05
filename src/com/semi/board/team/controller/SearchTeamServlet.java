package com.semi.board.team.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.semi.admin.user.model.vo.Employee;
import com.semi.board.team.model.service.TeamService;
import com.semi.board.team.model.vo.PageInfo;
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
		
		/*ArrayList<Team> list = null;		
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
		view.forward(request, response);*/
	
		//------------------페이징 처리 추가-----------------------------------
		int currentPage; //현재 페이지를 표시
		int limit; 		 //한 페이지에 게시글이 몇 개가 보여질 것인지 표시
		int maxPage; 	 //전체 페이지의 마지막 페이지
		int startPage; 	 //한 번에 표시될 페이지가 시작할 페이지
		int endPage; 	 //한 번에 표시될 페이지가 끝나는 페이지
		String searchValue=request.getParameter("searchValue");
System.out.println("-------------------------------------Team검색 servlet1임");
	String searchCondition=request.getParameter("searchCondition");
	
	HttpSession session = request.getSession();
	Employee loginUser = (Employee)session.getAttribute("loginUser");
	String deptId=loginUser.getDeptId();
	
	System.out.println("부서:"+deptId);

	
	
		//현재 페이지 처리
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
	
		}
	System.out.println("servlet");
		//한 페이지에 보여질 목록 갯수

		limit = 10;

		TeamService ts = new TeamService();
		int listCount;
		//전체 게시글 수 조회
		if(searchCondition.equals("findName")) {
			String userName=request.getParameter("searchValue");

			 listCount=ts.getSearchNameListCount(userName, deptId);
			 System.out.println("이름 게시글 수:"+listCount);
		}else if(searchCondition.equals("findTitle")) {
			String title=request.getParameter("searchValue");

			 listCount = ts.getSearchTitleListCount(title, deptId);
			 System.out.println("제목 게시글 수:"+listCount);

		}else {
			String content=request.getParameter("searchValue");

			 listCount = ts.getSearchContentListCount(content, deptId);
			 System.out.println("내용 게시글 수:"+listCount);
		}
		
		
		//총 페이지 수 계산
		//예를 들어, 목록 수가 123개면 페이지 수는 13페이지가 필요하다.

maxPage = (int)((double)listCount / limit + 0.9); //limit에 따라 0.9가 0.5가 될 수도 있고 그럼
System.out.println("maxPage: "+maxPage);
		//현재 페이지에 보여줄 시작 페이지 수
		//1, 11, 21, ...

		startPage = (((int)((double)currentPage / limit + 0.9)) - 1) * limit + 1; 

		//목록 아래쪽에 보여질 마지막 페이지 수(10, 20, 30, ...)
		endPage = startPage + 10 -1;
		if(maxPage < endPage) {

		endPage = maxPage;

		}

		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		
		ArrayList<Team> list = null;
		
		if(searchCondition.equals("findName")) {
			String userName = request.getParameter("searchValue");
			
			System.out.println("이름검색: "+userName);
			
			list=new TeamService().searchName(userName, currentPage, maxPage, limit, deptId);
			
		}else if(searchCondition.equals("findTitle")) {
			String title = request.getParameter("searchValue");
			
			System.out.println("제목검색: "+title);
		
			
			list=new TeamService().searchTitle(title, currentPage, maxPage,limit, deptId);

			
		}else {
			String content = request.getParameter("searchValue");
			
			System.out.println("내용검색: "+content);
		
			
			list=new TeamService().searchContent(content, currentPage, maxPage,limit, deptId);

			
		}

		System.out.println("servlet list사이즈:"+list.size());
		System.out.println("pi: "+pi);
		
		
		String page = "";

		System.out.println("servlet list: "+list.size());
		
		if(list != null) {

		page = "views/board/team/searchViewTeam.jsp";

		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		request.setAttribute("searchValue", searchValue);
		request.setAttribute("searchCondition", searchCondition);
		}else {

		page ="views/common/errorPage.jsp";

		request.setAttribute("msg", "검색결과 조회 실패!");

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
