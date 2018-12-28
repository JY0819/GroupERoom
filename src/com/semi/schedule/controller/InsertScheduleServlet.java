package com.semi.schedule.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.admin.user.model.vo.Employee;
import com.semi.schedule.model.service.ScheduleService;
import com.semi.schedule.model.vo.Schedule;

/**
 * Servlet implementation class InsertScheduleServlet
 */
@WebServlet("/insertSchedule.sche")
public class InsertScheduleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertScheduleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int calendarClass=Integer.parseInt(request.getParameter("scheduleClass"));
		String scheContents=request.getParameter("scheContents");
		int empId=((Employee)(request.getSession().getAttribute("loginUser"))).getEmpid();
		
		String tempDate1=request.getParameter("scheDate");
		tempDate1=tempDate1.replace("년 ", "-").replace("월 ","-").replace("일","");
		System.out.println("날짜 : "+tempDate1);
		
		String temptime=request.getParameter("time");
		temptime=temptime+":00";
		System.out.println("시간 : "+temptime);
		
		String scheduleDate=tempDate1+" "+temptime;
		
		System.out.println("empId : "+empId);
		System.out.println("클래스 : "+scheduleDate);
		System.out.println(scheduleDate);
		//Date scheDate=Date.valueOf(tempDate+' '+temptime);
		/*temptime=temptime+".0";
		Timestamp date=Timestamp.valueOf(tempDate+' '+temptime);
		System.out.println("Date : "+date);*/
		System.out.println(scheContents);
		
		Schedule reqSche=new Schedule();
		reqSche.setCalendarClass(calendarClass);
		reqSche.setScheduleDate(scheduleDate);
		reqSche.setEmpId(empId);
		reqSche.setCalendarContents(scheContents);
		
		System.out.println("reqSche: "+reqSche);
		int result=0;
		if(reqSche.getCalendarClass()==1) {
			result=new ScheduleService().insertMySchedule(reqSche);
		}else if(reqSche.getCalendarClass()==2) {
			result=new ScheduleService().insertTeamSchedule(reqSche);
		}else if(reqSche.getCalendarClass()==3){
			result=new ScheduleService().insertCompanySchedule(reqSche);
		}
		
		
		String page="";
		
		if(result>0) {
			response.sendRedirect(request.getContextPath()+"/schedule.sche");
		}else {
			request.setAttribute("msg", "일정 추가 실패");
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
