package com.semi.common.service;

import static com.semi.common.JDBCTemplate.close;
import static com.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.semi.common.dao.AlarmDao;
import com.semi.common.vo.Alarm;

public class AlarmService {

	public int chkAlarmMsg(int empId) {
		Connection con = getConnection();
		
		int alarmCount = new AlarmDao().chkAlarmMsg(con, empId);
		
		close(con);
		
		return alarmCount;
	}

}
