package com.semi.approval.controller.defaultsettingController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.approval.model.service.defaultSettingService.DefaultSettingService;

/**
 * Servlet implementation class DefaultSettingServlet
 */
@WebServlet("/pwdCheck.pc")
public class DefaultSettingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DefaultSettingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nowpwd = request.getParameter("nowpwd");
		String userId = request.getParameter("userId");
		int result = new DefaultSettingService().loginCheck(nowpwd,userId);
		PrintWriter out = response.getWriter();
		if(result>0) {
			out.append("success");
		}else {
			out.append("fail");
		}
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
