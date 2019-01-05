package com.semi.schedule.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.semi.schedule.model.service.ScheduleService;
import com.semi.schedule.model.vo.Schedule;

/**
 * Servlet implementation class SelectDayScheduleServlet
 */
@WebServlet("/selectDay.sche")
public class SelectDayScheduleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectDayScheduleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//선택한 일정의 No 전달
		int calendarNo=Integer.parseInt(request.getParameter("calendarNo"));
		System.out.println(calendarNo);
		//String calendarNoArray=request.getParameter("calendarNoArray");
		//System.out.println(calendarNoArray);
		String scheduleDateId=request.getParameter("scheduleDateId");
		System.out.println(scheduleDateId);
		
		Schedule sche=new ScheduleService().selectDaySchedule(calendarNo);
		
		
		//문자열이기 때문에 int 배열로 변환해줌
		/*
		calendarNoArray2=calendarNoArray2.replaceAll("\"","");
		calendarNoArray2=calendarNoArray2.replace("[","");
		calendarNoArray2=calendarNoArray2.replace("]","");
		
		System.out.println("2: "+calendarNoArray2);
		String[] calendarNoArray1 = calendarNoArray2.split(","); //문자배열로 변환
		int[] calendarNoArray=Arrays.asList(calendarNoArray1).stream().mapToInt(Integer::parseInt).toArray(); //int 배열로 변환
		*/
	
			
		

		if(sche!=null) {
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(sche, response.getWriter());
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
