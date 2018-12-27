package com.semi.admin.user.model.service;

import static com.semi.common.JDBCTemplate.close;
import static com.semi.common.JDBCTemplate.commit;
import static com.semi.common.JDBCTemplate.getConnection;
import static com.semi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.semi.admin.user.model.dao.EmployeeDao;
import com.semi.admin.user.model.vo.Employee;
import com.semi.common.service.CommonSeqService;
import com.semi.common.vo.Attachments;

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
		
		int photoId = new CommonSeqService(con).getFileSeq();
		
		// 사원 정보
		int result1 = new EmployeeDao().insertAttachment(con, fileList, photoId);
		// 첨부 파일
		int result2 = new EmployeeDao().insertMember(con, emp, photoId); 
		
		
		if(result1 > 0 && result2 > 0) {
			commit(con);
			result = 1;
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int updateEmployee(Employee emp, ArrayList<Attachments> fileList) {
		Connection con = getConnection();
		int result = 0;
		
		int photoId = new CommonSeqService(con).getFileSeq();
		
		// 첨부 파일
		int result1 = new EmployeeDao().insertAttachment(con, fileList, photoId);
		// 사원 정보
		int result2 = new EmployeeDao().updateMember(con, emp, photoId); 
		
		
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
