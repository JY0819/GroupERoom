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
		Employee loginUser=(Employee)(request.getSession().getAttribute("loginUser"));
		int empId=loginUser.getEmpid();
		String repeat=request.getParameter("repeat");
		int cnt = -1;
		int year=Integer.parseInt(request.getParameter("yearR"));
		int month=Integer.parseInt(request.getParameter("monthR"));
		System.out.println(year +""+ month);
		String tempDate1=request.getParameter("scheDate");
		tempDate1=tempDate1.replace("년 ", "-").replace("월 ","-").replace("일","");
		System.out.print("날짜 : "+tempDate1);
		
		String temptime=request.getParameter("time");
		String scheduleTime=temptime+":00";
		System.out.print(" / 시간 : "+temptime);
		
		String scheduleDate=tempDate1+" "+temptime;
		
		System.out.print(" / empId : "+empId+" / 클래스 : "+calendarClass+" / ");
		System.out.println(scheduleDate);
		//Date scheDate=Date.valueOf(tempDate+' '+temptime);
		/*temptime=temptime+".0";
		Timestamp date=Timestamp.valueOf(tempDate+' '+temptime);
		System.out.println("Date : "+date);*/
		System.out.println(scheContents);
		
		Schedule reqSche=new Schedule();
		reqSche.setCalendarClass(calendarClass);
		reqSche.setScheduleDate(scheduleDate);
		reqSche.setScheduleTime(scheduleTime);
		reqSche.setEmpId(empId);
		reqSche.setCalendarContents(scheContents);
		
		System.out.println("reqSche: "+reqSche);
		int result=0;
		
		if(scheContents.length()==0 || temptime.length()==0) { //내용이나 시간이 비어있으면 등록 과정 안거치고 바로 실패로 전송함
			System.out.println("여기로옴");
		}else {
			if(repeat!=null) {
				switch(repeat) {
					case "일" : cnt=1; break;	case "월" : cnt=2; break;
					case "화" : cnt=3; break;	case "수" : cnt=4; break;
					case "목" : cnt=5; break;	case "금" : cnt=6; break;
					case "토" : cnt=7; break;
				}
				result=new ScheduleService().insertRepeatSchedule(year, month, cnt, reqSche);
				System.out.println(result+"/"+month+"월 "+repeat+"/"+cnt);
			}else {
				if(reqSche.getCalendarClass()==1) {
					result=new ScheduleService().insertMySchedule(reqSche);
				}else if(reqSche.getCalendarClass()==2) {
					result=new ScheduleService().insertTeamSchedule(reqSche);
				}else if(reqSche.getCalendarClass()==3 && loginUser.getAdminAuthority().equals("Y")){
					result=new ScheduleService().insertCompanySchedule(reqSche);
				}
			}
		}
		
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		if(result>0) {
			new Gson().toJson(result, response.getWriter());
			//response.sendRedirect(request.getContextPath()+"/schedule.sche");
		}else {
			new Gson().toJson(result, response.getWriter());
			//request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
