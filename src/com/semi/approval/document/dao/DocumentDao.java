package com.semi.approval.document.dao;

import static com.semi.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.semi.admin.user.model.vo.Employee;
import com.semi.approval.approve.model.vo.ApprLine;
import com.semi.approval.document.vo.Document;
import com.semi.approval.document.vo.MyDocument;
import com.semi.approval.document.vo.SumEmpInfo;
import com.semi.common.vo.Attachments;
public class DocumentDao {
	private Properties prop = new Properties();

	public DocumentDao() {
		String fileName = DocumentDao.class.getResource("/sql/approval/approval-query.properties").getPath();
		try {
		
			prop.load(new FileReader(fileName));
		
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//사원번호, 문서번호, 번호 불러오기
	public Document selectForm(Connection con, int id) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Document document = null;
		String query = prop.getProperty("selectForm");
		try {
			
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();
			if(rset.next() == false) {
				document = new Document();
				document.setManageEmpId(id);
				document.setManageDocNo(1);
				document.setManageNo(1);
			}
			else {
				document = new Document();
				document.setManageEmpId(id);
				document.setManageDocNo(rset.getInt("MANAGEDOCNO"));
				document.setManageNo(rset.getInt("MANAGENO"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return document;
	}

	//주소록 가져오기
	public HashMap<Integer, ArrayList<SumEmpInfo>> selectDept(Connection con) {
		//기본은 부서가져오고 2가 붙은건 사원이름 가져옴
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rset = null;
		ResultSet rset2 = null;
		SumEmpInfo emp = null;
		ArrayList<SumEmpInfo> empList = null;
		HashMap<Integer, ArrayList<SumEmpInfo>> hmap = null;
		int key = 0;
		int num = 1;
		
		String query = prop.getProperty("selectDept");
		String query2 = prop.getProperty("selectEmp");
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt2 = con.prepareStatement(query2);
		
			rset = pstmt.executeQuery();
			rset2 = pstmt2.executeQuery();
			
			
			hmap = new HashMap<Integer, ArrayList<SumEmpInfo>>();

			while(rset.next()) {
				int count = rset.getInt(2);
				empList = new ArrayList<SumEmpInfo>();
					while(rset2.next()) {
						emp = new SumEmpInfo();
						emp.setDeptName(rset.getString("DEPTNAME"));
						emp.setEmpNo(rset2.getInt("EMPID"));
						emp.setEmpName(rset2.getString("EMPNAME"));
							
						empList.add(emp);
						if(num == count) {
							break;
						}
						num++;
				}
				hmap.put(key, empList);
				key++;
				num = 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return hmap;
	}

	//appr 삽입
	public int insertAppr(Connection con, ApprLine[] apprLine, ArrayList<Object> list) {
		PreparedStatement pstmt = null;
		int result = 0;
		Document document = (Document)list.get(0);
		
		String query = prop.getProperty("insertAppr");
		
		try {
			
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, document.getManageEmpId());
				pstmt.setInt(2, document.getManageEmpId());
				System.out.println("날짜: " + document.getManageDay());
				result = pstmt.executeUpdate();

		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		return result;
	}
	
	//파일삽입
	public int insertAttachments(Connection con, int attachNo, ArrayList<Attachments> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAttachments");
		
		try {
			
			for(int i=0; i<fileList.size(); i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, attachNo);
				pstmt.setString(2, fileList.get(i).getAttachPreName());
				pstmt.setString(3, fileList.get(i).getAttachName());
				pstmt.setString(4, fileList.get(i).getAttachPath());
			}
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	//doc 삽입
	public int insertDoc(Connection con, ArrayList<Object> list) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		Document document = (Document)list.get(0);
		String query = prop.getProperty("insertDoc");
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, (document.getManageDocNo()));
			pstmt.setInt(2, document.getManageEmpId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
	
		return result;
	}
	
	//첨부파일 있는 휴가신청서 삽입
	public int insertFOVODocument(Connection con, int attachNo, ArrayList<Object> list) {
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		int result = 0;
		Document document = (Document)list.get(0);
		String query = prop.getProperty("insertDocumentFOVO");
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, document.getManageEmpId());
			pstmt.setInt(2, document.getManageDocNo());
			pstmt.setInt(3, attachNo);
			pstmt.setString(4, document.getManageTitle());
			pstmt.setString(5, document.getManageContents());
			pstmt.setDate(6, document.getManageDay());
			pstmt.setString(7, document.getManageClass());
			pstmt.setDate(8, document.getVacApprStart());
			pstmt.setString(9, document.getVacApprReason());
			pstmt.setInt(10, document.getManageNo());
			pstmt.setDate(11, document.getVacApprEnd());
			pstmt.setString(12, document.getSubmission());
			result = pstmt.executeUpdate();
			
			query = prop.getProperty("insertApprLine");
			ApprLine[] apprLine = (ApprLine[])list.get(1);
			for(int i=0; i<apprLine.length; i++) {
				pstmt2 = con.prepareStatement(query);
				pstmt2.setInt(1, apprLine[i].getApprEmpId());
				pstmt2.setInt(2, apprLine[i].getApprOrder());
				result += pstmt2.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(pstmt2);
		}
		return result;
	}
	//첨부파일 있는 재직증명서 삽입
	public int insertFOEODocument(Connection con, int attachNo, ArrayList<Object> list) {
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		int result = 0;
		Document document = (Document)list.get(0);
		String query = prop.getProperty("insertDocumentFOEO");
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, document.getManageEmpId());
			pstmt.setInt(2, document.getManageDocNo());
			pstmt.setInt(3, attachNo);
			pstmt.setString(4, document.getManageTitle());
			pstmt.setString(5, document.getManageContents());
			pstmt.setDate(6, document.getManageDay());
			pstmt.setString(7, document.getManageClass());
			pstmt.setInt(8, document.getManageNo());
			pstmt.setString(9, document.getSubmission());
			pstmt.setDate(10, document.getEntryDay());
			result = pstmt.executeUpdate();
			
			query = prop.getProperty("insertApprLine");
			ApprLine[] apprLine = (ApprLine[])list.get(1);
			for(int i=0; i<apprLine.length; i++) {
				pstmt2 = con.prepareStatement(query);
				pstmt2.setInt(1, apprLine[i].getApprEmpId());
				pstmt2.setInt(2, apprLine[i].getApprOrder());
				result += pstmt2.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(pstmt2);
		}
		
		return result;
	}
	//첨부파일 있는 업무계획서 삽입
	public int insertFOWODocument(Connection con, int attachNo, ArrayList<Object> list) {
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		int result = 0;
		Document document = (Document)list.get(0);
		String query = prop.getProperty("insertDocumentFOWO");
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, document.getManageEmpId());
			pstmt.setInt(2, document.getManageDocNo());
			pstmt.setInt(3, attachNo);
			pstmt.setString(4, document.getManageTitle());
			pstmt.setString(5, document.getManageContents());
			pstmt.setDate(6, document.getManageDay());
			pstmt.setString(7, document.getManageClass());
			pstmt.setInt(8, document.getManageNo());
			pstmt.setString(9, document.getSubmission());
			result = pstmt.executeUpdate();
			
			query = prop.getProperty("insertApprLine");
			ApprLine[] apprLine = (ApprLine[])list.get(1);
			for(int i=0; i<apprLine.length; i++) {
				pstmt2 = con.prepareStatement(query);
				pstmt2.setInt(1, apprLine[i].getApprEmpId());
				pstmt2.setInt(2, apprLine[i].getApprOrder());
				result += pstmt2.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(pstmt2);
		}
		return result;
	}
	
	//첨부파일 없는 휴가신청서 삽입
	public int insertFXVODocument(Connection con, int attachNo, ArrayList<Object> list) {
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		int result = 0;
		Document document = (Document)list.get(0);
		String query = prop.getProperty("insertDocumentFXVO");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, document.getManageEmpId());
			pstmt.setInt(2, document.getManageDocNo());
			pstmt.setString(3, document.getManageTitle());
			pstmt.setString(4, document.getManageContents());
			pstmt.setDate(5, document.getManageDay());
			pstmt.setString(6, document.getManageClass());
			pstmt.setDate(7, document.getVacApprStart());
			pstmt.setString(8, document.getVacApprReason());
			pstmt.setInt(9, document.getManageNo());
			pstmt.setDate(10, document.getVacApprEnd());
			pstmt.setString(11, document.getSubmission());
			result = pstmt.executeUpdate();
			
			query = prop.getProperty("insertApprLine");
			ApprLine[] apprLine = (ApprLine[])list.get(1);
			for(int i=0; i<apprLine.length; i++) {
				pstmt2 = con.prepareStatement(query);
				pstmt2.setInt(1, apprLine[i].getApprEmpId());
				pstmt2.setInt(2, apprLine[i].getApprOrder());
				result += pstmt2.executeUpdate();
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(pstmt2);
		}
		return result;
	}
	
	//첨부파일 없는 재직증명서 삽입
	public int insertFXEODocument(Connection con, int attachNo, ArrayList<Object> list) {
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		int result = 0;
		Document document = (Document)list.get(0);
		String query = prop.getProperty("insertDocumentFXEO");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, document.getManageEmpId());
			pstmt.setInt(2, document.getManageDocNo());
			pstmt.setString(3, document.getManageTitle());
			pstmt.setString(4, document.getManageContents());
			pstmt.setDate(5, document.getManageDay());
			pstmt.setString(6, document.getManageClass());
			pstmt.setInt(7, document.getManageNo());
			pstmt.setString(8, document.getSubmission());
			pstmt.setDate(9, document.getEntryDay());
			result = pstmt.executeUpdate();
			
			query = prop.getProperty("insertApprLine");
			ApprLine[] apprLine = (ApprLine[])list.get(1);
			for(int i=0; i<apprLine.length; i++) {
				pstmt2 = con.prepareStatement(query);
				pstmt2.setInt(1, apprLine[i].getApprEmpId());
				pstmt2.setInt(2, apprLine[i].getApprOrder());
				result += pstmt2.executeUpdate();
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(pstmt2);
		}
		return result;
	}
	
	//첨부파일 없는 업무계획서 삽입
	public int insertFXWODocument(Connection con, int attachNo, ArrayList<Object> list) {
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		int result = 0;
		Document document = (Document)list.get(0);
		String query = prop.getProperty("insertDocumentFXWO");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, document.getManageEmpId());
			pstmt.setInt(2, document.getManageDocNo());
			pstmt.setString(3, document.getManageTitle());
			pstmt.setString(4, document.getManageContents());
			pstmt.setDate(5, document.getManageDay());
			pstmt.setString(6, document.getManageClass());
			pstmt.setInt(7, document.getManageNo());
			pstmt.setString(8, document.getSubmission());
			result = pstmt.executeUpdate();
			
			query = prop.getProperty("insertApprLine");
			ApprLine[] apprLine = (ApprLine[])list.get(1);
			for(int i=0; i<apprLine.length; i++) {
				pstmt2 = con.prepareStatement(query);
				pstmt2.setInt(1, apprLine[i].getApprEmpId());
				pstmt2.setInt(2, apprLine[i].getApprOrder());
				result += pstmt2.executeUpdate();
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(pstmt2);
		}
		return result;
	}
	
