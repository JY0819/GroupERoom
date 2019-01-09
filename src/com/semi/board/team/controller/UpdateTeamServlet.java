package com.semi.board.team.controller;

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
 * Servlet implementation class UpdateTeamServlet
 */
@WebServlet("/updateTeam.tm")
public class UpdateTeamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateTeamServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(ServletFileUpload.isMultipartContent(request)) {
			System.out.println("----------수정서블릿----------");
			//전송 파일 용량 제한 : 10MB로 제한
			int maxSize = 1024 * 1024 * 10;

			String root = request.getSession().getServletContext().getRealPath("/");

			System.out.println("root: "+root);

			String filePath = root + "uploadFiles/";


			MultipartRequest multiRequest = new MultipartRequest(request, filePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			System.out.println("servlet multiRequest : "+multiRequest);

			
			String preFile = multiRequest.getParameter("preFile");
			System.out.println("preFile: "+preFile);
			
			String fileName = request.getParameter("fileName");
			System.out.println("select servlet fileName: "+fileName);
			
			if(Integer.parseInt(fileName) !=0) {
				int originAno = Integer.parseInt(multiRequest.getParameter("originAno"));
				
				//다중 파일을 묶어서 업로드 하기 위해 컬렉션 사용
				//저장한 파일의 이름을 저장할 arrayList 생성
				ArrayList<String> saveFiles = new ArrayList<String>();

				//원본 파일의 이름을 저장할 ArrayList 생성 
				ArrayList<String> originFiles = new ArrayList<String>();

				//각 파일의 정보를 구해온 뒤 DB에 저장할 목적의 데이터를 꺼내온다.
				Enumeration<String> files = multiRequest.getFileNames();
				//Enumeration: 각각의 객체를 한 번에 하나씩 처리할 수 있음
				
				
				
				
				while(files.hasMoreElements()) {//다음 요소가 있는지
					String name=files.nextElement();
					System.out.println("name : "+name); //name:실제 파일을 가져오기 위한 key역할을 함

					String newFile=multiRequest.getFilesystemName(name);
					System.out.println("newFile: "+newFile);
					

					if(newFile == null) {//수정 시 새로운 첨부 파일 없을 경우
						saveFiles.add(multiRequest.getFilesystemName(preFile));

						originFiles.add(multiRequest.getOriginalFileName(preFile));
						
						System.out.println("fileSystem name: "+multiRequest.getFilesystemName(preFile));

						System.out.println("originFile name: "+multiRequest.getOriginalFileName(preFile));
					

					}else {

					//수정 시 새로운 파일을 첨부 한 경우
						saveFiles.add(multiRequest.getFilesystemName(newFile));

						originFiles.add(multiRequest.getOriginalFileName(newFile));
						System.out.println("newFile fileSystem name: "+multiRequest.getFilesystemName(newFile));

						System.out.println("newFile originFile name: "+multiRequest.getOriginalFileName(newFile));
						 		
						
						saveFiles.add(newFile);
						
						originFiles.add(multiRequest.getOriginalFileName(name));
						System.out.println("@@@@@@@@@@@saveFiles: "+saveFiles);
						System.out.println("originFiles: "+originFiles);
					}
					
					
			
				}
				String multiTitle = multiRequest.getParameter("title");

				String multiContent = multiRequest.getParameter("content");
				int bno = Integer.parseInt(multiRequest.getParameter("bno"));
			
				
				System.out.println("multiTitle:"+multiTitle);

				System.out.println("multiContent:"+multiContent);
				
				System.out.println("servlet saveFiles"+originFiles+saveFiles);
				
				HttpSession session = request.getSession();
				Employee loginUser = (Employee)session.getAttribute("loginUser");
				String writer = String.valueOf(loginUser.getEmpid());
				
				System.out.println("writer: "+writer);
				// 객체 생성
				Team t = new Team();
				t.setBno(bno);
				t.setbTitle(multiTitle);
				t.setbContent(multiContent);			
				t.setWriterId(String.valueOf(((Employee)(request.getSession().getAttribute("loginUser"))).getEmpid()));

				//Attachment 객체 생성하여 arrayList 객체 생성
				Attachment at = new Attachment();

				

					at.setFilePath(filePath);
					at.setOriginName(originFiles.get(1));
					at.setChangeName(saveFiles.get(1));
					System.out.println(at.getFilePath()
							+at.getChangeName());

				

				int result = new TeamService().updateTeam(t, at, originAno);
				
	System.out.println("servlet result: "+result);
				if(result > 0) {

					response.sendRedirect(request.getContextPath() 

							+ "/selectList.tm");

				}/*else {

					//실패시 저장된 사진 삭제	
					for(int i = 0; i < saveFiles.size(); i++) {

						//파일시스템에 저장된 이름으로 파일 객체 생성	
						File failedFile = new File(filePath + saveFiles.get(i));	

						failedFile.delete();

					}	
					

					request.setAttribute("msg", "첨부파일 등록 실패!");
					request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);

				}*/
			}else {
					//첨부파일 없는 글 수정
				int bno = Integer.parseInt(multiRequest.getParameter("bno"));	
				String title=multiRequest.getParameter("title");
					String writer=multiRequest.getParameter("writer");
				
					String content=multiRequest.getParameter("content");
					
					System.out.println("bno : "+bno);
					System.out.println("title : "+title);
					System.out.println("writer : "+writer);

					Team t = new Team();
					t.setBno(bno);
					t.setbTitle(title);
					t.setbContent(content);			
					t.setWriterId(String.valueOf(((Employee)(request.getSession().getAttribute("loginUser"))).getEmpid()));

					int result=new TeamService().updateNoFileTeam(t);
					
					String page="";
					if(result>0) {
						response.sendRedirect(request.getContextPath() 
								+ "/selectList.tm");
						}else {
						page="views/common/errorPage.jsp";
						request.setAttribute("msg", "부서게시판 첨부파일 없는 글 수정 실패");
						request.getRequestDispatcher(page).forward(request, response);
					}
					
					
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
