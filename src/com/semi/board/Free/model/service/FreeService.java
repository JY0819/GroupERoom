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
		
		System.out.println("freeService list: "+list);
		close(con);
		
		return list;
	}
	//글 작성용 메소드
	public int insertFree(Free f) {
		Connection con = getConnection();
		
		int result = new FreeDao().insertFree(con, f);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		return result;
	}
	//글 상세보기
	public Free selectOne(int num) {
		Connection con = getConnection();
		Free f = null;
		
		//조회수 증가
		int result = new FreeDao().updateCount(con, num);
		
		if(result > 0) {
			commit(con);
			f = new FreeDao().selectOne(con, num);
		}else {
			rollback(con);
		}
		close(con);
		
		return f;
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
