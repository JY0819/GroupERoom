package com.semi.approval.document.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.semi.approval.approve.model.vo.ApprLine;
import com.semi.approval.document.service.DocumentService;
import com.semi.approval.document.vo.Document;
import com.semi.common.MyFileRenamePolicy;
import com.semi.common.vo.Attachments;


@WebServlet("/insertDocument.id")
public class InsertDocumentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertDocumentServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
			
			int num = Integer.parseInt(multipartRequest.getParameter("num"));
			String appr1 = multipartRequest.getParameter("person1");
			String appr2 = multipartRequest.getParameter("person2");
			String appr3 = multipartRequest.getParameter("person3");
			int docNum = Integer.parseInt(multipartRequest.getParameter("docNum"));
			int empNum = Integer.parseInt(multipartRequest.getParameter("empNum"));
			String sTemp = multipartRequest.getParameter("startDate");
			String eTemp = multipartRequest.getParameter("endDate");
			String documentKind = multipartRequest.getParameter("documentKind");
			String title = multipartRequest.getParameter("title");
			String wDate = multipartRequest.getParameter("date");
			String reason = multipartRequest.getParameter("reason");
			String content = multipartRequest.getParameter("content");
			
			//결재번호 받기
			int count = 0;
			System.out.println("결재할 사원번호: "  + multipartRequest.getParameter("empNo1"));
			System.out.println("결재할 사원번호: "  + multipartRequest.getParameter("empNo2"));
			System.out.println("결재할 사원번호: "  + multipartRequest.getParameter("empNo3"));
			if(!multipartRequest.getParameter("empNo1").equals("")) {
				count++;
				if(!multipartRequest.getParameter("empNo2").equals("")) {
					count++;
					if(!multipartRequest.getParameter("empNo3").equals("")) {
						count++;
					}
				}
			}
			System.out.println("카운트" + count);
			int[] apprNo = new int[count];
			if(count > 0) {
				for(int i=0; i<apprNo.length; i++) {
					apprNo[i] = Integer.parseInt(multipartRequest.getParameter("empNo1"));
					if(i > 0 && count > 1) {
						apprNo[i] = Integer.parseInt(multipartRequest.getParameter("empNo2"));
						if(i > 1 && count > 2) {
							apprNo[i] = Integer.parseInt(multipartRequest.getParameter("empNo3"));
						}
					}
				}
			}else {
				apprNo = null;
			}
			
			//분류 이름에 따라 숫자로 넣음
			if(documentKind.equals("휴가신청서")) {
				documentKind = "1";
			}else if(documentKind.equals("재직증명서")) {
				documentKind = "2";
			}else {
				documentKind = "3";
			}
			
			Date startDay = null;
			Date endDay = null;
			Date writeDay = null;
			
			String sDate = sTemp.substring(0, sTemp.length()-6);
			String sTime = sTemp.substring(sTemp.length()-6, sTemp.length());
			String eDate = eTemp.substring(0, eTemp.length()-6);
			String eTime = eTemp.substring(eTemp.length()-6, eTemp.length());
			if(sDate != "" && eDate != "" && wDate != "") {
				//휴가시작 날짜
				String[] dateArr = sDate.split("-");

				int[] drr = new int[dateArr.length];
				
				for(int i=0; i<dateArr.length; i++) {
						drr[i] = Integer.parseInt(dateArr[i]);
				}
				startDay = new java.sql.Date(new GregorianCalendar(drr[0], drr[1]-1, drr[2]).getTimeInMillis());
				
				//==============================================================
				//휴가끝 날짜
				dateArr = eDate.split("-");
				drr = new  int[dateArr.length];
				
				for(int i=0; i<dateArr.length; i++) {
					drr[i] = Integer.parseInt(dateArr[i]);
				}
				endDay = new java.sql.Date(new GregorianCalendar(drr[0], drr[1]-1, drr[2]).getTimeInMillis());
				
				//==============================================================
				//작성일 날짜
				dateArr = wDate.split("-");
				drr = new  int[dateArr.length];
				
				for(int i=0; i<dateArr.length; i++) {
					drr[i] = Integer.parseInt(dateArr[i]);
				}
				writeDay = new java.sql.Date(new GregorianCalendar(drr[0], drr[1]-1, drr[2]).getTimeInMillis());
				
				//==============================================================
				//아닐경우
			}else {
				startDay = new java.sql.Date(new GregorianCalendar().getTimeInMillis());
				endDay = new java.sql.Date(new GregorianCalendar().getTimeInMillis());
				writeDay = new java.sql.Date(new GregorianCalendar().getTimeInMillis());
			}
			
			System.out.println("번호: " + num);
			System.out.println("결재자1: " + appr1);
			System.out.println("결재자2: " + appr2);
			System.out.println("결재자3: " + appr3);
			System.out.println("문서번호: " + docNum);
			System.out.println("사원번호: " + empNum);
			System.out.println("분류: " + documentKind);
			System.out.println("제목: " + title);
			System.out.println("사유: " + reason);
			System.out.println("내용: " + content);
			System.out.println("휴가시작: " + startDay);
			System.out.println("휴가끝: " + endDay);
			System.out.println("작성일: " + writeDay);
				
			//문서객체생성
			Document document = new Document();
			
			document.setManageEmpId(empNum);
			document.setManageDocNo(docNum);
			document.setManageTitle(title);
			document.setManageContents(content);
			document.setManageDay(startDay);
			document.setManageClass(documentKind);
			document.setVacApprStart(startDay);
			document.setVacApprReason(reason);
			document.setManageNo(num);
			document.setVacApprEnd(endDay);
			
			//결재선 객체 생성
			int apprLineCount = 0;
			String apprName = "";
			if(!appr1.equals("")) {
				apprLineCount++;
				apprName = appr1;
				if(!appr2.equals("")) {
					apprLineCount++;
					apprName = appr2;
					if(!appr3.equals("")) {
						apprLineCount++;
						apprName = appr3;
					}
				}
			}
			ApprLine[] apprLine = new ApprLine[apprLineCount];
			apprLine[0] = new ApprLine();
			apprLine[0].setApprEmpId(apprNo[apprNo.length-1]);
			apprLine[0].setApprOrder(apprLineCount);
			
		/*	if(!appr1.equals("")) {
				apprLine[0] = new ApprLine();
				apprLine[0].setApprEmpId(appr1);
				apprLine[0].setApprOrder(1);
			}
			if(!appr2.equals("")) {
				apprLine[1] = new ApprLine();
				apprLine[1].setApprEmpId(appr2);
				apprLine[1].setApprOrder(2);
			}
			if(!appr3.equals("")) {
				apprLine[2] = new ApprLine();
				apprLine[2].setApprEmpId(appr3);
				apprLine[2].setApprOrder(3);
			}	*/		
			
			//Attachment 객체 생성하여 arrayList 객체 생성
			ArrayList<Attachments> fileList = new ArrayList<Attachments>();
			for(int i=originFiles.size() - 1; i>=0; i--) {
				Attachments at = new Attachments();
				at.setAttachPath(filePath);
				at.setAttachPreName(originFiles.get(i));
				at.setAttachName(saveFiles.get(i));
				fileList.add(at);
			}
			
			ArrayList<Object> list = new ArrayList<Object>();
			list.add(document);
			list.add(apprLine);
			
			int result = new DocumentService().insertDocument(list, apprNo, fileList);

			if(result > 0) {
				response.sendRedirect(request.getContextPath() + "/selectDocument.sd");
			}else {
				//실패시 저장된 사진 삭제
				for(int i=0; i<saveFiles.size(); i++) {
					//파일시스템에 저장된 이름으로 파일 객체 생성
					File failedFile = new File(filePath + saveFiles.get(i));
					
					//파일을 지우고 true, false 하나 리턴함
					failedFile.delete();
				}
			}
				request.setAttribute("msg", "문서 등록 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
