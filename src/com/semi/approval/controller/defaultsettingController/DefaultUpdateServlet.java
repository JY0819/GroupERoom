package com.semi.approval.controller.defaultsettingController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.approval.model.service.defaultSettingService.DefaultSettingService;

/**
 * Servlet implementation class DefaultUpdateServlet
 */
@WebServlet("/updatesetting.up")
public class DefaultUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DefaultUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String path = request.getParameter("userId");
		String[] update = path.split(",");
		String userId = update[0];
		String newpwd2 = update[1];
		
		System.out.println("아이디 : " +userId);
		System.out.println("비밀번호 : " + newpwd2);
		int result = new DefaultSettingService().updatePwd(userId,newpwd2);
		String page = "";
		
		if(result>0) {
		
		
		page = "views/approval/PreferencesBox/defaultSetting.jsp";
	}else {
		request.setAttribute("msg", "비밀번호변경실패");
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
