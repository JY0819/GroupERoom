package com.semi.schedule.model.dao;

import static com.semi.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.semi.schedule.model.vo.Schedule;

public class ScheduleDao {
	
	private Properties prop=new Properties();
	
	public ScheduleDao() {
		String fileName=ScheduleDao.class.getResource("/sql/schedule/schedule-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<HashMap<String, Object>> selectAllSchedule(Connection con, int empId) {
		ArrayList<HashMap<String, Object>> list=null;
		HashMap<String, Object> hmap=null;
		PreparedStatement pstmt=null;
		ResultSet rset=null;

		String query=prop.getProperty("selectMySchedule");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, empId);
			
			rset=pstmt.executeQuery();
			
			list=new ArrayList<HashMap<String, Object>>();
			System.out.println("list 선언");
			
			while(rset.next()) {				
				hmap=new HashMap<String, Object>();

				System.out.println(rset.getString("CALENDARDATE").substring(0, 10).replaceAll("/",""));
				
				hmap.put("calendarId", rset.getString("CALENDARDATE").substring(0, 10).replaceAll("/",""));
				hmap.put("calendarNo", rset.getInt("CALENDARNO"));
				hmap.put("calendarClass", rset.getInt("CALENDARCLASS"));
				hmap.put("empName", rset.getString("EMPNAME"));
				hmap.put("calendarContents",rset.getString("CALENDARCONTENTS"));	
				hmap.put("calendarDate", rset.getString("CALENDARDATE"));
				System.out.println(rset.getString("CALENDARDATE").substring(11, 16));
				String time=rset.getString("CALENDARDATE").substring(11, 16);
				if(time.equals("00:00")) {
					time="";
				}
				hmap.put("calendarTime", time);
				
				list.add(hmap);
				System.out.println("리스트 +"+list.size());
			}
			System.out.println("list:"+list);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	//개인 일정
	public int insertMySchedule(Connection con, Schedule reqSche) {
		PreparedStatement pstmt=null;
		int result=0;
		
		String query=prop.getProperty("insertMySchedule");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, reqSche.getCalendarClass());
			pstmt.setString(2, reqSche.getCalendarContents());
			pstmt.setString(3, reqSche.getScheduleDate());
			pstmt.setInt(4, reqSche.getEmpId());
			
			result=pstmt.executeUpdate();
			
			if(result>0) {
				commit(con);
			}else {
				rollback(con);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	//팀 일정
	public int insertTeamSchedule(Connection con, Schedule reqSche) {
		PreparedStatement pstmt=null;
		int result=0;
		
		String query=prop.getProperty("insertTeamSchedule");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, reqSche.getCalendarClass());
			pstmt.setString(2, reqSche.getCalendarContents());
			pstmt.setString(3, reqSche.getScheduleDate());
			pstmt.setInt(4, reqSche.getEmpId());
			pstmt.setInt(5, reqSche.getEmpId());
			
			result=pstmt.executeUpdate();
			
			if(result>0) {
				commit(con);
			}else {
				rollback(con);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	//회사 일정
	public int insertCompanySchedule(Connection con, Schedule reqSche) {
		PreparedStatement pstmt=null;
		int result=0;
		
		String query=prop.getProperty("insertCompanySchedule");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, reqSche.getCalendarClass());
			pstmt.setString(2, reqSche.getCalendarContents());
			pstmt.setString(3, reqSche.getScheduleDate());
			pstmt.setInt(4, reqSche.getEmpId());
			
			result=pstmt.executeUpdate();
			
			if(result>0) {
				commit(con);
			}else {
				rollback(con);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

}