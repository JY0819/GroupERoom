package com.semi.common.dao;

import static com.semi.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Properties;

import com.semi.board.notice.model.vo.Notice;
import com.semi.schedule.model.vo.Schedule;

public class MainDao {
	
	private Properties prop=new Properties();

	public MainDao() {
		String fileName=MainDao.class.getResource("/sql/main.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public ArrayList<Notice> selectNotice(Connection con) {
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		ArrayList<Notice> list=null;
		
		String query=prop.getProperty("selectNotice");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, 5);
			
			rset=pstmt.executeQuery();
			
			list=new ArrayList<Notice>();
			while(rset.next()) {
				Notice n=new Notice();
				n.setBno(rset.getInt("BOARDNO"));
				n.setbClass(rset.getString("BOARDCLASS"));
				n.setbTitle(rset.getString("BOARDTITLE"));
				n.setbDate(rset.getDate("BOARDDATE"));
				n.setbContent(rset.getString("BOARDCONTENTS"));
				
				list.add(n);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Schedule> selectMySchedule(Connection con, int empid) {
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		ArrayList<Schedule> list=null;
		
		String query=prop.getProperty("selectMySchedule");
		SimpleDateFormat date=new SimpleDateFormat("yyMMdd");
		Calendar c=Calendar.getInstance();
		String fDay=date.format(new Date(c.get(c.YEAR), c.get(c.MONTH), 1));
		String lDay=date.format(new Date(c.get(c.YEAR), c.get(c.MONTH)+1, 1));
		System.out.println(fDay+".."+ lDay);
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, empid);
			pstmt.setString(2, fDay);
			pstmt.setString(3, lDay);
			
			rset=pstmt.executeQuery();
			
			list=new ArrayList<Schedule>();
			
			while(rset.next()) {
				Schedule s=new Schedule();
				s.setCalendarNo(rset.getInt("CALENDARNO"));
				s.setCalendarClass(rset.getInt("CALENDARCLASS"));
				s.setCalendarContents(rset.getString("CALENDARCLASS"));
				s.setScheduleDate(rset.getString("CDATE"));
				s.setScheduleTime(rset.getString("CTIME"));
				
				list.add(s);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	public ArrayList<Schedule> selectTeamSchedule(Connection con, int empid) {
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		ArrayList<Schedule> list=null;
		
		String query=prop.getProperty("selectTeamSchedule");
		SimpleDateFormat date=new SimpleDateFormat("yyMMdd");
		Calendar c=Calendar.getInstance();
		String fDay=date.format(new Date(c.get(c.YEAR), c.get(c.MONTH), 1));
		String lDay=date.format(new Date(c.get(c.YEAR), c.get(c.MONTH)+1, 1));

		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, empid);
			pstmt.setString(2, fDay);
			pstmt.setString(3, lDay);
			
			rset=pstmt.executeQuery();
			
			list=new ArrayList<Schedule>();
			
			while(rset.next()) {
				Schedule s=new Schedule();
				s.setCalendarNo(rset.getInt("CALENDARNO"));
				s.setCalendarClass(rset.getInt("CALENDARCLASS"));
				s.setCalendarContents(rset.getString("CALENDARCLASS"));
				s.setScheduleDate(rset.getString("CDATE"));
				s.setScheduleTime(rset.getString("CTIME"));
				
				list.add(s);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Schedule> selectCompanySchedule(Connection con) {
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		ArrayList<Schedule> list=null;
		
		String query=prop.getProperty("selectCompanySchedule");
		
		SimpleDateFormat date=new SimpleDateFormat("yyMMdd");
		Calendar c=Calendar.getInstance();
		String fDay=date.format(new Date(c.get(c.YEAR), c.get(c.MONTH), 1));
		String lDay=date.format(new Date(c.get(c.YEAR), c.get(c.MONTH)+1, 1));

		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, fDay);
			pstmt.setString(2, lDay);
			
			rset=pstmt.executeQuery();
			
			list=new ArrayList<Schedule>();
			
			while(rset.next()) {
				Schedule s=new Schedule();
				s.setCalendarNo(rset.getInt("CALENDARNO"));
				s.setCalendarClass(rset.getInt("CALENDARCLASS"));
				s.setCalendarContents(rset.getString("CALENDARCLASS"));
				s.setScheduleDate(rset.getString("CDATE"));
				s.setScheduleTime(rset.getString("CTIME"));
				
				list.add(s);
			}
			System.out.println("scheduleDao"+list);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

}
