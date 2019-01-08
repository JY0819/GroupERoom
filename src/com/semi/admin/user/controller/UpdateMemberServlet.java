package com.semi.admin.user.controller;

import java.io.IOException;
import java.util.GregorianCalendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.admin.user.model.service.EmployeeService;
import com.semi.admin.user.model.vo.Employee;
import com.semi.admin.user.model.vo.LogDepartment;
import com.semi.admin.user.model.vo.LogPosition;

@WebServlet("/admin/updateMember.me")
public class UpdateMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateMemberServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int userId = Integer.parseInt(request.getParameter("userId"));
		String userPwd = request.getParameter("userPwd");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String dept = request.getParameter("dept");
		String position = request.getParameter("position");
		String retireYN = request.getParameter("retireYN");
		String leaveDay = request.getParameter("leaveDay");
		int vacCount = Integer.parseInt(request.getParameter("vacCount"));

		// 사원 퇴사일
		java.sql.Date lDay = null;
		
		if (leaveDay != "") {
			String[] dateArr = leaveDay.split("-");
			int[] drr = new int[dateArr.length];
			for (int i = 0; i < dateArr.length; i++) {
				drr[i] = Integer.parseInt(dateArr[i]);
			}

			// GregorianCalendar
			lDay = new java.sql.Date(new GregorianCalendar(drr[0], drr[1] - 1, drr[2]).getTimeInMillis());
		} else {
			lDay = new java.sql.Date(new GregorianCalendar().getTimeInMillis());
		}

		Employee emp = new Employee();
		emp.setEmpid(userId);
		emp.setEmpPwd(userPwd);
		emp.setEmpPhone(phone);
		emp.setEmpAddr(address);
		emp.setWhetherOfRetire(retireYN);
		emp.setLeaveDay(lDay);
		emp.setEmpVacCount(vacCount);
		
		LogDepartment ld = new LogDepartment();
		ld.setDeptId(dept);
		
		LogPosition lp = new LogPosition();
		lp.setPositionId(position);
		
		int result = new EmployeeService().updateEmployee(emp, ld, lp);

		String page = "";
		if (result > 0) {
			page = "/memberList.me";
			RequestDispatcher view = request.getRequestDispatcher(page);
			view.forward(request, response);
		} else {
			request.setAttribute("msg", "사원 수정에 실패했습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
