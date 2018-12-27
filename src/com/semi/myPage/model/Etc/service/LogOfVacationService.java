package com.semi.myPage.model.Etc.service;

import static com.semi.common.JDBCTemplate.close;
import static com.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.semi.myPage.model.Etc.dao.LogOfVacationDao;
import com.semi.myPage.model.Etc.vo.LogOfVacation;
import com.semi.myPage.model.Msg.dao.MsgDao;

public class LogOfVacationService{

	public ArrayList<LogOfVacation> ShowMyPageLogOfVac(int userId) {
		Connection con = getConnection();
		
		ArrayList<LogOfVacation> list = new LogOfVacationDao().ShowMyPageLogOfVac(con, userId);
		
		close(con);
		
		return list;
	}

}
