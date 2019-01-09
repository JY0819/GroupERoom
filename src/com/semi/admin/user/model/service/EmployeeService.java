package com.semi.admin.user.model.service;

import static com.semi.common.JDBCTemplate.*;
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
import com.semi.admin.user.model.vo.LogOfVacation;
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

		System.out.println("photoId" + photoId);
		// 파일 첨부
		int result1 = new EmployeeDao().insertAttachment(con, fileList, photoId);
		// 사원 정보
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
	
/*
	// 사원 리스트 조회
	public ArrayList<Employee> selectList() {
		Connection con = getConnection();

		ArrayList<Employee> list = new EmployeeDao().selectList(con);

		close(con);

		return list;
	}
*/
	// 페이징 처리 - 사원 리스트 조회
	public ArrayList<Employee> selectList(int currentPage, int limit) {
		Connection con = getConnection();

		ArrayList<Employee> list = new EmployeeDao().selectList(con, currentPage, limit);
		
		close(con);
		
		return list;
	}
	
	// 전체 사원 수 조회
	public int getListCount() {
		Connection con = getConnection();
		
		int listCount = new EmployeeDao().getListCount(con);
		
		close(con);
		
		return listCount;
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

	// 관리자 - 사원정보 수정
	public int updateEmployee(Employee emp, LogDepartment ld, LogPosition lp) {
		Connection con = getConnection();
		int result = 0;
		
		int result1 = new EmployeeDao().updateEmployee(con, emp);
		int result2 = new EmployeeDao().updateEmpDept(con, emp, ld);
		int result3 = new EmployeeDao().updateEmpPos(con, emp, lp);
		
		if (result1 > 0 && result2 > 0 && result3 > 0) {
			commit(con);
			result = 1;
		} else {
			rollback(con);
		}
		
		close(con);

		return result;
	}

	// 아이디 중복 검사
	public int idCheck(Integer userId) {
		Connection con = getConnection();
		
		int result = new EmployeeDao().idCheck(con, userId);
		
		close(con);
		
		return result;
	}
	
	// 사원 리스트에서 이름으로 검색
	public ArrayList<Employee> searchMember(String userName) {
		Connection con = getConnection();
		
		ArrayList<Employee> list = new EmployeeDao().searchMember(con, userName);
		
		close(con);
		
		return list;
	}
	
	
	// 페이징 처리 - 사원 휴가 리스트 조회
	public ArrayList<LogOfVacation> selectVacList(int currentPage, int limit) {
		Connection con = getConnection();

		ArrayList<LogOfVacation> list = new EmployeeDao().selectVacList(con, currentPage, limit);
		
		close(con);
		
		return list;
	}

	// 휴가 사원 이름으로 검색
	public ArrayList<LogOfVacation> searchVac(String userName) {
		Connection con = getConnection();
		
		ArrayList<LogOfVacation> list = new EmployeeDao().searchVac(con, userName);
		
		close(con);
		
		return list;
	}
	
	// 전체 휴가 수 조회
	public int getVacListCount() {
		Connection con = getConnection();
		
		int listCount = new EmployeeDao().getVacListCount(con);
		
		close(con);
		
		return listCount;
	}

	public int mypageUpdateEmployee(Employee emp, ArrayList<Attachments> fileList) {
		Connection con = getConnection();
		int result = 0;
		int result1 = 0;
		int result2 = 0;
		
		int photoId = new CommonSeqService(con).getFileSeq();

		// 첨부 파일
		if (fileList.size() > 0) {
			result1 = new EmployeeDao().insertAttachment(con, fileList, photoId);
			// 사원 정보
			result2 = new EmployeeDao().mypageUpdateEmployee(con, emp, photoId);
			
			if (result1 > 0 && result2 > 0) {
				commit(con);
				result = 1;
			} else {
				rollback(con);
			}
		} else {
			// 사원 정보
			result2 = new EmployeeDao().mypageUpdateEmployee(con, emp);
			
			if (result2 > 0) {
				commit(con);
				result = 1;
			} else {
				rollback(con);
			}
		}
		

		

		close(con);

		return result;
	}


}
