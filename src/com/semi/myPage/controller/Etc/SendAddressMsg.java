package com.semi.myPage.controller.Etc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.admin.user.model.vo.Employee;
import com.semi.common.service.AlarmService;
import com.semi.myPage.model.Msg.service.MsgService;

@WebServlet("/sendAddressMsg")
public class SendAddressMsg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SendAddressMsg() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Employee loginUser = (Employee) request.getSession().getAttribute("loginUser");
		
		int userId = loginUser.getEmpid();
		
		int result = new MsgService().sendMsg(userId, request.getParameter("messageArea"), Integer.parseInt(request.getParameter("receiveEmpid")));
		
		
		String page = "";
		if (result > 0) {
			page = "myPageSendMessage";
		} else {
			page = "error";
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
