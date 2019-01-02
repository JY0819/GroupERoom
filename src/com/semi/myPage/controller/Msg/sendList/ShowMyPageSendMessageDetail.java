package com.semi.myPage.controller.Msg.sendList;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.myPage.model.Msg.service.MsgService;
import com.semi.myPage.model.Msg.vo.Msg;

@WebServlet("/myPageSendMessageDetail")
public class ShowMyPageSendMessageDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ShowMyPageSendMessageDetail() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Msg msg = new Msg();
		
		msg.setMsgNo(Integer.parseInt(request.getParameter("msgno")));
		
		String whetherOfSendList = request.getParameter("sendList");
		
		msg = new MsgService().messageDetail(msg, whetherOfSendList);
		
		String page = "";
		if (msg != null) {
			request.setAttribute("msg", msg);
			
			page = "views/myPage/message/sendList/mypageSendMessageDetail.jsp";
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
