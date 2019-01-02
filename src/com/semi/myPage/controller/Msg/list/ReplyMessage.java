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

@WebServlet("/replyMessage")
public class ReplyMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReplyMessage() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Msg msg = new Msg();
		
		msg.setMsgNo(Integer.parseInt(request.getParameter("replymsgNo")));
		
		msg = new MsgService().messageDetail(msg);
		
		msg.setMsgContents("RE) " + msg.getMsgContents() + "\r\n");
		
		String page = "";
		if (msg != null) {
			request.setAttribute("msg", msg);
			
			page = "views/myPage/message/list/mypageMessageReply.jsp";
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
