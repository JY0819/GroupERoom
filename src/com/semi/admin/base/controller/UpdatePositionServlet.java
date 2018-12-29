package com.semi.admin.base.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.admin.base.model.service.PositionService;
import com.semi.admin.base.model.vo.Position;

@WebServlet("/updatePos.po")
public class UpdatePositionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdatePositionServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String posId = request.getParameter("posId");
		String posName = request.getParameter("posName");
		int posNo = Integer.parseInt(request.getParameter("posNo"));
		String[] arr = request.getParameterValues("posActive");
		String posNote = request.getParameter("posNote");
		
		String posActive = "";
		if (arr != null) {
			for (int i = 0; i < arr.length; i++)
				if (i == 0) {
					posActive = arr[i];
				}
		}
		
		Position p = new Position();
		p.setPositionId(posId);
		p.setPositionName(posName);
		p.setPositionNo(posNo);
		p.setPositionAct(posActive);
		p.setPositionNote(posNote);
		
		int result = new PositionService().updatePosition(p);
		
		String page = "";
		if (result > 0) {
			page = "/posList.po";
//			response.sendRedirect(page);
			RequestDispatcher view = request.getRequestDispatcher(page);
			view.forward(request, response);
		} else {
			request.setAttribute("msg", "직책 수정에 실패했습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
