package com.semi.myPage.controller.Etc;

import java.io.IOException;
import java.util.ArrayList;
import java.util.GregorianCalendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.admin.user.model.vo.Employee;
import com.semi.myPage.model.Etc.service.LogOfVacationService;
import com.semi.myPage.model.Etc.vo.LogOfVacation;

@WebServlet("/myPageLogOfVac")
public class ShowMyPageLogOfVac extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ShowMyPageLogOfVac() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Employee loginUser = (Employee) request.getSession().getAttribute("loginUser");
		
		int userId = loginUser.getEmpid();
		
		ArrayList<LogOfVacation> list = new LogOfVacationService().ShowMyPageLogOfVac(userId);

		for (int i = 0; i < list.size(); i++) {
			if(list.get(i).getUseEnd() == null) {
				list.get(i).setType("반차");
			} else {
				list.get(i).setType("연차");
				list.get(i).setDays((int)(list.get(i).getUseEnd().getTime() - list.get(i).getUseStart().getTime()) / 1000 / 3600 / 24 + 1);
			}
		}
		
		String page = "";
		request.setAttribute("list", list);
		
		page = "views/myPage/vacation/LeftVacDays.jsp";
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
