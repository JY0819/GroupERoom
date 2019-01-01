package com.semi.myPage.controller.Msg.sendList;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.myPage.model.Msg.service.MsgService;

@WebServlet("/sendSendListMsg")
public class SendMsg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SendMsg() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getParameter("empNo"));
		System.out.println(request.getParameter("receiver"));
		System.out.println(request.getParameter("contents"));
		
		int result = new MsgService().sendMsg(Integer.parseInt(request.getParameter("empNo")), request.getParameter("contents"), Integer.parseInt(request.getParameter("receiver")));
		
		
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
