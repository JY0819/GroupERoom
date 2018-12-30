package com.semi.myPage.controller.Msg;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.myPage.model.Msg.service.MsgService;

@WebServlet("/saveMsgOne")
public class SaveMessageOne extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SaveMessageOne() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int msgNo = Integer.parseInt(request.getParameter("msgNo"));
		
		int result = new MsgService().saveMsgOne(msgNo);
		
		String page = "";
		if (result > 0) {
			page = "myPageLockerMessage";
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
