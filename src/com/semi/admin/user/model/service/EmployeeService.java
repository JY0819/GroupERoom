package com.semi.admin.user.model.service;

import com.semi.admin.user.model.dao.EmployeeDao;
import com.semi.admin.user.model.vo.Employee;
import com.semi.common.vo.Attachments;

import static com.semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

public class EmployeeService {
	// 로그인 처리
	public Employee loginCheck(Employee emp) {
		Connection con = getConnection();
		
		Employee loginUser = new EmployeeDao().loginCheck(con, emp);
		
		close(con);
		
		return loginUser;
	}

	// 파일 포함한 회원 가입
	public int insertEmployee(Employee emp, ArrayList<Attachments> fileList) {
		Connection con = getConnection();
		int result = 0;
		
		int result1 = new EmployeeDao().insertMember(con, emp);
		int result2 = new EmployeeDao().insertAttachment(con, fileList);
		
		if(result1 > 0 && result2 > 0) {
			commit(con);
			result = 1;
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
	


}
