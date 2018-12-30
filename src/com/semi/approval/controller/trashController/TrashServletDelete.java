package com.semi.approval.controller.trashController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.approval.model.dao.trashDao.TrashDao;
import com.semi.approval.model.service.trashService.TrashService;

/**
 * Servlet implementation class TrashServletDelete
 */
@WebServlet("/deleteTrash.tr")
public class TrashServletDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrashServletDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] appr = request.getParameter("apprno").split(",");
		int[] apprno = new int[appr.length];
		
		for(int i =0;i<appr.length;i++) {
			
			apprno[i] = Integer.parseInt(appr[i]);
			
		}
		int result = new TrashService().deleteTrash(apprno);
		
		String page ="";

		if(result>0) {
			response.sendRedirect("/semi/selecttrash.tr");
		}else {
			request.setAttribute("msg", "휴지통 업데이트실패!");
			request.getRequestDispatcher("views/approval/common/errorPage.jsp");
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
