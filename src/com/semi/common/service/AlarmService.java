package com.semi.common.service;

import static com.semi.common.JDBCTemplate.close;
import static com.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.semi.common.dao.AlarmDao;
import com.semi.common.vo.Alarm;

public class AlarmService {

	public int chkAlarmMsg(int empId) {
		Connection con = getConnection();
		
		int alarmCount = new AlarmDao().chkAlarmMsg(con, empId);
		
		close(con);
		
		return alarmCount;
	}

	public ArrayList<Alarm> chkNoticeMsg() {
		Connection con = getConnection();
		
		ArrayList<Alarm> alarm = new AlarmDao().chkNoticeMsg(con);
		
		close(con);
		
		return alarm;
	}

	public int checkingMsg(int empid) {
		Connection con = getConnection();
		
		int result = new AlarmDao().checkingMsg(con, empid);
		
		close(con);
		
		return result;
		
	}

	public HashMap<Integer, String> getNotice(int empid) {
		Connection con = getConnection();
		
		HashMap<Integer, String> list = new AlarmDao().getNotice(con);
		
		close(con);
		
		return list;
	}

	public ArrayList<Integer> getNoticeNo(int empid) {
		Connection con = getConnection();
		
		ArrayList<Integer> list = new AlarmDao().getNoticeNo(con);
		
		close(con);
		
		return list;
	}

}
