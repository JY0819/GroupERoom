package com.semi.myPage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.myPage.model.service.MsgService;
import com.semi.myPage.model.vo.Msg;

@WebServlet("/myPageLockerMessage")
public class ShowMyPageLockerMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ShowMyPageLockerMessage() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userId = 1;
		
		ArrayList<Msg> list = new MsgService().ShowMyPageLockerMessage(userId);
		
		String page = "";
		request.setAttribute("list", list);
			
		page = "views/myPage/message/mypageMessageLocker.jsp";
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}