package com.semi.common.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.admin.user.model.vo.Employee;
import com.semi.common.service.MainService;

/**
 * Servlet implementation class MainServlet
 */
@WebServlet("/main")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page="";
		Employee loginUser=(Employee)request.getSession().getAttribute("loginUser");
		
		if(loginUser!=null) {
			
			HashMap<String, Object> hmap=new MainService().selectMainList(loginUser);
			
			if(hmap!=null) {
				page="views/main/home.jsp";
				request.setAttribute("hmap", hmap);
			}else {
				page="views/common/errorPage.jsp";
				request.setAttribute("msg", "세션이 만료되었거나 잘못된 접근입니다.");
			}
		
		}else {
			page="views/common/login.jsp";
		}
		
		RequestDispatcher view=request.getRequestDispatcher(page);
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
