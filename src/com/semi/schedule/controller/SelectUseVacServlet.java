package com.semi.schedule.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.admin.user.model.vo.Employee;
import com.semi.schedule.model.service.ScheduleService;

/**
 * Servlet implementation class SelectUseVacServlet
 */
@WebServlet("/usevac.sche")
public class SelectUseVacServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectUseVacServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String page="";
		if(request.getSession().getAttribute("loginUser")!=null) {
			
			int empId=Integer.parseInt(request.getParameter("empId"));
			String deptId=((Employee)request.getSession().getAttribute("loginUser")).getDeptId();
			System.out.println("deptId:"+deptId);
			
			HashMap<String, ArrayList<Employee>> hmap=new ScheduleService().selectDeptEmp();
			
			
			if(hmap!=null) {
				
				page="views/schedule/calendar.jsp";
				request.setAttribute("empHmap", hmap);
				
			}else {
				page="views/common/errorPage.jsp";
				request.setAttribute("msg", "사원이 없습니다");
			}	
			RequestDispatcher view=request.getRequestDispatcher(page);
			view.forward(request, response);
			
		}else {
			request.setAttribute("msg", "세션이 없거나 만료되었습니다.");
			page="views/common/errorPage.jsp";
			request.getRequestDispatcher(page).forward(request, response);
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
