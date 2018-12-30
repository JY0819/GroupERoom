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
 * Servlet implementation class SelectScheduleListServlet
 */
@WebServlet("/scheList.sche")
public class SelectScheduleListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectScheduleListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page="";
		if(request.getSession().getAttribute("loginUser")!=null) {
			int empId=((Employee)(request.getSession().getAttribute("loginUser"))).getEmpid();
			ArrayList<HashMap<String, Object>> list=new ScheduleService().selectAllSchedule(empId);
			System.out.println("list : "+list);
		
			if(list!=null) {
				page="views/schedule/calendarList.jsp";
				request.setAttribute("list", list);
			}else {
				page="views/common/errorPage.jsp";
				request.setAttribute("msg", "일정 조회 실패");
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
