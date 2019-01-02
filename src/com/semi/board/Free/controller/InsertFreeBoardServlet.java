package com.semi.board.Free.controller;

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
import com.semi.board.Free.model.service.FreeService;
import com.semi.board.Free.model.vo.Attachment;
import com.semi.board.Free.model.vo.Free;
import com.semi.common.MyFileRenamePolicy;

/**
 * Servlet implementation class InsertFreeBoardServlet
 */
@WebServlet("/insert.fr")
public class InsertFreeBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertFreeBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
	
		//작성자 가져오기
		HttpSession session = request.getSession();
		Employee loginUser = (Employee)session.getAttribute("loginUser");
		String writer = String.valueOf(loginUser.getEmpid());
		
		//첨부파일
		if(ServletFileUpload.isMultipartContent(request)) {
			//전송파일 용량 제한 : 10mb로 제한
			int maxSize = 1024 * 1024 * 10;
			String root = request.getSession().getServletContext().getRealPath("/");
			System.out.println("servlet 첨부파일 루트: "+root);
			
			String filePath = root + "images/board/uploadFiles/";
			
			MultipartRequest multiRequest = new MultipartRequest(request, filePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			//저장한 파일의 이름을 저장할 arrayList 생성
			ArrayList<String> saveFiles = new ArrayList<String>();
			
			//원본 파일의 이름을 저장할 ArrayList 생성
			ArrayList<String> originFiles = new ArrayList<String>();
			
			//각 파일의 정보를 구해온 뒤 DB에 저장할 목적의 데이터를 꺼내온다.
			Enumeration<String> files = multiRequest.getFileNames();
			
			while(files.hasMoreElements()) {//다음 요소가 있는 지
				String name = files.nextElement();
				
				System.out.println("파일 이름 : "+name);
				
				saveFiles.add(multiRequest.getFilesystemName(name));
				originFiles.add(multiRequest.getOriginalFileName(name));
				
				System.out.println("fileSystem name : "+multiRequest.getFilesystemName(name));
				System.out.println("originFile name : "+multiRequest.getOriginalFileName(name));
				
				Free f = new Free();
				f.setbTitle(title);
				f.setbContent(content);
				f.setWriterId(writer);
				
				//Attachment 객체 생성하여 arrayList 객체 생성
				ArrayList<Attachment> fileList = new ArrayList<Attachment>();
				
				//반복문 거꾸로 돌리기(파일 이름들이 역순으로 나와서??)
				for(int i=originFiles.size() -1; i>=0; i--) {
					Attachment at = new Attachment();
					at.setFilePath(filePath);
					at.setOriginName(originFiles.get(i));
					at.setChangeName(saveFiles.get(i));
					
					fileList.add(at);
				}
				int result = new FreeService().insertAttachment(f, fileList);
				
				String page="";
				
				if(result > 0) {
					response.sendRedirect(request.getContextPath()+"/selectList.fr");
				}else {
					//실패 시 저장된 사진 삭제
					for(int i=0; i<saveFiles.size();i++) {
						//파일시스템에 저장된 이름으로 파일 객체 생성
						File failedFile = new File(filePath + saveFiles.get(i));
						
						failedFile.delete();
					}
				
				}
			
				request.setAttribute("msg", "자유게시판 글 작성 실패");
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
