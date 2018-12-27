package com.semi.board.Free.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.semi.admin.user.model.vo.Employee;
import com.semi.board.Free.model.service.FreeService;
import com.semi.board.Free.model.vo.Free;

/**
 * Servlet implementation class InsertFreeBoardServlet
 */
@WebServlet("/insert.fr")
public class InsertFreeBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertFreeBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
	
		//작성자 가져오기
		HttpSession session = request.getSession();
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		String writer = String.valueOf(loginUser.getEmpid());
		
		Free f = new Free();
		f.setbTitle(title);
		f.setbContent(content);
		f.setWriterId(writer);
		
		int result = new FreeService().insertFree(f);
		
		String page="";
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath()+"/selectList.fr");
		}else {
			request.setAttribute("msg", "자유게시판 글 작성 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
