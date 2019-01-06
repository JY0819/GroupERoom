package com.semi.approval.model.dao.finishApprovalDao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.semi.approval.approve.model.vo.FinishApproval;
import static com.semi.common.JDBCTemplate.*;
public class FinishApprovalDao {
	private Properties prop = new Properties();
	public FinishApprovalDao() {
		String fileName = FinishApprovalDao.class.getResource("/sql/approval/finishAppr/finish-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	public ArrayList<FinishApproval> selectList(Connection con) {
		Statement stmt = null;
		
		ResultSet rset = null;
		
		ArrayList<FinishApproval> list = null;
		
		String query = prop.getProperty("selectfinishList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			list = new ArrayList<FinishApproval>();
			while(rset.next()) {
				FinishApproval finishApproval = new FinishApproval();
				finishApproval.setEmpid(rset.getInt("EMPID"));
				finishApproval.setApprNo(rset.getInt("APPRNO"));
				finishApproval.setApprWriter(rset.getString("EMPNAME"));
				finishApproval.setDocNo(rset.getInt("DOCNO"));
				finishApproval.setResult(rset.getString("APPRYN"));
				finishApproval.setOpinion(rset.getString("OPINION"));
				finishApproval.setApprDay(rset.getDate("APPRDAY"));
				finishApproval.setApprDate(rset.getDate("APPRDATE"));
				list.add(finishApproval);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		
		
		return list;
	}
	public int deleteFinish(Connection con, int[] apprno) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("deleteFinish");
		
		try {
			

			for(int i =0;i<apprno.length;i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, apprno[i]);
				result = pstmt.executeUpdate();
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}
	public ArrayList<FinishApproval> selectList(Connection con, int currentPage, int limit) {
		
		
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		ArrayList<FinishApproval> list = null;
		
		String query = prop.getProperty("pageselectList");
		
		try {
			pstmt = con.prepareStatement(query);
		
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			
			rset = pstmt.executeQuery();
			
			
			list = new ArrayList<FinishApproval>();
			
			while(rset.next()) {
				FinishApproval finishapproval = new FinishApproval();
				finishapproval.setEmpid(rset.getInt("EMPID"));
				finishapproval.setApprNo(rset.getInt("APPRNO"));
				finishapproval.setApprWriter(rset.getString("EMPNAME"));
				finishapproval.setDocNo(rset.getInt("DOCNO"));
				finishapproval.setResult(rset.getString("APPRYN"));
				finishapproval.setOpinion(rset.getString("OPINION"));
				finishapproval.setApprDay(rset.getDate("APPRDAY"));
				finishapproval.setApprDate(rset.getDate("APPRDATE"));
				
				
				list.add(finishapproval);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			
			close(rset);
			
		}
		
		
		
		return list;
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		
		return listCount;
		
	}

}
