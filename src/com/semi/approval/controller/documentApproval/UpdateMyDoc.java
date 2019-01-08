package com.semi.approval.controller.documentApproval;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.approval.model.service.updateMyDocService.UpdateMyDocService;

/**
 * Servlet implementation class UpdateMyDoc
 */
@WebServlet("/updatemydoc.ud")
public class UpdateMyDoc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMyDoc() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String docNum = request.getParameter("docNum");
		System.out.println(docNum);
		
		//int result = new UpdateMyDocService().updateMyDoc(docno);
		
		/*String page ="";
		page = "/semi/documentAppr.da?docNo="+docNum;
		response.sendRedirect(page);*/
		/*if(result >0) {
			
		}
		else {
			System.out.println("에러");
		}*/
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
