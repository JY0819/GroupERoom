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
		
		//=======================================================
		//파일처리
		if(ServletFileUpload.isMultipartContent(request)) {
			//파일이 담겨있으면 true 반환
			
			//전송 파일 용량 제한 : 10MB로 제한
			int maxSize = 1024 * 1024 * 10; 
			//1024 * 1024 -> 1mb
			
			String root = request.getSession().getServletContext().getRealPath("/");
			
			String filePath = root + "assets/images/approval/approvalUpload";
			
			MultipartRequest multipartRequest = new MultipartRequest(request, filePath, maxSize, "UTF-8", new MyFileRenamePolicy());

			ArrayList<String> saveFiles = new ArrayList<String>();
			
			ArrayList<String> originFiles = new ArrayList<String>();
			
			Enumeration<String> files = multipartRequest.getFileNames();
			
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				saveFiles.add(multipartRequest.getFilesystemName(name));
				originFiles.add(multipartRequest.getOriginalFileName(name));
			}
			//=======================================================
		
			//값 변수에 담기
		
			//번호
			int num = Integer.parseInt(multipartRequest.getParameter("num"));
			
			//결재자1
			String appr1 = multipartRequest.getParameter("person1");
			
			//결재자2
			String appr2 = multipartRequest.getParameter("person2");
			
			//결재자3
			String appr3 = multipartRequest.getParameter("person3");
			
			//문서번호
			int docNum = Integer.parseInt(multipartRequest.getParameter("docNum"));
			
			//사원번호
			int empNum = Integer.parseInt(multipartRequest.getParameter("empNum"));
			
			//휴가시작일
			String sDate = multipartRequest.getParameter("startDate");
			
			//휴가종료일
			String eDate = multipartRequest.getParameter("endDate");
			
			//문서종류
			String documentKind = multipartRequest.getParameter("documentKind");
			System.out.println(documentKind);
			//제목
			String title = multipartRequest.getParameter("title");
			
			//작성일
			String wDate = multipartRequest.getParameter("date");
			
			//휴가사유
			String reason = multipartRequest.getParameter("reason");
		
			//내용
			String content = multipartRequest.getParameter("content");
		
			//문서 상신 여부
			String submission = "N";
		
			//사원 입사일
			String entry = multipartRequest.getParameter("entryDay");
			//===================================================
		
			//결재자가 비어있지 않으면 결재차수 카운트
			int count = 0;
			if(!multipartRequest.getParameter("empNo1").equals("")) {
				count++;
				if(!multipartRequest.getParameter("empNo2").equals("")) {
					count++;
					if(!multipartRequest.getParameter("empNo3").equals("")) {
						count++;
					}
				}
			}
			//카운트 한만큼 배열생성해 담기
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
			}
			
			//====================================================
			
	
			//====================================================
			
			//날짜 담기위한 데이트 변수
			Date startDay = null;
			Date endDay = null;
			Date writeDay = null;
			Date entryDay = null;
			
			//====================================================
			//받아온 문자열이 있으면 날짜형으로 변환
			
			//휴가신청서(1)일때 휴가시작일, 휴가종료일, 작성일 생성
			if(documentKind.equals("휴가신청서")) {
				if(!sDate.equals("") && !eDate.equals("")) {
					
					//휴가시작 날짜
					String[] dateArr = sDate.split("-");
					int[] drr = new int[dateArr.length];
	
					for(int i=0; i<dateArr.length; i++) {
						drr[i] = Integer.parseInt(dateArr[i]);
					}
					startDay = new java.sql.Date(new GregorianCalendar(drr[0], drr[1]-1, drr[2]).getTimeInMillis());
						
					//휴가끝
					dateArr = eDate.split("-");
					drr = new  int[dateArr.length];
						
					for(int i=0; i<dateArr.length; i++) {
						drr[i] = Integer.parseInt(dateArr[i]);
					}
					endDay = new java.sql.Date(new GregorianCalendar(drr[0], drr[1]-1, drr[2]).getTimeInMillis());
						
					//작성일
					if(!wDate.equals("")) {
						dateArr = wDate.split("-");
						drr = new  int[dateArr.length];
						
						for(int i=0; i<dateArr.length; i++) {
							drr[i] = Integer.parseInt(dateArr[i]);
						}
						writeDay = new java.sql.Date(new GregorianCalendar(drr[0], drr[1]-1, drr[2]).getTimeInMillis());
					}
				}else {
					//입력받은 날짜가 없을 때 현재시간 넣어줌
					startDay = new java.sql.Date(new GregorianCalendar().getTimeInMillis());
					endDay = new java.sql.Date(new GregorianCalendar().getTimeInMillis());
					writeDay = new java.sql.Date(new GregorianCalendar().getTimeInMillis());
				}
			}
			
			//재직증명서일때
			else if(documentKind.equals("재직증명서")) {

				if(!wDate.equals("")) {
					//작성일
					String[] dateArr = wDate.split("-");
					int[] drr = new  int[dateArr.length];
					
					for(int i=0; i<dateArr.length; i++) {
						drr[i] = Integer.parseInt(dateArr[i]);
					}
				writeDay = new java.sql.Date(new GregorianCalendar(drr[0], drr[1]-1, drr[2]).getTimeInMillis());

				//입사일
				dateArr = entry.split("-");
				drr = new  int[dateArr.length];
				
				for(int i=0; i<dateArr.length; i++) {
					drr[i] = Integer.parseInt(dateArr[i]);
				}
				entryDay = new java.sql.Date(new GregorianCalendar(drr[0], drr[1]-1, drr[2]).getTimeInMillis());
				}else {
					//입력받은 날짜가 없을 때 현재시간 넣어줌
					writeDay = new java.sql.Date(new GregorianCalendar().getTimeInMillis());
				}
			}else {
				if(!wDate.equals("")) {
					//작성일
					String[] dateArr = wDate.split("-");
					int[] drr = new  int[dateArr.length];
					
					for(int i=0; i<dateArr.length; i++) {
						drr[i] = Integer.parseInt(dateArr[i]);
					}
				writeDay = new java.sql.Date(new GregorianCalendar(drr[0], drr[1]-1, drr[2]).getTimeInMillis());
				}else {
					writeDay = new java.sql.Date(new GregorianCalendar().getTimeInMillis());
				}
			}
			//====================================================
			
			//분류 이름에 따라 문자형 숫자로 넣음
			if(documentKind.equals("휴가신청서")) {
				documentKind = "1";
			}else if(documentKind.equals("재직증명서")) {
				documentKind = "2";
			}else {
				documentKind = "3";
			}
			//====================================================
			
			//문서객체생성
			Document document = new Document();
			
			document.setManageEmpId(empNum);
			document.setManageDocNo(docNum);
			document.setManageTitle(title);
			document.setManageContents(content);
			document.setManageDay(writeDay);
			document.setManageClass(documentKind);
			document.setManageNo(num);
			document.setSubmission(submission);
			if(documentKind.equals("1")) {
				document.setVacApprReason(reason);
				document.setVacApprStart(startDay);
				document.setVacApprEnd(endDay);
			}
			else if(documentKind.equals("2")) {
				document.setEntryDay(entryDay);
			}
			
			//====================================================
			//결재선 객체 생성
			int[] apprLineCount = new int[3];
			String[] apprName = new String[3];
			if(!appr1.equals("")) {
				apprLineCount[0] = 1;
				apprName[0] = appr1;
				if(!appr2.equals("")) {
					apprLineCount[1] = 2;
					apprName[1] = appr2;
					if(!appr3.equals("")) {
						apprLineCount[2] = 3;
						apprName[2] = appr3;
					}
				}
			}
			ApprLine[] apprLine = new ApprLine[apprNo.length];
				for(int i=0; i<apprNo.length; i++) {
					apprLine[i] = new ApprLine();
					apprLine[i].setApprEmpId(apprNo[i]);
					apprLine[i].setApprOrder(apprLineCount[i]);
				}
			
			//====================================================	
			
			//Attachment 객체 생성하여 arrayList 객체 생성
			ArrayList<Attachments> fileList = null;
			
			if(originFiles.get(0) != null) {
			fileList = new ArrayList<Attachments>();
				for(int i=originFiles.size() - 1; i>=0; i--) {
					Attachments at = new Attachments();
					at.setAttachPath(filePath);
					at.setAttachPreName(originFiles.get(i));
					at.setAttachName(saveFiles.get(i));
					fileList.add(at);
				}
			}
			
			//====================================================
			
			//문서와 결재선 담을 리스트 생성
			ArrayList<Object> list = new ArrayList<Object>();
			list.add(document);
			list.add(apprLine);
			
			//====================================================
			
			//첨부파일이 구분해 SERVICE에 접근
			int result = 0;
			if(originFiles.get(0) != null) {
				result = new DocumentService().insertDocument(list, apprLine, fileList);
				System.out.println("결과옴");
			}else{
				result = new DocumentService().insertDocument(list, apprLine);
				System.out.println("결과옴");
			}
			
			//====================================================
			if(result > 0) {
				response.sendRedirect("/semi/selectDocument.sd");
				
			}else {
				//실패시 저장된 사진 삭제
				for(int i=0; i<saveFiles.size(); i++) {
					//파일시스템에 저장된 이름으로 파일 객체 생성
					File failedFile = new File(filePath + saveFiles.get(i));
					
					//파일을 지우고 true, false 하나 리턴함
					failedFile.delete();
				}
				request.setAttribute("msg", "문서 등록 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
			//파일없을때
		}else {
			//값 변수에 담기
			
			//번호
			int num = Integer.parseInt(request.getParameter("num"));
			
			//결재자1
			String appr1 = request.getParameter("person1");
			
			//결재자2
			String appr2 = request.getParameter("person2");
			
			//결재자3
			String appr3 = request.getParameter("person3");
			
			//문서번호
			int docNum = Integer.parseInt(request.getParameter("docNum"));
			
			//사원번호
			int empNum = Integer.parseInt(request.getParameter("empNum"));
			
			//휴가시작일
			String sDate = request.getParameter("startDate");
			
			//휴가종료일
			String eDate = request.getParameter("endDate");
			
			//문서종류
			String documentKind = request.getParameter("documentKind");
			System.out.println(documentKind);
			//제목
			String title = request.getParameter("title");
			
			//작성일
			String wDate = request.getParameter("date");
			
			//휴가사유
			String reason = request.getParameter("reason");
		
			//내용
			String content = request.getParameter("content");
		
			//문서 상신 여부
			String submission = "N";
		
			//사원 입사일
			String entry = request.getParameter("entryDay");
			//===================================================
		
			//결재자가 비어있지 않으면 결재차수 카운트
			int count = 0;
			if(!request.getParameter("empNo1").equals("")) {
				count++;
				if(!request.getParameter("empNo2").equals("")) {
					count++;
					if(!request.getParameter("empNo3").equals("")) {
						count++;
					}
				}
			}
			//카운트 한만큼 배열생성해 담기
			int[] apprNo = new int[count];
			if(count > 0) {
				for(int i=0; i<apprNo.length; i++) {
					apprNo[i] = Integer.parseInt(request.getParameter("empNo1"));
					if(i > 0 && count > 1) {
						apprNo[i] = Integer.parseInt(request.getParameter("empNo2"));
						if(i > 1 && count > 2) {
							apprNo[i] = Integer.parseInt(request.getParameter("empNo3"));
						}
					}
				}
			}

			//====================================================
			
			//날짜 담기위한 데이트 변수
			Date startDay = null;
			Date endDay = null;
			Date writeDay = null;
			Date entryDay = null;
			
			//====================================================
			//받아온 문자열이 있으면 날짜형으로 변환
			
			//휴가신청서(1)일때 휴가시작일, 휴가종료일, 작성일 생성
			if(documentKind.equals("휴가신청서")) {
				if(!sDate.equals("") && !eDate.equals("")) {
					
					//휴가시작 날짜
					String[] dateArr = sDate.split("-");
					int[] drr = new int[dateArr.length];
	
					for(int i=0; i<dateArr.length; i++) {
						drr[i] = Integer.parseInt(dateArr[i]);
					}
					startDay = new java.sql.Date(new GregorianCalendar(drr[0], drr[1]-1, drr[2]).getTimeInMillis());
						
					//휴가끝
					dateArr = eDate.split("-");
					drr = new  int[dateArr.length];
						
					for(int i=0; i<dateArr.length; i++) {
						drr[i] = Integer.parseInt(dateArr[i]);
					}
					endDay = new java.sql.Date(new GregorianCalendar(drr[0], drr[1]-1, drr[2]).getTimeInMillis());
						
					//작성일
					if(!wDate.equals("")) {
						dateArr = wDate.split("-");
						drr = new  int[dateArr.length];
						
						for(int i=0; i<dateArr.length; i++) {
							drr[i] = Integer.parseInt(dateArr[i]);
						}
						writeDay = new java.sql.Date(new GregorianCalendar(drr[0], drr[1]-1, drr[2]).getTimeInMillis());
					}
				}else {
					//입력받은 날짜가 없을 때 현재시간 넣어줌
					startDay = new java.sql.Date(new GregorianCalendar().getTimeInMillis());
					endDay = new java.sql.Date(new GregorianCalendar().getTimeInMillis());
					writeDay = new java.sql.Date(new GregorianCalendar().getTimeInMillis());
				}
			}
			
			//재직증명서일때
			else if(documentKind.equals("재직증명서")) {

				if(!wDate.equals("")) {
					//작성일
					String[] dateArr = wDate.split("-");
					int[] drr = new  int[dateArr.length];
					
					for(int i=0; i<dateArr.length; i++) {
						drr[i] = Integer.parseInt(dateArr[i]);
					}
				writeDay = new java.sql.Date(new GregorianCalendar(drr[0], drr[1]-1, drr[2]).getTimeInMillis());

				//입사일
				dateArr = entry.split("-");
				drr = new  int[dateArr.length];
				
				for(int i=0; i<dateArr.length; i++) {
					drr[i] = Integer.parseInt(dateArr[i]);
				}
				entryDay = new java.sql.Date(new GregorianCalendar(drr[0], drr[1]-1, drr[2]).getTimeInMillis());
				}else {
					//입력받은 날짜가 없을 때 현재시간 넣어줌
					writeDay = new java.sql.Date(new GregorianCalendar().getTimeInMillis());
				}
			}else {
				if(!wDate.equals("")) {
					//작성일
					String[] dateArr = wDate.split("-");
					int[] drr = new  int[dateArr.length];
					
					for(int i=0; i<dateArr.length; i++) {
						drr[i] = Integer.parseInt(dateArr[i]);
					}
				writeDay = new java.sql.Date(new GregorianCalendar(drr[0], drr[1]-1, drr[2]).getTimeInMillis());
				}else {
					writeDay = new java.sql.Date(new GregorianCalendar().getTimeInMillis());
				}
			}
			//====================================================
			
			//분류 이름에 따라 문자형 숫자로 넣음
			if(documentKind.equals("휴가신청서")) {
				documentKind = "1";
			}else if(documentKind.equals("재직증명서")) {
				documentKind = "2";
			}else {
				documentKind = "3";
			}
			//====================================================
			
			//문서객체생성
			Document document = new Document();
			
			document.setManageEmpId(empNum);
			document.setManageDocNo(docNum);
			document.setManageTitle(title);
			document.setManageContents(content);
			document.setManageDay(writeDay);
			document.setManageClass(documentKind);
			document.setManageNo(num);
			document.setSubmission(submission);
			if(documentKind.equals("1")) {
				document.setVacApprReason(reason);
				document.setVacApprStart(startDay);
				document.setVacApprEnd(endDay);
			}
			else if(documentKind.equals("2")) {
				document.setEntryDay(entryDay);
			}
			
			//====================================================
			//결재선 객체 생성
			int[] apprLineCount = new int[3];
			String[] apprName = new String[3];
			if(!appr1.equals("")) {
				apprLineCount[0] = 1;
				apprName[0] = appr1;
				if(!appr2.equals("")) {
					apprLineCount[1] = 2;
					apprName[1] = appr2;
					if(!appr3.equals("")) {
						apprLineCount[2] = 3;
						apprName[2] = appr3;
					}
				}
			}
			ApprLine[] apprLine = new ApprLine[apprNo.length];
				for(int i=0; i<apprNo.length; i++) {
					apprLine[i] = new ApprLine();
					apprLine[i].setApprEmpId(apprNo[i]);
					apprLine[i].setApprOrder(apprLineCount[i]);
				}
			
			ArrayList<Object> list = new ArrayList<Object>();
			list.add(document);
			list.add(apprLine);
			
			int result = new DocumentService().insertDocument(list, apprLine);
			
			if(result > 0) {
				response.sendRedirect("/semi/selectDocument.sd");				
			}else {
			request.setAttribute("msg", "문서 등록 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
