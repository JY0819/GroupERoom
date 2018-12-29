package com.semi.approval.controller.trashController;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.approval.approve.model.vo.ApprLine;
import com.semi.approval.approve.model.vo.Approval;
import com.semi.approval.approve.model.vo.TrashTable;
import com.semi.approval.model.service.trashService.TrashService;

/**
 * Servlet implementation class TrashServletSelect
 */
@WebServlet("/selecttrash.tr")
public class TrashServletSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrashServletSelect() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("서블릿");
		ArrayList<TrashTable> list = new TrashService().selectList();
		//ArrayList<ApprLine> line = new TrashService().selectLineList();
		
		
		
		String page = "";
		if(list != null) {
			request.setAttribute("list", list);
			//request.setAttribute("line", line);
			page = "views/approval/trashBox/trash.jsp";
		}else {
			request.setAttribute("msg", "휴지통 조회실패");
			page = "views/approval/common/errorPage.jsp";
		}
		
		
		
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
		
		
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
