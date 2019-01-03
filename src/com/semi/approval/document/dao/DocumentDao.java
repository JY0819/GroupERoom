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
			if(rset.next()) {
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
				pstmt.setDate(3, document.getManageDay());
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
			pstmt.setInt(1, document.getManageEmpId());
			pstmt.setInt(2, (document.getManageDocNo()-1));
			pstmt.setInt(3, document.getManageEmpId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
	
		return result;
	}
	
	//문서 삽입
	public int insertDocument(Connection con, int attachNo, ArrayList<Object> list) {
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		int result = 0;
		Document document = (Document)list.get(0);
		
		String query = prop.getProperty("insertDocument");
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
		}
			return result;
	}
	
	//문서 조회
	public ArrayList<MyDocument> selectList(Connection con) {
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rset = null;
		ResultSet rset2= null;
		MyDocument myDocument = null;
		ArrayList<MyDocument> list = null;
		
		String query = prop.getProperty("selectList1");
		
		try {
			
			pstmt = con.prepareStatement(query);

			int count = 1;
			rset = pstmt.executeQuery();
			list = new ArrayList<MyDocument>();

			while(rset.next()) {
				myDocument = new MyDocument();
				myDocument.setNum(count);
				myDocument.setWriterNum(rset.getInt("APPRWRITER"));
				myDocument.setWriter(rset.getString("EMPNAME"));
				myDocument.setDeptName(rset.getString("DEPTNAME"));
				myDocument.setDocNum(rset.getInt("DOCNO"));
				String query2 = prop.getProperty("selectList2");
				pstmt2 = con.prepareStatement(query2);
				pstmt2.setInt(1, myDocument.getDocNum());
				rset2 = pstmt2.executeQuery();
				if(rset2.next()) {
					myDocument.setTitle(rset2.getString("MANAGETITLE"));
					myDocument.setWriteDay(rset2.getDate("MANAGEDAY"));
					myDocument.setSubmission(rset2.getString("SUBMISSION"));
				}
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

	//문서 상신시 상신컬럼 변경
	public int updateDocumentList(Connection con, String[] docNumList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateDocument");
		
		try {
			
			pstmt = con.prepareStatement(query);
			
			for(int i=0; i<docNumList.length; i++) {
				pstmt.setInt(1, Integer.parseInt((docNumList[i])));
			}
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
	
		return result;
	}

	//결재할 문서로 상신 처리
	public ArrayList<MyDocument> selectSubmitList(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		MyDocument myDocument = null;
		ArrayList<MyDocument> list = null;
		
		String query = prop.getProperty("selectSubmitDocument");
		
		try {
			
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();
			int count = 1;
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

	//휴지통 처리
	public int sendTrashList(Connection con, String[] docNumList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("sendTrash");
		
		try {
			
			pstmt = con.prepareStatement(query);
			for(int i=0; i<docNumList.length-1; i++) {
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

	//결재차수와 결재번호 가져와 logofapprove 삽입 후 반려처리 부분
	public int sendReturn(Connection con, String[] docNumList) {
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("selectApprOrder");
		ArrayList<Integer> list = new ArrayList<Integer>();
		try {
			
			pstmt = con.prepareStatement(query);
			for(int i=0; i<docNumList.length-1; i++) {
				pstmt.setInt(1, Integer.parseInt(docNumList[i]));
				rset = pstmt.executeQuery();
				while(rset.next()) {
					list.add(rset.getInt("APPRNO"));
					list.add(rset.getInt("APPRORDER"));
				}
			}
			query = prop.getProperty("insertLogOfApproveReturn");
			for(int i=0; i<list.size()-1; i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, "반려");
				pstmt.setInt(2, list.get(i));
				if(list.get(i) == 0) {
					break;
				}
				pstmt.setInt(3, list.get(i+1));
			}
			result = pstmt.executeUpdate();
			
			query = prop.getProperty("updateApprDate");
			for(int i=0; i<list.size(); i+=2) {
				pstmt2 = con.prepareStatement(query);
				pstmt2.setInt(1, list.get(i));
			}
			result += pstmt2.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	//반려함 문서조회
	public ArrayList<MyDocument> selectReturnDocumentList(Connection con) {
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rset = null;
		ResultSet rset2 = null;
		MyDocument myDocument = null;
		ArrayList<MyDocument> list = null;
		
		String query = prop.getProperty("selectReturnDocument1");
		
		try {
			
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();
			int count = 1;
			list = new ArrayList<MyDocument>();
			
			while(rset.next()) {
				myDocument = new MyDocument();
				myDocument.setNum(count);
				myDocument.setWriterNum(rset.getInt("EMPID"));
				myDocument.setWriter(rset.getString("EMPNAME"));
				myDocument.setDeptName(rset.getString("DEPTNAME"));
				myDocument.setOpinion(rset.getString("OPINION"));
				myDocument.setResult(rset.getString("APPRSTATUS"));
				int docNum = rset.getInt("DOCNO");
				String query2 = prop.getProperty("selectReturnDocument2");
				pstmt2 = con.prepareStatement(query2);
				pstmt2.setInt(1, docNum);
				rset2 = pstmt2.executeQuery();
				if(rset2.next()) {
					myDocument.setDocNum(rset2.getInt("MANAGEDOCNO"));
					myDocument.setWriteDay(rset2.getDate("MANAGEDAY"));
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

}