package com.semi.memo.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.semi.memo.model.service.MemoService;
import com.semi.memo.model.vo.Memo;

/**
 * Servlet implementation class SelectMemoServlet
 */
@WebServlet("/select.memo")
public class SelectMemoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectMemoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int empId=Integer.parseInt(request.getParameter("empId"));
		System.out.println(empId);
		
		Memo memo=new MemoService().selectMemo(empId);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		if(memo!=null) {
			new Gson().toJson(memo, response.getWriter());
		}else {
			new Gson().toJson("작성된 메모가 없습니다", response.getWriter());
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
