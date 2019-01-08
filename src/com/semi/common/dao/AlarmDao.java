package com.semi.common.dao;

import static com.semi.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.semi.admin.user.model.vo.Employee;
import com.semi.common.vo.Alarm;
import com.semi.common.vo.DeptEmp;
import com.semi.schedule.model.dao.ScheduleDao;

public class AlarmDao {
	private Properties prop = new Properties();
	private String query = "";
	
	public AlarmDao() {
		String fileName = AlarmDao.class.getResource("/sql/alarm.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int chkAlarmMsg(Connection con, int empId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		query = prop.getProperty("chkAlarmMsg");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, empId);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		return result;
	}

	public ArrayList<Alarm> chkNoticeMsg(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Alarm> alarm = new ArrayList<Alarm>();
		
		query = prop.getProperty("chkNoticeMsg");
		
		try {
			pstmt = con.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				Alarm a = new Alarm();

				a.setAlarmContents(rset.getString("alarmContents"));
				
				alarm.add(a);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return alarm;
	}

	public int checkingMsg(Connection con, int empid) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		query = prop.getProperty("checkingMsg");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, empid);
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public HashMap<Integer, String> getNotice(Connection con) {
		HashMap<Integer, String> list = new HashMap<Integer, String>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		query = prop.getProperty("getNotice");
		
		try {
			pstmt = con.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				list.put(rset.getInt("alarmNo"), rset.getString("alarmContents"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}

	public ArrayList<Integer> getNoticeNo(Connection con) {
		ArrayList<Integer> list = new ArrayList<Integer>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		query = prop.getProperty("getNoticeNo");
		
		try {
			pstmt = con.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				list.add(rset.getInt("alarmNo"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}

	public ArrayList<Integer> chkApprEndMsg(Connection con) {
		ArrayList<Integer> list = new ArrayList<Integer>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		query = prop.getProperty("chkApprEndMsg");
		
		try {
			pstmt = con.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				list.add(rset.getInt("empid"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}
	
	public ArrayList<Integer> chkApprInMsg(Connection con) {
		ArrayList<Integer> list = new ArrayList<Integer>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		query = prop.getProperty("chkApprInMsg");
		
		try {
			pstmt = con.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				list.add(rset.getInt("empid"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}

	public int updateNoticeAlarm(Connection con, Integer alarmNo, String contents) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		query = prop.getProperty("updateNoticeAlarm");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, contents);
			pstmt.setInt(2, alarmNo);
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int checkingApprLine(Connection con, int empid) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		query = prop.getProperty("checkingApprLine");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, empid);
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int checkingApprEnd(Connection con, int empid) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		query = prop.getProperty("checkingApprEnd");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, empid);
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}


	

}
