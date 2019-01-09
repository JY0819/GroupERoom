package com.semi.board.Free.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.board.Free.model.service.FreeService;
import com.semi.board.Free.model.vo.Attachment;
import com.semi.board.Free.model.vo.Free;

/**
 * Servlet implementation class SelectFreeServlet
 */
@WebServlet("/selectFree.fr")
//수정용
public class SelectFreeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectFreeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println("select servlet num: "+num);

		String fileName = request.getParameter("fileName");
		System.out.println("select servlet fileName: "+fileName);
		
		String page="";
		
		
		
		
		if(Integer.parseInt(fileName) != 0) {
			HashMap<String, Object> hmap = new FreeService().editOne(num);
			Free f = (Free)hmap.get("Free");
			Attachment at 
	        = (Attachment)hmap.get("attachment");
			
			if(f != null) {
				page="views/board/free/modifyFree.jsp";
				request.setAttribute("f", f);
				request.setAttribute("at", at);
			}else {
				page="views/common/errorPage.jsp";
				request.setAttribute("msg", "자유 게시판 글 수정 상세보기 실패");
			}
		}else {
			Free f=new FreeService().editNoFile(num);
			
			System.out.println("노파일 수정 상세보기 가기 전 num: "+num);
			System.out.println("노파일 수정 상세보기 가기 전 f : "+f);
			if(f!=null) {
				page="views/board/free/modifyFree.jsp";
				request.setAttribute("f", f);
			}else {
				page="views/common/errorPage.jsp";
				request.setAttribute("msg", "게시글 수정용 상세보기 실패!");
			
			}
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
