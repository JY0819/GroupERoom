package com.semi.approval.document.controller;

import java.io.IOException;
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
		int password = Integer.parseInt(request.getParameter("password"));
		int empId = Integer.parseInt(request.getParameter("apprWriter"));
		boolean check = new DocumentService().checkPassword(empId, password);
		
		String page = "";
		if(check) {
			page = "/semi/selectSubmitDocumentServlet.sds?check=" + check;
			response.sendRedirect(page);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("check", check);
			request.getRequestDispatcher(page).forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
