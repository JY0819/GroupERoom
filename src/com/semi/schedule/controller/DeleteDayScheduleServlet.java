package com.semi.schedule.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.semi.admin.user.model.vo.Employee;
import com.semi.schedule.model.service.ScheduleService;

/**
 * Servlet implementation class DeleteDayScheduleServlet
 */
@WebServlet("/delDay.sche")
public class DeleteDayScheduleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteDayScheduleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int calendarNo=Integer.parseInt(request.getParameter("delCalendarNo"));
		System.out.println(calendarNo+"넘어옴");
		int calendarClass=Integer.parseInt(request.getParameter("delCalendarClass"));
		int empId=((Employee)request.getSession().getAttribute("loginUser")).getEmpid();
		
		int result=new ScheduleService().deleteDaySchedule(calendarNo, empId);

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		if(result>0) {
			new Gson().toJson(calendarNo, response.getWriter());
		}else {
			new Gson().toJson("실패", response.getWriter());
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
