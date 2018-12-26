package com.semi.schedule.model.service;

import static com.semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;

import com.semi.schedule.model.dao.ScheduleDao;
import com.semi.schedule.model.vo.Schedule;

public class ScheduleService {

	public ArrayList<HashMap<String, Object>> selectAllSchedule() {
		Connection con=getConnection();
		ArrayList<HashMap<String, Object>> list=new ScheduleDao().selectAllSchedule(con);
		
		close(con);
		return list;
	}

}
