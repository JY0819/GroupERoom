package com.semi.admin.base.model.service;

import static com.semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.semi.admin.base.model.dao.DepartmentDao;
import com.semi.admin.base.model.vo.Department;

public class DepartmentService {

	// 부서 추가
	public int insertDepart(Department dept) {
		Connection con = getConnection();
		
		int result = new DepartmentDao().insertDepart(con, dept);
		
		if(result > 0) {
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

	
	
	
}
