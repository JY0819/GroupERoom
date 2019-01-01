package com.semi.myPage.controller.Etc;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.admin.user.model.vo.Employee;
import com.semi.myPage.model.Etc.service.AttendService;
import com.semi.myPage.model.Etc.vo.Attend;

@WebServlet("/chkAttend")
public class CheckAttendance extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CheckAttendance() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Employee loginUser = (Employee) request.getSession().getAttribute("loginUser");
		
		ArrayList<Attend> list = new ArrayList<Attend>();
		
		int empId = loginUser.getEmpid();
		
		list = new AttendService().chkAttend(empId);
		
		String page = "";
		if (list != null) {
			request.setAttribute("list", list);
			
			page = "views/myPage/attendance/checkAttendance.jsp";
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
