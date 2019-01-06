package com.semi.myPage.controller.Msg.locker;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.common.service.AddressService;
import com.semi.common.vo.DeptEmp;
import com.semi.myPage.model.Msg.service.MsgService;
import com.semi.myPage.model.Msg.vo.Msg;

@WebServlet("/relayLockerMsg")
public class RelayMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RelayMessage() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Msg msg = new Msg();
		
		msg.setMsgNo(Integer.parseInt(request.getParameter("msgNo")));
		
		msg = new MsgService().messageDetail(msg);
		
		// 주소록 불러오기
		HashMap<String, ArrayList<DeptEmp>> hmap = new AddressService().selectDeptEmp();
		ArrayList<String> deptIdList=new AddressService().selectDeptIdList();
		
		String page = "";
		if (msg != null) {
			request.setAttribute("msg", msg);
			request.setAttribute("map", hmap);
			request.setAttribute("deptIdList", deptIdList);
			page = "views/myPage/message/locker/mypageRelayLockerMessage.jsp";
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
