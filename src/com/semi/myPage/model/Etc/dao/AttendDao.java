package com.semi.myPage.model.Etc.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.semi.myPage.model.Etc.vo.Attend;
import com.semi.myPage.model.Msg.dao.MsgDao;

import static com.semi.common.JDBCTemplate.*;

public class AttendDao {
	private Properties prop = new Properties();
	private String query = "";
	
	public AttendDao () {
		String fileName = MsgDao.class.getResource("/sql/myPage/myPage-query.properties").getPath();
	
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	public ArrayList<Attend> chkAttend(Connection con, int empId) {
		ArrayList<Attend> list = new ArrayList<Attend>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		query = prop.getProperty("chkAttend");
		
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, empId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Attend at = new Attend();
				
				at.setRnum(rset.getInt("RNUM"));
				at.setEmpId(rset.getInt("EMPID"));
				at.setEmpName(rset.getString("EMPNAME"));
				at.setAttendance(rset.getDate("ATTENDANCE"));
				at.setGetOff(rset.getDate("GETOFF"));
				
				list.add(at);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
				
		
		
		return list;
	}


	public ArrayList<Attend> chkAttend(Connection con, int userId, int currentPage, int limit) {
		ArrayList<Attend> list = new ArrayList<Attend>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		query = prop.getProperty("chkAttendPaging");
		
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userId);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Attend at = new Attend();
				
				at.setRnum(rset.getInt("RNUM"));
				at.setEmpId(rset.getInt("EMPID"));
				at.setEmpName(rset.getString("EMPNAME"));
				at.setAttendance(rset.getDate("ATTENDANCE"));
				at.setGetOff(rset.getDate("GETOFF"));
				
				list.add(at);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
				
		
		
		return list;
	}


	public int getCount(Connection con, int userId) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("listAttendCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userId);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return listCount;
	}


	public int chkToDay(Connection con, int empId) {
		PreparedStatement pstmt = null;
		int chk = 0;
		int result = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("chkToDay");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, empId);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				chk = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		if (chk != 0) {
			result = 1;
		} else {
			result = -1;
		}
		
		return result;
	}
	
	public int chkGetOff(Connection con, int empId) {
		PreparedStatement pstmt = null;
		int chk = 0;
		int result = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("chkGetOff");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, empId);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				chk = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		if (chk != 0) {
			result = 1;
		} else {
			result = 0;
		}
		
		return result;
	}


	public int insertAttend(Connection con, int empid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("insertAttend");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, empid);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return result;
	}


	public int updateAttend(Connection con, int empid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("updateAttend");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, empid);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return result;
	}
	

}
