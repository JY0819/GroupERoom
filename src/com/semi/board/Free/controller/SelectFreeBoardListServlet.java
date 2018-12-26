package com.semi.board.Free.controller;

import java.io.IOException;

import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.board.Free.model.service.FreeService;
import com.semi.board.Free.model.vo.Free;
import com.semi.board.Free.model.vo.PageInfo;


/**
 * Servlet implementation class SelectFreeBoardListServlet
 */
@WebServlet("/selectList.fr")
public class SelectFreeBoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectFreeBoardListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Free> list = new FreeService().selectList();
		
		String page ="";
		
		if(list != null) {
			request.setAttribute("list", list);
			page = "views/board/free/boardFree.jsp";
			
		}else {
			request.setAttribute("msg", "�����Խ��� ��ȸ ����");
			page="views/common/errorPage.jsp";
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
		
		//-------------------����¡ó��---------------------
		/*
		int currentPage;	//���� �������� ǥ��
		int limit;			//�� �������� �Խñ��� �� ���� ������ ������ ǥ��
		int maxPage;		//��ü �������� ������ ������
		int startPage;		//�� ���� ǥ�õ� �������� ������ ������
		int endPage;		//�� ���� ǥ�õ� �������� ������ ������
		
		//���� ������ ó��
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt((request.getParameter("currentPage")));
		}
		
		//�� �������� ������ ��� ����
		limit = 10;
		
		FreeService fs = new FreeService();

		//��ü �Խñ� �� ��ȸ
		int listCount = fs.getListCount();
		
		//�� ������ �� ���
		//���� ���, ��ϼ��� 123���� ������ ���� 13�������� �ʿ��ϴ�.
		maxPage = (int)((double)listCount / limit + 0.9);
		
		//���� �������� ������ ���� ������ ��
		//1, 11, 21, ...
		startPage = (((int)((double)currentPage / limit + 0.9)) -1) * limit + 1; 
	
		//��� �Ʒ��ʿ� ������ ������ ������ �� (10,20, 30, ...)
		endPage = startPage + 10 - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
	
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
	
		ArrayList<Free> list = new FreeService().selectList(currentPage, limit);
		
		String page = "";
		
		if(list != null) {
			page="views/board/free/boardFree.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "�����Խ��� ��ȸ ����");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
