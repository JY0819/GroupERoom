package com.semi.approval.model.dao.trashDao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.semi.approval.approve.model.vo.ApprLine;
import com.semi.approval.approve.model.vo.Approval;
import com.semi.approval.approve.model.vo.TrashTable;
import com.sun.corba.se.spi.orbutil.fsm.State;

import static com.semi.common.JDBCTemplate.*;

public class TrashDao {
	private Properties prop = new Properties();
	public TrashDao() {
		String fileName = TrashDao.class.getResource("/sql/approval/trash/trash-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public ArrayList<TrashTable> selectList(Connection con) {
		System.out.println("dao들어옴");
		Statement stmt = null;
		Statement stmt2 = null;
		ResultSet rset = null;
		ResultSet rset2 = null;
		ArrayList<TrashTable> list = null;
		
		String query = prop.getProperty("selecttrashList");
		String query2 = prop.getProperty("selectLineManager");
		
		try {
			
			stmt = con.createStatement();
			stmt2 = con.createStatement();
			rset = stmt.executeQuery(query);
			rset2 = stmt2.executeQuery(query2);
			list = new ArrayList<TrashTable>();
			while(rset.next()) {
				TrashTable trashTable = new TrashTable();
				trashTable.setWriter(rset.getString("EMPNAME"));
				
				if(rset2.next()) {
					trashTable.setManager(rset2.getString("EMPNAME"));
					System.out.println(trashTable.getManager());
				}
				trashTable.setDocnum(rset.getInt("DOCNO"));
				System.out.println(trashTable.getDocnum());
				trashTable.setApprnum(rset.getInt("APPRNO"));
				
				trashTable.setResult(rset.getString("APPRYN"));
				System.out.println(trashTable.getResult());
				
				
				list.add(trashTable);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			System.out.println(list.size());
			close(rset);
			close(stmt);	
		}
		
		return list;
		
	}
	/*public ArrayList<ApprLine> selectLineList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<ApprLine> line = null;
		String query = prop.getProperty("selectapprLineList");
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			line = new ArrayList<ApprLine>();
			while(rset.next()) {
				ApprLine l = new ApprLine();
				l.setApprEmpId(rset.getString("EMPNAME"));
				l.setApprOrder(rset.getInt("APPRORDER"));
				l.setApprNo(rset.getInt("APPRNO"));
				line.add(l);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			System.out.println("결재자 : " + line.size());
			close(rset);
			close(stmt);
		}
		
		
		
		return line;
	}*/
	public int deleteTrash(Connection con, int[] apprno) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("deleteTrash");
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
	public ArrayList<TrashTable> selectList(Connection con, int currentPage, int limit) {
		
		
		
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2= null;
		ResultSet rset = null;
		ResultSet rset2 = null;
		ArrayList<TrashTable> list = null;
		
		String query = prop.getProperty("pageselectList");
		String query2 = prop.getProperty("pageselectList2");
		try {
			pstmt = con.prepareStatement(query);
			pstmt2 = con.prepareStatement(query2);
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt2.setInt(1, startRow);
			pstmt2.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			rset2 = pstmt2.executeQuery();
			
			list = new ArrayList<TrashTable>();
			
			while(rset.next()) {
				TrashTable trashTable = new TrashTable();
				trashTable.setWriter(rset.getString("EMPNAME"));
				
				if(rset2.next()) {
					trashTable.setManager(rset2.getString("EMPNAME"));
					System.out.println(trashTable.getManager());
				}
				trashTable.setDocnum(rset.getInt("DOCNO"));
				System.out.println(trashTable.getDocnum());
				trashTable.setApprnum(rset.getInt("APPRNO"));
				
				trashTable.setResult(rset.getString("APPRYN"));
				System.out.println(trashTable.getResult());
				
				
				list.add(trashTable);
				
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
	
}
