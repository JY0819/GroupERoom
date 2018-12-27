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

@WebServlet("/saveMsg")
public class SaveMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SaveMessage() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] chkList = request.getParameterValues("chkList");
		ArrayList<Integer> savelist = new ArrayList<Integer>();
		
		for (int i = 0; i < chkList.length; i++) {
			savelist.add(Integer.parseInt(chkList[i]));
			
		}
		
		int result = new MsgService().saveMsg(savelist);
		
		String page = "";
		if (result > 0) {
			page = "myPageMessage";
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
