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
 * Servlet implementation class InsertMemoServlet
 */
@WebServlet("/insert.memo")
public class InsertMemoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertMemoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memoContents=request.getParameter("memoContents");
		int empId=Integer.parseInt(request.getParameter("empId"));
		
		System.out.println("서블릿 : "+empId+"/"+memoContents);
		
		Memo reqMemo=new Memo();
		
		reqMemo.setEmpId(empId);
		reqMemo.setMemoContents(memoContents);
		
		int result=new MemoService().insertMemo(reqMemo);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		if(result>0) {	//다 쓰면 result > memo로 바꾸기
			new Gson().toJson(result, response.getWriter());
		}else {
			new Gson().toJson("메모 저장 실패", response.getWriter());
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
