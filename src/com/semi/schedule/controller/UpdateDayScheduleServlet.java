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
import com.semi.schedule.model.vo.Schedule;

/**
 * Servlet implementation class UpdateDayScheduleServlet
 */
@WebServlet("/modDay.sche")
public class UpdateDayScheduleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateDayScheduleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String scheduleDateId=request.getParameter("scheduleDateId");
		int calendarNo=Integer.parseInt(request.getParameter("modcalendarNo"));
		int calendarClass=Integer.parseInt(request.getParameter("modscheduleClass"));
		String scheduleTime=request.getParameter("modscheduleTime");
		scheduleTime=scheduleTime+":00";
		String calendarContents=request.getParameter("modschedule");
		
		System.out.println(scheduleDateId+'/'+calendarNo+'/'+calendarClass+'/'+scheduleTime+'/'+calendarContents);
		
		
		Schedule reqSche=new Schedule();
		reqSche.setCalendarClass(calendarClass);
		reqSche.setCalendarNo(calendarNo);
		reqSche.setCalendarContents(calendarContents);
		reqSche.setScheduleDate(scheduleDateId+" "+scheduleTime);
		
		Employee loginUser=(Employee) request.getSession().getAttribute("loginUser");
		System.out.println(loginUser.getEmpid());
		
		int result=0;
		if(reqSche.getCalendarClass()==1) {
			result=new ScheduleService().updateMyDaySchedule(reqSche, loginUser);
		}else if(reqSche.getCalendarClass()==2) {
			result=new ScheduleService().updatTeamDaySchedule(reqSche, loginUser);
		}else if(reqSche.getCalendarClass()==3&&loginUser.getAdminAuthority().equals("Y")) {
			result=new ScheduleService().updateCompanyDaySchedule(reqSche, loginUser);
		}
		
		
		String page="";
		if(result>0) {
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(result, response.getWriter());
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "일정 수정 실패");
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
