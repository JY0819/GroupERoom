package com.semi.myPage.controller.Etc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.myPage.model.Etc.service.AttendService;

@WebServlet("/updateAttend")
public class updateAttend extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public updateAttend() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int empid = Integer.parseInt(request.getParameter("empid"));
		
		int result = new AttendService().updateAttend(empid);
		
		String page = "";
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if (result > 0) {
			out.println("<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script>");
			out.println("<script>\r\n" +
					"		alert('정상 처리 되었습니다.');\r\n" + 
					"		location.href='chkAttend';\r\n" + 
					"</script>");
		}
		out.flush();
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
