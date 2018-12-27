package com.semi.admin.base.model.service;

import static com.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.semi.admin.base.model.dao.PositionDao;
import com.semi.admin.base.model.vo.Position;
import static com.semi.common.JDBCTemplate.*;

public class PositionService {

	// 직급 등록
	public int insertPosition(Position pos) {
		Connection con = getConnection();
		
		int result = new PositionDao().insertPosition(con, pos);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	// 직급 조회
	public ArrayList<Position> selectList() {
		Connection con = getConnection();
		
		ArrayList<Position> list = new PositionDao().selectList(con);
		
		close(con);
		
		return list;
	}

}
