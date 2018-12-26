package com.semi.board.Free.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.semi.board.Free.model.dao.FreeDao;
import com.semi.board.Free.model.vo.Free;
import static com.semi.common.JDBCTemplate.*;

public class FreeService {
	//게시물 조회
	public ArrayList<Free> selectList() {
		Connection con = getConnection();
		
		ArrayList<Free> list = new FreeDao().selectList(con);
		
		close(con);
		
		return list;
	}
	
	
	/*
	//게시물 조회용 메소드
	public ArrayList<Free> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<Free> list = new FreeDao().selectList(con, currentPage, limit);
		
		close(con);
		
		return list;
	}

	public int getListCount() {
		Connection con = getConnection();
		
		int listCount = new FreeDao().getListCount(con);
		
		close(con);
		
		return listCount;

	}*/

}
