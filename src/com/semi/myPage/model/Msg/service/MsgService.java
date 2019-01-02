package com.semi.myPage.model.Msg.service;

import static com.semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.semi.myPage.model.Msg.dao.MsgDao;
import com.semi.myPage.model.Msg.vo.Msg;

public class MsgService {

	public ArrayList<Msg> showMyPageMain(int userId) {
		Connection con = getConnection();
		
		ArrayList<Msg> list = new MsgDao().showMyPageMain(con, userId);
		
		close(con);
		
		return list;
	}
	
	public ArrayList<Msg> showMyPageMain(int userId, int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Msg> list = new MsgDao().selectList(con, userId, currentPage, limit);
		
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
	
	public ArrayList<Msg> showMyPageSendMessage(int userId, int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Msg> list = new MsgDao().showMyPageSendMessage(con, userId, currentPage, limit);
		
		close(con);
		
		return list;
	}

	public ArrayList<Msg> ShowMyPageLockerMessage(int userId) {
		Connection con = getConnection();
		
		ArrayList<Msg> list = new MsgDao().ShowMyPageLockerMessage(con, userId);
		
		close(con);
		
		return list;
	}
	

	public ArrayList<Msg> ShowMyPageLockerMessage(int userId, int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Msg> list = new MsgDao().ShowMyPageLockerMessage(con, userId, currentPage, limit);
		
		close(con);
		
		return list;
	}
	

	public Msg messageDetail(Msg msg) {
		Connection con = getConnection();
		
		msg = new MsgDao().messageDetail(con, msg);
		
		close(con);
		
		return msg;
	}
	
	public Msg messageDetail(Msg msg, String whetherOfSendList) {
		Connection con = getConnection();
		
		msg = new MsgDao().messageDetail(con, msg, whetherOfSendList);
		
		close(con);
		
		return msg;
	}

	public int saveMsgOne(int msgNo) {
		Connection con = getConnection();
		
		int result = new MsgDao().saveMsgOne(con, msgNo);
		
		close(con);
		
		return result;
	}

	public int deleteMsgOne(int msgNo) {
		Connection con = getConnection();
		
		int result = new MsgDao().deleteMsgOne(con, msgNo);
		
		close(con);
		
		return result;
	}

	public int sendMsg(int empNo, String contents, int receiver) {
		Connection con = getConnection();
		
		int result = new MsgDao().sendMsg(con, empNo, contents, receiver);
		
		close(con);
		
		return result;
	}

	public int getListCount(int userId) {
		Connection con = getConnection();
		
		int listCount = new MsgDao().getListCount(con, userId);
		
		close(con);
		
		return listCount;
	}

	public int getSendListCount(int userId) {
		Connection con = getConnection();
		
		int listCount = new MsgDao().getSendListCount(con, userId);
		
		close(con);
		
		return listCount;
	}

	public int getLockerCount(int userId) {
		Connection con = getConnection();
		
		int listCount = new MsgDao().getLockerCount(con, userId);
		
		close(con);
		
		return listCount;
	}


}
