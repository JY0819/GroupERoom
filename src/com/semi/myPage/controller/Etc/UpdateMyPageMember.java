package com.semi.myPage.controller.Etc;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.semi.admin.user.model.service.EmployeeService;
import com.semi.admin.user.model.vo.Employee;
import com.semi.common.MyFileRenamePolicy;
import com.semi.common.vo.Attachments;

@WebServlet("/updateMember.me")
public class UpdateMyPageMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateMyPageMember() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 첨부파일
		/*String title = request.getParameter("title");
		System.out.println(title);*/
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10;
			
			String root = request.getSession().getServletContext().getRealPath("/");
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
			String multiUserPwd = "";
			String multiPhone = "";
			String multiAddress = "";
			String multiApprovePwd = "";
			
			Employee loginUser = (Employee)request.getSession().getAttribute("loginUser");
			
			if (multiRequest.getParameter("userPwd") == null) {
				multiUserPwd = loginUser.getEmpPwd();
			} else {
				multiUserPwd = multiRequest.getParameter("userPwd");
			}
			
			if (multiRequest.getParameter("phone") == null) {
				multiUserPwd = loginUser.getEmpPhone();
			} else {
				multiUserPwd = multiRequest.getParameter("phone");
			}
			
			if (multiRequest.getParameter("address") == null) {
				multiUserPwd = loginUser.getEmpAddr();
			} else {
				multiUserPwd = multiRequest.getParameter("address");
			}
			
			if (multiRequest.getParameter("approvePwd") == null) {
				multiUserPwd = loginUser.getApprovePwd();
			} else {
				multiUserPwd = multiRequest.getParameter("approvePwd");
			}
			
			Employee emp = new Employee();
			emp.setEmpid(multiUserId);
			emp.setEmpPwd(multiUserPwd);
			emp.setEmpPhone(multiPhone);
			emp.setEmpAddr(multiAddress);
			emp.setApprovePwd(multiApprovePwd);
			
			ArrayList<Attachments> fileList = new ArrayList<Attachments>();
			for(int i = originFiles.size() - 1; i >= 0; i--) {
				Attachments at = new Attachments();
				at.setAttachPath(filePath);
				at.setAttachPreName(originFiles.get(i));
				at.setAttachName(saveFiles.get(i));
				
				fileList.add(at);
			}
																				
					
			int result = new EmployeeService().updateEmployee(emp, fileList);
					
			if(result > 0) {
				request.getSession().setAttribute("msg", "사원 등록에 성공했습니다.");
				response.sendRedirect("views/common/successPage.jsp");
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

}
