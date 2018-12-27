package com.semi.schedule.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.schedule.model.service.ScheduleService;

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
		//선택한 날짜의 일정의 No 전달
		String calendarNoArray1=request.getParameter("calendarNoArray");
		System.out.println(calendarNoArray1);
		
		//문자열이기 때문에 int 배열로 변환해줌
		calendarNoArray1=calendarNoArray1.replaceAll("\"","");
		calendarNoArray1=calendarNoArray1.replace("[","");
		calendarNoArray1=calendarNoArray1.replace("]","");
		
		System.out.println("2: "+calendarNoArray1);
		String[] calendarNoArray = calendarNoArray1.split(","); //문자배열로 변환
		
		for(int i=0;i<calendarNoArray.length;i++) {
			System.out.println(i+" : "+calendarNoArray[i]);
		}
		/*
		HashMap<String, Object> hmap=new ScheduleService().selectDaySchedule(calendarNoArray);
		
		String page="";
		if(hmap.size()==calendarNoArray.length) {
			
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "일정 상세조회 실패");
		}
		*/

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
