package com.semi.board.team.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.semi.admin.user.model.vo.Employee;
import com.semi.board.team.model.service.TeamService;
import com.semi.board.team.model.vo.Attachment;
import com.semi.board.team.model.vo.Team;
import com.semi.common.MyFileRenamePolicy;

/**
 * Servlet implementation class InsertFileTeamServlet
 */
@WebServlet("/insertFile.tm")
public class InsertFileTeamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertFileTeamServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
if(ServletFileUpload.isMultipartContent(request)) {
			System.out.println("----------------등록서블릿");
			//전송 파일 용량 제한 : 10MB로 제한
			int maxSize = 1024 * 1024 * 10;

			String root = request.getSession().getServletContext().getRealPath("/");

			System.out.println("root: "+root);

			String filePath = root + "uploadFiles/";

			//사용자가 올린 파일명을 그대로 저장하지 않는 것이 일반적이다.
			//1.같은 파일명이 있는 경우 이전 파일을 덮어 쓸 수 있다.
			//2.한글로된 파일명, 특수기호, 띄어쓰기는 서버에 따라 문제가 생길 수 도 있다.

			//DefaultFileRenamePolicy는 cos.jar 제공하는 클래스
			//같은 파일명이 존재하는지를 검사하고 있을 경우에는 뒤에 숫자를 붙여준다.
			//ex : aaa.zip, aaa1.zip, aaa2.zip

			/*
			MultipartRequest multiRequest
			= new MultipartRequest(request, filePath, maxSize, 
			"UTF-8", new DefaultFileRenamePolicy());*/



			MultipartRequest multiRequest = new MultipartRequest(request, filePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			System.out.println("servlet multiRequest : "+multiRequest);

			//다중 파일을 묶어서 업로드 하기 위해 컬렉션 사용
			//저장한 파일의 이름을 저장할 arrayList 생성
			ArrayList<String> saveFiles = new ArrayList<String>();

			//원본 파일의 이름을 저장할 ArrayList 생성 
			ArrayList<String> originFiles = new ArrayList<String>();

			//각 파일의 정보를 구해온 뒤 DB에 저장할 목적의 데이터를 꺼내온다.
			Enumeration<String> files = multiRequest.getFileNames();
			//Enumeration: 각각의 객체를 한 번에 하나씩 처리할 수 있음
			System.out.println("servlet files:"+files);
/*			String fileName=multiRequest.getFilesystemName("fileInput");
			System.out.println("fileName: "+fileName);*/
			while(files.hasMoreElements()) {//다음 요소가 있는지

				String name=files.nextElement();

				System.out.println("name : "+name); //name:실제 파일을 가져오기 위한 key역할을 함

				saveFiles.add(multiRequest.getFilesystemName(name));

				originFiles.add(multiRequest.getOriginalFileName(name));

				System.out.println("fileSystem name: "+multiRequest.getFilesystemName(name));

				System.out.println("originFile name: "+multiRequest.getOriginalFileName(name));
			}
			String multiTitle = multiRequest.getParameter("title");

			String multiContent = multiRequest.getParameter("content");

			System.out.println("multiTitle:"+multiTitle);

			System.out.println("multiContent:"+multiContent);
			
			System.out.println("servlet saveFiles"+originFiles+saveFiles);
			
			HttpSession session = request.getSession();
			Employee loginUser = (Employee)session.getAttribute("loginUser");
			String writer = String.valueOf(loginUser.getEmpid());
			
			System.out.println("writer: "+writer);
			// 객체 생성
			Team t = new Team();
			t.setbTitle(multiTitle);
			t.setbContent(multiContent);			
			t.setWriterId(String.valueOf(((Employee)(request.getSession().getAttribute("loginUser"))).getEmpid()));
			t.setDeptId(loginUser.getDeptId());

			//Attachment 객체 생성하여 arrayList 객체 생성
			ArrayList<Attachment> fileList = new ArrayList<Attachment>();

			//반복문 거꾸로 돌리기!!(아까 시스템아웃에 파일이름들 역순으로 나왔던 거 때문스)
			for(int i=originFiles.size() -1; i>=0; i--) {
System.out.println("도니");
				Attachment at = new Attachment();

				at.setFilePath(filePath);
				at.setOriginName(originFiles.get(i));
				at.setChangeName(saveFiles.get(i));
				System.out.println(at.getFilePath()
						+at.getChangeName());

				fileList.add(at);

			}
			System.out.println("servlet fileList사이즈 : "+fileList.size());

			int result = new TeamService().insertThumbnail(t, fileList);


			if(result > 0) {

				response.sendRedirect(request.getContextPath() 

						+ "/selectList.tm");

			}else {

				//실패시 저장된 사진 삭제	
				for(int i = 0; i < saveFiles.size(); i++) {

					//파일시스템에 저장된 이름으로 파일 객체 생성	
					File failedFile = new File(filePath + saveFiles.get(i));	

					failedFile.delete();

				}
				

				request.setAttribute("msg", "부서게시판 글 등록 실패!");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);

			}

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
