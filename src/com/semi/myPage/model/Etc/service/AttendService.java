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

}
