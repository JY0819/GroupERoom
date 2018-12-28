package com.semi.approval.document.controller;

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
import com.semi.approval.document.service.DocumentService;
import com.semi.approval.document.vo.Document;
import com.semi.common.MyFileRenamePolicy;


@WebServlet("/insertDocument.id")
public class InsertDocumentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertDocumentServlet() {
        super();
    }

	/*protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request)) {
			//파일이 담겨있으면 true 반환
			
			//전송 파일 용량 제한 : 10MB로 제한
			int maxSize = 1024 * 1024 * 10; 
			//1024 * 1024 -> 1mb
			
			String root = request.getSession().getServletContext().getRealPath("/");
			
			System.out.println(root);
			//톰캣 서버옵션 맨 위 체크해야 내 경로로 파일 경로가 뜬다.
			//체크 안하면 톰캣경로로 뜸
			
			String filePath = root + "assets/images/approval/approvalUpload";
		
			//사용자가 올린 파일명을 그대로 저장하지 않는 것이 일반적이다.
			//1. 같은 파일명이 있는 경우 이전 파일을 덮어 쓸 수 있다.
			//2. 한글로된 파일명, 특수기호, 띄어쓰기는 서버에 따라 문제가 생길 수 도 있다.
			
			//DefaultFileRenamePolicy는 cos.jar 파일에서 제공하는 클래스이다.
			//같은 파일명이 존재하는지를 검사하고 있을 경우에는 뒤에 숫자를 붙여준다.
			//ex : aaa.zip, aaa1.zip, aaa2.zip 이런식으로 붙는다.
			
			//MultipartRequest multiRequest = new MultipartRequest(request, filePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
			MultipartRequest multipartRequest = new MultipartRequest(request, filePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			//다중 파일을 묶어서 업로드 하기 위해 컬렉션 사용
			//저장한 파일의 이름을 저장할 arrayList 생성
			ArrayList<String> saveFiles = new ArrayList<String>();
			
			//원본 파일의 이름을 저장 할 ArrayList 생성
			ArrayList<String> originFiles = new ArrayList<String>();
			
			//각 파일의 정보를 구해온 뒤 DB에 저장할 목적의 데이터를 꺼내온다.
			Enumeration<String> files = multipartRequest.getFileNames();
			
			while(files.hasMoreElements()) {
				//다음요소가 있는지 물어보는것
				String name = files.nextElement();
				
				System.out.println("name : " + name);
				//실제 파일의 정보를 가져오기 위한 키의 역할함
				
				saveFiles.add(multipartRequest.getFilesystemName(name));
				originFiles.add(multipartRequest.getOriginalFileName(name));
				
				System.out.println("fileSystem name : " + multipartRequest.getFilesystemName(name));
				System.out.println("originFile name : " + multipartRequest.getOriginalFileName(name));
			}
			
			String name = multipartRequest.getParameter("num");
			String multiContent = multipartRequest.getParameter("content");
			System.out.println(multiTitle);
			System.out.println(multiContent);
		
			
			//문서객체생성
			Document document = new Document();
			document.set
			b.setbTitle(multiTitle);
			b.setbContent(multiContent);
			b.setbWriter(String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getUno()));
			
			//Attachment 객체 생성하여 arrayList 객체 생성
			ArrayList<Attachment> fileList = new ArrayList<Attachment>();
			for(int i=originFiles.size() - 1; i>=0; i--) {
				Attachment at = new Attachment();
				at.setFilePath(filePath);
				at.setOriginName(originFiles.get(i));
				at.setChangeName(saveFiles.get(i));
				fileList.add(at);
			}
			int result = new BoardService().insertThumbnail(b, fileList);
			
			if(result > 0) {
				response.sendRedirect(request.getContextPath() + "/selectList.tn");
			}else {
				//실패시 저장된 사진 삭제
				for(int i=0; i<saveFiles.size(); i++) {
					//파일시스템에 저장된 이름으로 파일 객체 생성
					File failedFile = new File(filePath + saveFiles.get(i));
					
					//파일을 지우고 true, false 하나 리턴함
					failedFile.delete();
				}
				
				request.setAttribute("msg", "사진게시판 등록 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		}	
	}*/

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
