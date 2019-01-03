package com.semi.myPage.controller.Etc;

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
import com.semi.approval.document.service.DocumentService;
import com.semi.approval.document.vo.SumEmpInfo;
import com.semi.myPage.model.Etc.vo.PageInfo;
import com.semi.myPage.model.Msg.service.MsgService;
import com.semi.myPage.model.Msg.vo.Msg;

@WebServlet("/showAddress")
public class ShowAddressBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ShowAddressBook() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Employee loginUser = (Employee) request.getSession().getAttribute("loginUser");
		
		int userId = loginUser.getEmpid();
		
		// 주소록 불러오기
		HashMap<Integer, ArrayList<SumEmpInfo>> hmap = new DocumentService().selectDept();
		
		String page = "";
		
		if (hmap != null) {
			request.setAttribute("map", hmap);
			page = "views/myPage/addressBook/AddressBook.jsp";
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
