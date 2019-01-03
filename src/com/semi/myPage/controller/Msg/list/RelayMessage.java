package com.semi.myPage.controller.Msg.list;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.myPage.model.Msg.service.MsgService;
import com.semi.myPage.model.Msg.vo.Msg;

@WebServlet("/relayMsg")
public class RelayMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RelayMessage() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Msg msg = new Msg();
		
		msg.setMsgNo(Integer.parseInt(request.getParameter("msgNo")));
		
		msg = new MsgService().messageDetail(msg);
		
		String page = "";
		if (msg != null) {
			request.setAttribute("msg", msg);
			
			page = "views/myPage/message/list/mypageRelayMessage.jsp";
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}