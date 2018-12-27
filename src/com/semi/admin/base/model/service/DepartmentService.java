package com.semi.admin.base.model.service;

import static com.semi.common.JDBCTemplate.*;

import java.sql.Connection;

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

	
	
	
}
