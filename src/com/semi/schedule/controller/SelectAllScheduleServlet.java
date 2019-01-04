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
import com.semi.common.service.AddressService;
import com.semi.common.vo.DeptEmp;
import com.semi.schedule.model.service.ScheduleService;

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
		String page="";
		if(request.getSession().getAttribute("loginUser")!=null) {
			int empId=((Employee)(request.getSession().getAttribute("loginUser"))).getEmpid();
			
			ArrayList<HashMap<String, Object>> list=new ScheduleService().selectAllSchedule(empId);
		
			String deptId=((Employee)(request.getSession().getAttribute("loginUser"))).getDeptId();
			HashMap<String, ArrayList<DeptEmp>> address=new AddressService().selectDeptEmp();
			
			//휴가 리스트
			
			if(address!=null) {
				ArrayList<DeptEmp> empList=address.get(deptId);
				ArrayList<HashMap<String, Object>> vacList=new ScheduleService().selectVacList(empList);
				
				if(list!=null) {
					page="views/schedule/calendar.jsp";
					request.setAttribute("list", list);
					if(vacList!=null) {
						request.setAttribute("vacList", vacList);
					}
				}else {
					page="views/common/errorPage.jsp";
					request.setAttribute("msg", "일정 조회 실패");
				}
				RequestDispatcher view=request.getRequestDispatcher(page);
				view.forward(request, response);
			}
		
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
