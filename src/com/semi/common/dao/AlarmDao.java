package com.semi.common.dao;

import static com.semi.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.semi.admin.user.model.vo.Employee;
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


	

}
