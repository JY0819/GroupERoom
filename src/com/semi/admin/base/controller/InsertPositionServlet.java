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

@WebServlet("/insertPos.po")
public class InsertPositionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public InsertPositionServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String posId = request.getParameter("posId");
		String posName = request.getParameter("posName");
		int posNo = Integer.parseInt(request.getParameter("posNo"));
		String[] arr = request.getParameterValues("posActive");
		String[] nrr = request.getParameterValues("posNote");

		String posActive = "";
		if (arr != null) {
			for (int i = 0; i < arr.length; i++)
				if (i == 0) {
					posActive = arr[i];
				}
		}

		String posNote = "";
		if (nrr != null) {
			for (int i = 0; i < nrr.length; i++) {
				if (i == 0) {
					posNote = nrr[i];
				}
			}
		}

		/*
		System.out.println(posId);
		System.out.println(posName);
		System.out.println(posNo);
		System.out.println(posActive);
		System.out.println(posNote);
		*/

		Position pos = new Position();
		pos.setPositionId(posId);
		pos.setPositionName(posName);
		pos.setPositionNo(posNo);
		pos.setPositionAct(posActive);
		pos.setPositionNote(posNote);

		int result = new PositionService().insertPosition(pos);

		String page = "";
		if (result > 0) {
			//page = "posList.po";
			page = "/posList.po";
			//response.sendRedirect(page);
			RequestDispatcher view = request.getRequestDispatcher(page);
			view.forward(request, response);
		} else {
			request.setAttribute("msg", "직급 등록에 실패했습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
