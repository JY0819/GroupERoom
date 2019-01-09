package com.semi.myPage.controller.Etc;

import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Base64;
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

@WebServlet("/updateMyPageInfo")
public class UpdateMyPageMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateMyPageMember() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 첨부파일
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
			String multiUserPwd = setSha512(multiRequest.getParameter("userPwd"));
			String multiPhone = multiRequest.getParameter("phone");
			String multiAddress = multiRequest.getParameter("address");
			
			Employee emp = new Employee();
			emp.setEmpid(multiUserId);
			emp.setEmpPwd(multiUserPwd);
			emp.setEmpPhone(multiPhone);
			emp.setEmpAddr(multiAddress);
			
			ArrayList<Attachments> fileList = new ArrayList<Attachments>();
			for(int i = originFiles.size() - 1; i >= 0; i--) {
				Attachments at = new Attachments();
				at.setAttachPath(filePath);
				at.setAttachPreName(originFiles.get(i));
				at.setAttachName(saveFiles.get(i));
				
				fileList.add(at);
			}
																				
					
			int result = new EmployeeService().mypageUpdateEmployee(emp, fileList);
					
			if(result > 0) {
				System.out.println("사원 등록에 성공했습니다.");
				System.out.println("다시 로그인 하여 세션을 재 부여합니다.");
				request.getSession().setAttribute("loginUser", emp);
				response.sendRedirect("setSession");
			} else {
				
				for(int i = 0; i < saveFiles.size(); i++) {
					File failedFile = new File(filePath + saveFiles.get(i));
					// true / false 리턴
					failedFile.delete();
				}
				request.setAttribute("msg", "수정에 실패했습니다.");
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
			// SHA-512 내장 메소드 사용 어떤식으로 암호화 처리 되는지는 알 수 없음
			MessageDigest md = MessageDigest.getInstance("SHA-512");
			byte[] bytes = pwd.getBytes(Charset.forName("UTF-8"));
			md.update(bytes); // 암호화 처리된 게 bytes 안에 있음(아직)
			
			// 암호화 처리 된게 문자열로 바뀐다.
			encPwd = Base64.getEncoder().encodeToString(md.digest());
			
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		System.out.println(encPwd + "으로 비밀번호가 변경되었음.");
		return encPwd;
	}

}
