package com.semi.approval.document.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.approval.document.service.DocumentService;

@WebServlet("/passCheck.pc")
public class PassCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PassCheckServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		int empId = Integer.parseInt(request.getParameter("userId"));
		String password = request.getParameter("pass");

		boolean check = new DocumentService().checkPassword(empId, password);
		
		PrintWriter out = response.getWriter();
		
		String page = "";
		if(check) {
			out.append("true");
			/*page = "/semi/submitDocumentApproval.sda";
			response.sendRedirect(page);*/
		}else {
			out.append("false");
	/*		page = "views/common/errorPage.jsp";
			request.setAttribute("check", check);
			request.getRequestDispatcher(page).forward(request, response);*/
		}
		out.flush();
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
