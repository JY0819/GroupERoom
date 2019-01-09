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

import com.semi.admin.user.model.service.EmployeeService;
import com.semi.admin.user.model.vo.Employee;
import com.semi.common.service.AttachmentsService;
import com.semi.common.vo.Attachments;

@WebServlet("/selectOneEmp")
public class SelectOneMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectOneMemberServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Employee loginUser = (Employee) request.getSession().getAttribute("loginUser");
		
		int userPhotoId = loginUser.getPhotoId();
		
		System.out.println(userPhotoId);
		
		String file = "";
		String page = "";
		if (userPhotoId != 0) {
			file = new AttachmentsService().getAttachmentPath(userPhotoId);
			
			request.setAttribute("file", file);
		} 
		
		
		System.out.println(file);
		
		page = "views/myPage/myInfo/ChangeInfo.jsp";
		
	
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
