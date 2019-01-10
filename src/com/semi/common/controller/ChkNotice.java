package com.semi.common.controller;

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
import com.semi.common.service.AddressService;
import com.semi.common.service.AlarmService;
import com.semi.common.vo.DeptEmp;
import com.semi.schedule.model.service.ScheduleService;

@WebServlet("/chkNotice")
public class ChkNotice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ChkNotice() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int empid = Integer.parseInt(request.getParameter("empid"));
		
		// 먼저 알림 테이블의 contents를 뽑고
		HashMap<Integer, String> list = new AlarmService().getNotice(empid); // K : alarmNo, V : contents
		ArrayList<Integer> noList = new AlarmService().getNoticeNo(empid);

		// contents에 ,empid를 추가하여 수정한다.
		for (int i = 0; i < noList.size(); i++) {
			list.put(noList.get(i), list.get(noList.get(i)) + "," + empid);
			System.out.println(list.get(i));
		}
	
		// 그리고 나서 contents update!
		int result = new AlarmService().updateNoticeAlarm(list, noList);
		
		String page = "";
		if (result > 0) {
			page = "selectList.no";
		}
	
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
