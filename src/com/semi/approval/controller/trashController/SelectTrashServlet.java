/*package com.semi.approval.controller.trashController;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.approval.model.service.ApprovalService;
import com.semi.approval.model.service.trashService.trashService;
import com.semi.approval.model.vo.Approval;

*//**
 * Servlet implementation class SelectTrashServlet
 *//*
@WebServlet("/trashselect.tr")
public class SelectTrashServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    *//**
     * @see HttpServlet#HttpServlet()
     *//*
    public SelectTrashServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	*//**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 *//*
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Approval> list = new trashService().selectList();
		
		String page = "";
		if(list != null) {
			request.setAttribute("list", list);
			page = "views/approval/trashBox/trash.jsp";
		}else {
			request.setAttribute("msg", "휴지통 조회실패");
			page = "views/approval/common/errorPage.jsp";
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
	}

	*//**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 *//*
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
*/