package com.semi.admin.user.model.service;

import static com.semi.common.JDBCTemplate.close;
import static com.semi.common.JDBCTemplate.commit;
import static com.semi.common.JDBCTemplate.getConnection;
import static com.semi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.semi.admin.base.model.dao.DepartmentDao;
import com.semi.admin.base.model.vo.Department;
import com.semi.admin.user.model.dao.EmployeeDao;
import com.semi.admin.user.model.vo.Employee;
import com.semi.admin.user.model.vo.LogDepartment;
import com.semi.admin.user.model.vo.LogPosition;
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

	// 파일, 부서, 직책 포함한 회원가입
	public int insertEmployee(Employee emp, ArrayList<Attachments> fileList, LogDepartment ld, LogPosition lp) {
		Connection con = getConnection();
		int result = 0;

		int photoId = new CommonSeqService(con).getFileSeq();

		// 사원 정보
		int result1 = new EmployeeDao().insertAttachment(con, fileList, photoId);
		// 첨부 파일
		int result2 = new EmployeeDao().insertMember(con, emp, photoId);
		// 부서
		int result3 = new EmployeeDao().insertDepartment(con, emp, ld);
		// 직책
		int result4 = new EmployeeDao().insertPosition(con, emp, lp);

		if (result1 > 0 && result2 > 0 && result3 > 0 && result4 > 0) {
			commit(con);
			result = 1;
		} else {
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

		if (result1 > 0 && result2 > 0) {
			commit(con);
			result = 1;
		} else {
			rollback(con);
		}

		close(con);

		return result;
	}

	// 사원 리스트 조회
	public ArrayList<Employee> selectList() {
		Connection con = getConnection();

		ArrayList<Employee> list = new EmployeeDao().selectList(con);

		close(con);

		return list;
	}

	// 사원 상세보기
	public HashMap<String, Object> selectOne(int num) {
		Connection con = getConnection();

		HashMap<String, Object> hmap = null;

		hmap = new EmployeeDao().selectOne(con, num);

		close(con);

		return hmap;
	}

	// 사원 삭제
	public int deleteMember(int userId) {
		Connection con = getConnection();
		int result = 0;

		// 부서 이력의 사원 삭제	
		int result1 = new EmployeeDao().deleteDept(con, userId);
		
		// 직책 이력의 사원 삭제
		int result2 = new EmployeeDao().deletePosition(con, userId);
		
		// 사원 삭제
		int result3 = new EmployeeDao().deleteMember(con, userId);

		if (result1 > 0 && result2 > 0 && result3 > 0) {
			commit(con);
			result = 1;
		} else {
			rollback(con);
		}

		close(con);

		return result;
	}

}
