package com.semi.myPage.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.semi.myPage.model.dao.MsgDao;
import com.semi.myPage.model.vo.Msg;
import static com.semi.common.JDBCTemplate.*;

public class MsgService {

	public ArrayList<Msg> showMyPageMain(int userId) {
		Connection con = getConnection();
		
		ArrayList<Msg> list = new MsgDao().showMyPageMain(con, userId);
		
		close(con);
		
		return list;
	}

}
