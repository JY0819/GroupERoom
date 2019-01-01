package com.semi.approval.document.dao;

import static com.semi.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
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
			pstmt.setInt(1, id);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				document = new Document();
				document.setManageEmpId(rset.getInt("MANAGEEMPID"));
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

	public int insertAppr(Connection con, int[] apprNo, ArrayList<Object> list) {
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
			
			result = pstmt.executeUpdate();

			query = prop.getProperty("insertApprLine");
			pstmt2 = con.prepareStatement(query);
			ApprLine[] apprLine = (ApprLine[])list.get(1);
			pstmt2.setInt(1, apprLine[0].getApprEmpId());
			pstmt2.setInt(2, apprLine[0].getApprOrder());
			
			result += pstmt2.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
			return result;
	}

	public ArrayList<MyDocument> selectList(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		MyDocument myDocument = null;
		ArrayList<MyDocument> list = null;
		
		String query = prop.getProperty("selectList");
		
		try {
			
			pstmt = con.prepareStatement(query);
			int count = 1;
			
			rset = pstmt.executeQuery();
			list = new ArrayList<MyDocument>();
			while(rset.next()) {
				myDocument = new MyDocument();
				myDocument.setNum(count);
				myDocument.setWriterNum(rset.getInt("EMPID"));
				myDocument.setWriter(rset.getString("EMPNAME"));
				myDocument.setDeptName(rset.getString("DEPTNAME"));
				myDocument.setDocNum(rset.getInt("MANAGEDOCNO"));
				myDocument.setTitle(rset.getString("TITLE"));
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
}