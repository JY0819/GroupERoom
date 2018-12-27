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
import javax.servlet.http.HttpSession;

import com.semi.admin.user.model.vo.Employee;
import com.semi.schedule.model.service.ScheduleService;
import com.semi.schedule.model.vo.Schedule;

/**
 * Servlet implementation class SelectAllScheduleServlet
 */
@WebServlet("/schedule.sche")
public class SelectAllScheduleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectAllScheduleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//세션이 없으면 >> 세션만료 메시지 띄우기
		int empId=((Employee)(request.getSession().getAttribute("loginUser"))).getEmpid();
		ArrayList<HashMap<String, Object>> list=new ScheduleService().selectAllSchedule(empId);
		System.out.println("list : "+list);
		
		String page="";
		
		if(list!=null) {
			page="views/schedule/calendar.jsp";
			request.setAttribute("list", list);
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "일정 조회 실패");
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
