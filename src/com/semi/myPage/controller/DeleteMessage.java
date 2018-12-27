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

@WebServlet("/deleteMsg")
public class DeleteMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteMessage() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] chkList = request.getParameterValues("chkList");
		ArrayList<Integer> deletelist = new ArrayList<Integer>();
		
		for (int i = 0; i < chkList.length; i++) {
			deletelist.add(Integer.parseInt(chkList[i]));
			
		}
		
		int result = new MsgService().deleteMsg(deletelist);
		
		String page = "";
		if (result > 0) {
			if (request.getParameterValues("chkList").equals("Locker")) {
				page = "myPageLockerMessage";
			} else {
				page = "myPageMessage";
			}
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
