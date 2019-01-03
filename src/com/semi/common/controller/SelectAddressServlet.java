package com.semi.common.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

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
 * Servlet implementation class SelectAddressServlet
 */
@WebServlet("/address.common")
public class SelectAddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectAddressServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//HashMap에 deptId가 키, 그 부서에 속한 사원리스트가 value
		HashMap<String, ArrayList<DeptEmp>> address=new AddressService().selectDeptEmp();
		
		if(address!=null) {
			request.setAttribute("address", address);
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