		public int getListCount(Connection con) {
			Statement stmt = null;
			int listCount = 0;
			ResultSet rset = null;
			String query = prop.getProperty("listCount");
			try {
				stmt = con.createStatement();
				rset = stmt.executeQuery(query);
				if(rset.next()) {
					listCount = rset.getInt(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(stmt);
			}
			
			
			return listCount;
		}
	
	//내문서함 문서 조회
	public ArrayList<MyDocument> selectList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		MyDocument myDocument = null;
		ArrayList<MyDocument> list = null;
		
		String query = prop.getProperty("selectList");
		
		try {
			
			int count = 1;
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;		
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<MyDocument>();

			while(rset.next()) {
				myDocument = new MyDocument();
				myDocument.setNum(count);
				myDocument.setWriterNum(rset.getInt("EMPID"));
				myDocument.setWriter(rset.getString("EMPNAME"));
				myDocument.setDeptName(rset.getString("DEPTNAME"));
				myDocument.setDocNum(rset.getInt("DOCNO"));
				myDocument.setTitle(rset.getString("MANAGETITLE"));
				myDocument.setWriteDay(rset.getDate("MANAGEDAY"));
				myDocument.setSubmission(rset.getString("SUBMISSION"));
				list.add(myDocument);
				count++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	//문서 상신시 SUBMISSION 컬럼 변경
	public int updateDocumentList(Connection con, String[] docNumList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateDocument");
		
		try {
			for(int i=0; i<docNumList.length; i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, Integer.parseInt((docNumList[i])));
				result = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
	
		return result;
	}

	//결재할 문서페이지 상신된 문서 조회
	public ArrayList<MyDocument> selectSubmitList(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		MyDocument myDocument = null;
		ArrayList<MyDocument> list = null;
		
		String query = prop.getProperty("selectSubmitDocument");
		int count = 1;
		try {
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();
			list = new ArrayList<MyDocument>();
			
			while(rset.next()) {
				myDocument = new MyDocument();
				
				myDocument.setNum(count);
				myDocument.setWriterNum(rset.getInt("EMPID"));
				myDocument.setWriter(rset.getString("EMPNAME"));
				myDocument.setDeptName(rset.getString("DEPTNAME"));
				myDocument.setDocNum(rset.getInt("MANAGEDOCNO"));
				myDocument.setTitle(rset.getString("MANAGETITLE"));
				myDocument.setWriteDay(rset.getDate("MANAGEDAY"));
				myDocument.setApprNum(rset.getInt("APPRNO"));
				
				count++;
				list.add(myDocument);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	//상신된 문서 결재할 결재자 조회
	public ArrayList<ApprLine> selectSubmitApprList(Connection con, int[] apprNum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ApprLine> list = null;
		
		String query = prop.getProperty("selectSubmitDocumentAppr");
		
		try {
			list = new ArrayList<ApprLine>();
			for(int i=0; i<apprNum.length; i++) {
				
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, apprNum[i]);
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					ApprLine apprLine = new ApprLine();
					apprLine.setApprEmpId(rset.getInt("APPREMPID"));
					apprLine.setApprOrder(rset.getInt("APPRORDER"));
					apprLine.setApprName(rset.getString("EMPNAME"));
					apprLine.setApprNo(rset.getInt("APPRNO"));
					apprLine.setCheck(false);
					apprLine.setApproval(rset.getString("APPROVAL"));
					list.add(apprLine);
				}
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	//휴지통 처리
	public int sendTrashList(Connection con, String[] docNumList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("sendTrash");
		
		try {
			
			pstmt = con.prepareStatement(query);
			for(int i=0; i<docNumList.length; i++) {
				pstmt.setInt(1, Integer.parseInt(docNumList[i]));
			}
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	//반려함 문서조회
	public ArrayList<MyDocument> selectReturnDocumentList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rset = null;
		ResultSet rset2 = null;
		MyDocument myDocument = null;
		ArrayList<MyDocument> list = null;
		
		String query = prop.getProperty("selectReturnDocument1");
		
		try {
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;		
			int count = 1;
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			list = new ArrayList<MyDocument>();
			
			while(rset.next()) {
				myDocument = new MyDocument();
				myDocument.setNum(count);
				myDocument.setWriterNum(rset.getInt("EMPID"));
				myDocument.setWriter(rset.getString("EMPNAME"));
				myDocument.setDeptName(rset.getString("DEPTNAME"));
				myDocument.setDocNum(rset.getInt("DOCNO"));
				int docNum = myDocument.getDocNum();
				myDocument.setWriteDay(rset.getDate("MANAGEDAY"));
				myDocument.setApprNum(rset.getInt("APPRNO"));
				String query2 = prop.getProperty("selectReturnDocument2");
				pstmt2 = con.prepareStatement(query2);
				pstmt2.setInt(1, docNum);
				pstmt2.setInt(2, startRow);
				pstmt2.setInt(3, endRow);
				rset2 = pstmt2.executeQuery();
				if(rset2.next()) {
					myDocument.setResult(rset2.getString("APPRSTATUS"));
				}				
				list.add(myDocument);
				count++;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(rset2);
			close(pstmt);
			close(pstmt2);
		}
		return list;
	}
	
	//상세보기때 불어올 문서
	public Document selectOne(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Document document = null;
		
		String query = prop.getProperty("selectOne");
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				document = new Document();
				document.setManageEmpId(rset.getInt("MANAGEEMPIE"));
				document.setManageDocNo(rset.getInt("MANAGEDOCNO"));
				document.setManageTitle(rset.getString("MANAGETITLE"));
				document.setManageContents(rset.getString("MANAGECONTENTS"));
				document.setManageDay(rset.getDate("MANAGEDAY"));
				document.setManageClass(rset.getString("MANAGECLASS"));
				document.setVacApprStart(rset.getDate("VACAPPRSTART"));
				document.setVacApprReason(rset.getString("VACAPPRREASON"));
				document.setManageNo(rset.getInt("MANAGENO"));
				document.setVacApprEnd(rset.getDate("VACAPPREND"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return document;
	}
	//상세보기 할때 불러올 파일검색
	public Attachments selectFile(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Attachments attachments = null;
		
		String query = prop.getProperty("selectFile");
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				attachments = new Attachments();
				attachments.setAttachNo(rset.getInt("ATTACHNO"));
				attachments.setAttachPreName(rset.getString("ATTACHPRENAME"));
				attachments.setAttachName(rset.getString("ATTACHNAME"));
				attachments.setAttachPath(rset.getString("ATTACHPATH"));
				attachments.setAttachDay(rset.getDate("ATTACHDAY"));
				attachments.setWhetherOfDelete(rset.getString("WHETHEROFDELETE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return attachments;
	}
	//문서진행현황 페이지에 넣을 데이터들 조회
	public ArrayList<MyDocument> selectStatus(Connection con, int empId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		MyDocument myDocument = new MyDocument();
		ArrayList<MyDocument> list = null;
		
		String query = prop.getProperty("selectStatus");
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, empId);
			rset = pstmt.executeQuery();
			list = new ArrayList<MyDocument>();
			int count = 1;
			
			while(rset.next()) {
				myDocument = new MyDocument();
				myDocument.setNum(count);
				myDocument.setWriterNum(rset.getInt("APPRWRITER"));
				myDocument.setWriter(rset.getString("EMPNAME"));
				myDocument.setDeptName(rset.getString("DEPTNAME"));
				myDocument.setDocNum(rset.getInt("DOCNO"));
				myDocument.setWriteDay(rset.getDate("MANAGEDAY"));
				myDocument.setResult(rset.getString("APPRYN"));
				list.add(myDocument);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	//결재 비밀번호 체크
	public boolean checkPassword(Connection con, int empId, int password) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		boolean check = false;
		
		String query = prop.getProperty("checkPassword");
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, empId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				int temp = rset.getInt("APPROVEPWD");
				if(temp == password) {
					check = !check;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return check;
	}
	
	//결재완료전 차수 판단
	public ArrayList<ApprLine> selectApprNo(Connection con, String[] docNumList) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ApprLine apprLine = null;
		ArrayList<ApprLine> list = null;
		
		String query = prop.getProperty("selectApprOrder");
		list = new ArrayList<ApprLine>();
		try {
			for(int i=0; i<docNumList.length; i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, Integer.parseInt(docNumList[i]));
				rset = pstmt.executeQuery();
				
				while(rset.next()) { 
					apprLine = new ApprLine();
					apprLine.setApprOrder(rset.getInt("APPRORDER"));
					apprLine.setApprNo(rset.getInt("APPRNO"));
					apprLine.setDocNo(rset.getInt("DOCNO"));
					
					list.add(apprLine);
				}			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	//결재했을때 결재완료로 업데이트 
	public int insertApprStatus(Connection con, String[] docNumList, int apprEmpId, int apprOrder, int listApprNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		int result = 0;	
		System.out.println("dao 옴");
			String query = prop.getProperty("selectApprKind");
			
			try {
				for(int i=0; i<docNumList.length; i++) {				
					pstmt = con.prepareStatement(query);
					pstmt.setInt(1, apprEmpId);					
					pstmt.setInt(2, Integer.parseInt(docNumList[i]));
					rset = pstmt.executeQuery();
					while(rset.next()) {
						int tempApprEmpId = rset.getInt("APPREMPID");
						int tempApprNo = rset.getInt("APPRNO");
						System.out.println(tempApprEmpId);
						System.out.println(tempApprNo);
						if(apprEmpId == tempApprEmpId && listApprNo == tempApprNo) {
							query = prop.getProperty("successInsertApprStatus");
							pstmt = con.prepareStatement(query);
							pstmt.setInt(1, listApprNo);
							pstmt.setInt(2, apprOrder);
							result = pstmt.executeUpdate();
							
							query = prop.getProperty("updateApprLine");
							pstmt2 = con.prepareStatement(query);
							pstmt2.setInt(1, listApprNo);
							pstmt2.setInt(2, apprOrder);
							result += pstmt2.executeUpdate();
						}
					}				
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
				close(pstmt2);
			}		
		return result;
	}

	
	
	//마지막 차수가 결재 했을때 appr 승인여부 하기 
	public int updateApprDate(Connection con, int apprNo) {
		PreparedStatement pstmt = null;
		int result = 0;
			String query = prop.getProperty("updateApprDate");
			try {
				
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, apprNo);
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
		return result;
	}
	
	//결재차수와 결재번호 가져와 logofapprove 삽입 후 반려처리 부분
		public int sendReturn(Connection con, String[] docNumList, int apprEmpId, int listApprOrder, int listApprNo) {
			PreparedStatement pstmt = null;
			PreparedStatement pstmt2 = null;
			int result = 0;
			
			String query = prop.getProperty("returnInsertApprStatus");
			
			try {			
				for(int i=0; i<docNumList.length; i++) {
					pstmt = con.prepareStatement(query);
					pstmt.setInt(1, listApprNo);
					pstmt.setInt(2, listApprOrder);
					result = pstmt.executeUpdate();
				}
					query = prop.getProperty("updateApprDate");
	
						pstmt2 = con.prepareStatement(query);
						pstmt2.setInt(1, listApprNo);
					result += pstmt2.executeUpdate();			
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
				close(pstmt2);
			}
			return result;
		}

		//반려함 listCount
		public int getListReturnCount(Connection con) {
			Statement stmt = null;
			int listCount = 0;
			ResultSet rset = null;
			String query = prop.getProperty("listReturnCount");
			try {
				stmt = con.createStatement();
				rset = stmt.executeQuery(query);
				if(rset.next()) {
					listCount = rset.getInt(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(stmt);
			}
			
			
			return listCount;
		}
}