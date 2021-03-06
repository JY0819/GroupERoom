package com.semi.admin.user.controller;

import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.Enumeration;
import java.util.GregorianCalendar;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.semi.admin.user.model.service.EmployeeService;
import com.semi.admin.user.model.vo.Employee;
import com.semi.admin.user.model.vo.LogDepartment;
import com.semi.admin.user.model.vo.LogPosition;
import com.semi.common.MyFileRenamePolicy;
import com.semi.common.vo.Attachments;

@WebServlet("/insertMember.me")
public class InsertMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertMemberServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10;
			
			String root = request.getSession().getServletContext().getRealPath("/");
			
			/*
			String filePath = "";
			String saveFolder = "assets/images/upload_EmpImg/";
			
			ServletContext context = this.getServletContext();
			filePath = context.getRealPath(saveFolder);
			System.out.println("서블릿 상 경로 : " + filePath);*/

			System.out.println(root);

			String filePath = root + "assets/images/upload_EmpImg/";
			
			MultipartRequest multiRequest = new MultipartRequest(request, filePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			ArrayList<String> saveFiles = new ArrayList<String>();
			ArrayList<String> originFiles = new ArrayList<String>();
			Enumeration<String> files = multiRequest.getFileNames();
		
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				
				saveFiles.add(multiRequest.getFilesystemName(name));
				originFiles.add(multiRequest.getOriginalFileName(name));
			}
			
			Integer multiUserId = Integer.parseInt(multiRequest.getParameter("userId"));
			String multiUserName = multiRequest.getParameter("userName");
			String multiUserPwd = setSha512(multiRequest.getParameter("userPwd"));
			String multiGender = multiRequest.getParameter("gender");
			String multiPhone = multiRequest.getParameter("phone");
			String multiAddress = multiRequest.getParameter("address");
			String multiBirth = multiRequest.getParameter("birth");
			String miltiEntryDay = multiRequest.getParameter("entryDay");
			String multiAdminYN = multiRequest.getParameter("adminYN");
			String multiApprovePwd = multiRequest.getParameter("approvePwd");
			String multiDept = multiRequest.getParameter("dept");
			String multiPosition = multiRequest.getParameter("position");
			Integer multiVacCount = Integer.parseInt(multiRequest.getParameter("vacCount"));
		

			// 사원 생일
			java.sql.Date birth = null;
			if(multiBirth != "") {
				String[] dateArr = multiBirth.split("-");
				int[] drr = new int[dateArr.length];
				for(int i = 0; i < dateArr.length; i++) {
					drr[i] = Integer.parseInt(dateArr[i]);
				}
				
				// GregorianCalendar
				birth = new java.sql.Date(new GregorianCalendar(drr[0], drr[1] - 1, drr[2]).getTimeInMillis());
			} else {
				birth = new java.sql.Date(new GregorianCalendar().getTimeInMillis());
			}
			
			// 사원 입사일
			java.sql.Date entryday = null;
			if(miltiEntryDay != "") {
				String[] dateArr = miltiEntryDay.split("-");
				int[] drr = new int[dateArr.length];
				for(int i = 0; i < dateArr.length; i++) {
					drr[i] = Integer.parseInt(dateArr[i]);
				}
				
				// GregorianCalendar
				entryday = new java.sql.Date(new GregorianCalendar(drr[0], drr[1] - 1, drr[2]).getTimeInMillis());
			} else {
				entryday = new java.sql.Date(new GregorianCalendar().getTimeInMillis());
			}
		
			
			Employee emp = new Employee();
			emp.setEmpid(multiUserId);
			emp.setEmpName(multiUserName);
			emp.setEmpPwd(multiUserPwd);
			emp.setEmpGender(multiGender);
			emp.setEmpPhone(multiPhone);
			emp.setEmpAddr(multiAddress);
			emp.setEmpBirth(birth);
			emp.setEntryDay(entryday);
			emp.setAdminAuthority(multiAdminYN);
			emp.setApprovePwd(multiApprovePwd);
			emp.setEmpVacCount(multiVacCount);
			
			LogDepartment ld = new LogDepartment();
			ld.setDeptId(multiDept);
			
			LogPosition lp = new LogPosition();
			lp.setPositionId(multiPosition);
			
			
			ArrayList<Attachments> fileList = new ArrayList<Attachments>();
			for(int i = originFiles.size() - 1; i >= 0; i--) {
				Attachments at = new Attachments();
				at.setAttachPath(filePath);
				at.setAttachPreName(originFiles.get(i));
				at.setAttachName(saveFiles.get(i));
				
				fileList.add(at);
			}
																		
			
			int result = new EmployeeService().insertEmployee(emp, fileList, ld, lp);
			
			if(result > 0) {
				request.getSession().setAttribute("msg", "사원 등록에 성공했습니다.");
				response.sendRedirect("/semi/memberList.me");
			} else {
				for(int i = 0; i < saveFiles.size(); i++) {
					File failedFile = new File(filePath + saveFiles.get(i));
					// true / false 리턴
					failedFile.delete();
				}
				request.setAttribute("msg", "사원 등록에 실패했습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private String setSha512(String pwd) {
		String encPwd = "";

		try {
			MessageDigest md = MessageDigest.getInstance("SHA-512");
			byte[] bytes = pwd.getBytes(Charset.forName("UTF-8"));
			md.update(bytes);
			
			encPwd = Base64.getEncoder().encodeToString(md.digest());
			
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return encPwd;
	}

}
