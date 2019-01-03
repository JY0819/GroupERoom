package com.semi.myPage.model.Etc.service;

import static com.semi.common.JDBCTemplate.close;
import static com.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.semi.myPage.model.Etc.dao.AttendDao;
import com.semi.myPage.model.Etc.vo.Attend;

public class AttendService {

	public ArrayList<Attend> chkAttend(int empId) {
		Connection con = getConnection();
		
		ArrayList<Attend> list = new ArrayList<Attend>();
		
		list = new AttendDao().chkAttend(con, empId);
		
		close(con);
		
		return list;
	}

	public ArrayList<Attend> chkAttend(int userId, int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Attend> list = new ArrayList<Attend>();
		
		list = new AttendDao().chkAttend(con, userId, currentPage, limit);
		
		close(con);
		
		return list;
	}

	public int getCount(int userId) {
		Connection con = getConnection();
		
		int listCount = new AttendDao().getCount(con, userId);
		
		close(con);
		
		return listCount;
	}

	public int chkToDay(int empId) {
		Connection con = getConnection();
		
		int result = new AttendDao().chkToDay(con, empId);
		
		close(con);
		
		return result;
	}
	
	public int chkGetOff(int empId) {
		Connection con = getConnection();
		
		int result = new AttendDao().chkGetOff(con, empId);
		
		close(con);
		
		return result;
	}

	public int insertAttend(int empid) {
		Connection con = getConnection();
		
		int result = new AttendDao().insertAttend(con, empid);
		
		close(con);
		
		return result;
	}

	public int updateAttend(int empid) {
		Connection con = getConnection();
		
		int result = new AttendDao().updateAttend(con, empid);
		
		close(con);
		
		return result;
	}
	

}
