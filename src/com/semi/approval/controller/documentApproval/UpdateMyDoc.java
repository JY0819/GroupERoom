package com.semi.approval.controller.documentApproval;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.approval.approve.model.vo.DetailDoc;
import com.semi.approval.model.service.updateMyDocService.UpdateMyDocService;

@WebServlet("/updatemydoc.ud")
public class UpdateMyDoc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateMyDoc() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int docNum = Integer.valueOf(request.getParameter("docNum"));
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		System.out.println("docNum : " +docNum);
		System.out.println("제목 : "+title);
		System.out.println("내용 : "+contents);
		
		DetailDoc detaildoc = new DetailDoc();
		detaildoc.setTitle(title);
		detaildoc.setContents(contents);
		detaildoc.setManagedocno(docNum);
		int result = new UpdateMyDocService().updateMyDoc(detaildoc);
		
		String page ="";
		if(result >0) {
		page = "/semi/documentAppr.da?docno="+docNum;
		response.sendRedirect(page);
			
		}
		else {
			System.out.println("에러");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
