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

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);

		return result;
	}

	// 직급 리스트 조회
	public ArrayList<Position> selectList() {
		Connection con = getConnection();

		ArrayList<Position> list = new PositionDao().selectList(con);

		close(con);

		return list;
	}

	// 직급 상세보기
	public Position selectOne(String num) {
		Connection con = getConnection();

		Position p = new PositionDao().selectOne(con, num);

		close(con);

		return p;
	}

	// 직급 수정
	public int updatePosition(Position p) {
		Connection con = getConnection();

		int result = new PositionDao().updatePosition(con, p);

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);

		return result;
	}

	// 직급 삭제
	public int deletePosition(String posId) {
		Connection con = getConnection();
		
		int result = new PositionDao().deletePosition(con, posId);
		
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

}
