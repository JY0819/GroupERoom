package com.semi.approval.document.controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.admin.user.model.vo.Employee;
import com.semi.approval.document.service.DocumentService;
import com.semi.approval.document.vo.Document;
import com.semi.approval.document.vo.SumEmpInfo;
import com.semi.common.dao.AddressDao;
import com.semi.common.service.AddressService;
import com.semi.common.vo.DeptEmp;

@WebServlet("/selectDocumentNum.sdn")
public class SelectDocumentNumServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectDocumentNumServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//사원번호, 문서번호, 번호 불러오기
		String item = request.getParameter("id");
		String idItem = item.substring(0,item.length()-2);
		int id = Integer.parseInt(idItem);
		String pageName = item.substring(item.length()-2, item.length());
		
		Document document = new DocumentService().selectForm(id);
		System.out.println("페이지네임: " + pageName);
		System.out.println("id: " + id);
		//부서와 사원 불러오기
		HashMap<Integer, ArrayList<SumEmpInfo>> hmap = new DocumentService().selectDept();
		
		HashMap<String, ArrayList<DeptEmp>> address=new AddressService().selectDeptEmp();
		ArrayList<String> deptIdList=new AddressService().selectDeptIdList();
		
		//완료 후 페이지로 보내기
		String page = "";
		if(pageName.equals("va")) {
			if(document != null && hmap != null && address != null && deptIdList != null) {
				request.setAttribute("doc", document);
				request.setAttribute("map", hmap);
				request.setAttribute("address", address);
				request.setAttribute("deptIdList", deptIdList);
				if(pageName.equals("va")) {
					page = "views/approval/documentList/vacationDocument.jsp";
					request.getRequestDispatcher(page).forward(request, response);
				}
			}
		}else if(pageName.equals("wo")) {
			if(document != null && hmap != null && address != null && deptIdList != null) {
				request.setAttribute("doc", document);
				request.setAttribute("map", hmap);
				request.setAttribute("address", address);
				request.setAttribute("deptIdList", deptIdList);
				if(pageName.equals("va")) {
					page = "views/approval/documentList/workDocument.jsp";
					request.getRequestDispatcher(page).forward(request, response);
				}
			}
		}else if(pageName.equals("em")){
			if(document != null && hmap != null && address != null && deptIdList != null) {
				request.setAttribute("doc", document);
				request.setAttribute("map", hmap);
				request.setAttribute("address", address);
				request.setAttribute("deptIdList", deptIdList);
				if(pageName.equals("va")) {
					page = "views/approval/documentList/employmentDocument.jsp";
					request.getRequestDispatcher(page).forward(request, response);
				}
			} 
		}else {
			page = "views/approval/common/errorPage.jsp";
			request.setAttribute("msg", "문서양식 불러오기 실패");
			request.getRequestDispatcher(page).forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
