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

	public int deleteMsg(ArrayList<Integer> deletelist) {
		Connection con = getConnection();
		
		int result = new MsgDao().deleteMsg(con, deletelist);
		
		close(con);
		
		return result;
	}

	public int saveMsg(ArrayList<Integer> savelist) {
		Connection con = getConnection();
		
		int result = new MsgDao().saveMsg(con, savelist);
		
		close(con);
		
		return result;
	}

	public ArrayList<Msg> showMyPageSendMessage(int userId) {
		Connection con = getConnection();
		
		ArrayList<Msg> list = new MsgDao().showMyPageSendMessage(con, userId);
		
		close(con);
		
		return list;
	}

	public ArrayList<Msg> ShowMyPageLockerMessage(int userId) {
		Connection con = getConnection();
		
		ArrayList<Msg> list = new MsgDao().ShowMyPageLockerMessage(con, userId);
		
		close(con);
		
		return list;
	}

}
