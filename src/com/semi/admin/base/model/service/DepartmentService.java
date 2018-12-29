package com.semi.admin.base.model.service;

import static com.semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.semi.admin.base.model.dao.DepartmentDao;
import com.semi.admin.base.model.dao.PositionDao;
import com.semi.admin.base.model.vo.Department;

public class DepartmentService {

	// 부서 추가
	public int insertDept(Department dept) {
		Connection con = getConnection();

		int result = new DepartmentDao().insertDept(con, dept);

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);

		return result;
	}

	// 부서 리스트 조회
	public ArrayList<Department> selectList() {
		Connection con = getConnection();

		ArrayList<Department> list = new DepartmentDao().selectList(con);

		close(con);

		return list;
	}

	// 부서 상세보기
	public Department selectOne(String num) {
		Connection con = getConnection();

		Department dept = new DepartmentDao().selectOne(con, num);

		close(con);

		return dept;
	}

	// 부서 수정
	public int updateDept(Department dept) {
		Connection con = getConnection();

		int result = new DepartmentDao().updateDept(con, dept);
		
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	// 부서 삭제
	public int deleteDept(String deptId) {
		Connection con = getConnection();
		
		int result = new DepartmentDao().deleteDept(con, deptId);
		
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

}
