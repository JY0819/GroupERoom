package com.semi.schedule.model.service;

import static com.semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;

import com.semi.schedule.model.dao.ScheduleDao;
import com.semi.schedule.model.vo.Schedule;

public class ScheduleService {

	public ArrayList<HashMap<String, Object>> selectAllSchedule(int empId) {
		Connection con=getConnection();
		ArrayList<HashMap<String, Object>> list=new ScheduleDao().selectAllSchedule(con, empId);
		
		close(con);
		return list;
	}

	public int insertMySchedule(Schedule reqSche) {
		Connection con=getConnection();
		int result=new ScheduleDao().insertMySchedule(con, reqSche);
		
		close(con);
		return result;
	}

	public int insertTeamSchedule(Schedule reqSche) {
		Connection con=getConnection();
		int result=new ScheduleDao().insertTeamSchedule(con, reqSche);		
		
		close(con);
		return result;
	}

	public int insertCompanySchedule(Schedule reqSche) {
		Connection con=getConnection();
		int result=new ScheduleDao().insertCompanySchedule(con, reqSche);		
		
		close(con);
		return result;
	}

}
