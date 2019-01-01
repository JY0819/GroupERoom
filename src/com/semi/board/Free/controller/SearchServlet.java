package com.semi.board.Free.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.board.Free.model.service.FreeService;
import com.semi.board.Free.model.vo.Free;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/search.fr")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		ArrayList<Free> list = null;
		
		
	
			String userName = request.getParameter("searchValue");
			
			System.out.println("이름검색: "+userName);
			
			list=new FreeService().searchName(userName);
		
			String title = request.getParameter("searchValue");
			
			System.out.println("제목검색: "+title);
		
			list=new FreeService().searchtitle(title);

		System.out.println("servlet: "+list.size());
		
		String page="";
		
		if(list != null) {
			request.setAttribute("list", list);
			
			page="views/board/free/searchViewFree.jsp";
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
