package com.semi.admin.user.model.dao;

import static com.semi.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.semi.admin.base.model.vo.Department;
import com.semi.admin.user.model.vo.Employee;
import com.semi.admin.user.model.vo.LogDepartment;
import com.semi.admin.user.model.vo.LogOfVacation;
import com.semi.admin.user.model.vo.LogPosition;
import com.semi.common.vo.Attachments;

public class EmployeeDao {
	private Properties prop = new Properties();

	public EmployeeDao() {
		String fileName = EmployeeDao.class.getResource("/sql/admin/admin-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 로그인 처리
	public Employee loginCheck(Connection con, Employee emp) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Employee loginUser = null;

		String query = prop.getProperty("loginSelect");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, emp.getEmpid());
			pstmt.setInt(2, emp.getEmpid());
			pstmt.setInt(3, emp.getEmpid());
			pstmt.setInt(4, emp.getEmpid());
			pstmt.setInt(5, emp.getEmpid());
			pstmt.setString(6, emp.getEmpPwd());

			rset = pstmt.executeQuery();

			if (rset.next()) {
				loginUser = new Employee();

				loginUser.setEmpid(rset.getInt("EMPID"));
				loginUser.setEmpName(rset.getString("EMPNAME"));
				loginUser.setEmpPwd(rset.getString("EMPPWD"));
				loginUser.setApprovePwd(rset.getString("APPROVEPWD"));
				loginUser.setEmpGender(rset.getString("EMPGENDER"));
				loginUser.setEmpBirth(rset.getDate("EMPBIRTH"));
				loginUser.setEmpAddr(rset.getString("EMPADDR"));
				loginUser.setEmpPhone(rset.getString("EMPPHONE"));
				loginUser.setEmpVacCount(rset.getInt("EMPVACCOUNT"));
				loginUser.setAdminAuthority(rset.getString("ADMINAUTHORITY"));
				loginUser.setWhetherOfRetire(rset.getString("WHETHEROFRETIRE"));
				loginUser.setPhotoId(rset.getInt("PHOTOID"));
				loginUser.setEntryDay(rset.getDate("ENTRYDAY"));
				loginUser.setLeaveDay(rset.getDate("LEAVEDAY"));
				loginUser.setDeptId(rset.getString("DEPTID"));
				loginUser.setDeptName(rset.getString("DEPTNAME"));
				loginUser.setPositionId(rset.getString("POSITIONID"));
				loginUser.setPositionName(rset.getString("POSITIONNAME"));

			}

			System.out.println(loginUser.toString());

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return loginUser;
	}

	// 사원 등록 - 사원정보 (result1)
	public int insertMember(Connection con, Employee emp, int photoId) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertMember");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, emp.getEmpid());
			pstmt.setString(2, emp.getEmpName());
			pstmt.setString(3, emp.getEmpPwd());
			pstmt.setString(4, emp.getApprovePwd());
			pstmt.setString(5, emp.getEmpGender());
			pstmt.setDate(6, emp.getEmpBirth());
			pstmt.setString(7, emp.getEmpAddr());
			pstmt.setString(8, emp.getEmpPhone());
			pstmt.setString(9, emp.getAdminAuthority());
			pstmt.setInt(10, photoId); // PHOTOID
			pstmt.setDate(11, emp.getEntryDay());
			pstmt.setInt(12, emp.getEmpVacCount());

			// System.out.println("insertMember photoId > " + photoId);
//			System.out.println(" emp : >> \n" + emp.toString());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		close(pstmt);

		return result;
	}

	// 사원 등록 - 첨부파일 (result2)
	public int insertAttachment(Connection con, ArrayList<Attachments> fileList, int photoId) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertEmpAttatchment");

		try {
			for (int i = 0; i < fileList.size(); i++) {
				pstmt = con.prepareStatement(query);
				System.out.println(fileList.get(i).getAttachPreName());
				System.out.println(fileList.get(i).getAttachName());
				System.out.println(fileList.get(i).getAttachPath());
				pstmt.setInt(1, photoId); // ATTACHNO
				pstmt.setString(2, fileList.get(i).getAttachPreName());
				pstmt.setString(3, fileList.get(i).getAttachName());
				pstmt.setString(4, fileList.get(i).getAttachPath());
				result = pstmt.executeUpdate();
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	// 사원 등록 - 부서 (result3)
	public int insertDepartment(Connection con, Employee emp, LogDepartment ld) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertUserDept");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, emp.getEmpid());
			pstmt.setString(2, ld.getDeptId());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	// 사원 등록 - 직책 (result4)
	public int insertPosition(Connection con, Employee emp, LogPosition lp) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertUserPosition");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, lp.getPositionId());
			pstmt.setInt(2, emp.getEmpid());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int updateMember(Connection con, Employee emp, int photoId) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("updateMember");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, emp.getEmpPwd());
			pstmt.setString(2, emp.getEmpPhone());
			pstmt.setString(3, emp.getEmpAddr());
			pstmt.setString(4, emp.getApprovePwd());
			pstmt.setInt(5, photoId); // PHOTOID

			// System.out.println("insertMember photoId > " + photoId);
			System.out.println(" emp : >> \n" + emp.toString());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public String attendCheck(Connection con, Employee emp) {
		String result = "";
		PreparedStatement pstmt = null;

		String query = prop.getProperty("attendCheck");

		return result;
	}
	
/*
	// 사원 리스트 조회
	public ArrayList<Employee> selectList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Employee> list = null;

		String query = prop.getProperty("selectMemberList");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			list = new ArrayList<Employee>();

			while (rset.next()) {
				Employee emp = new Employee();

				emp.setEmpid(rset.getInt("EMPID"));
				emp.setEmpName(rset.getString("EMPNAME"));
				emp.setEmpGender(rset.getString("EMPGENDER"));
				emp.setEmpPhone(rset.getString("EMPPHONE"));
				emp.setWhetherOfRetire(rset.getString("WHETHEROFRETIRE"));
				emp.setDeptName(rset.getString("DEPTNAME"));
				emp.setPositionName(rset.getString("POSITIONNAME"));

				list.add(emp);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return list;
	}
*/
	
	// 페이징 처리 - 사원 리스트 조회
	public ArrayList<Employee> selectList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Employee> list = null;

		String query = prop.getProperty("selectMemberList");
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			list = new ArrayList<Employee>();
			
			while (rset.next()) {
				Employee emp = new Employee();

				emp.setEmpid(rset.getInt("EMPID"));
				emp.setEmpName(rset.getString("EMPNAME"));
				emp.setEmpGender(rset.getString("EMPGENDER"));
				emp.setEmpPhone(rset.getString("EMPPHONE"));
				emp.setWhetherOfRetire(rset.getString("WHETHEROFRETIRE"));
				emp.setDeptName(rset.getString("DEPTNAME"));
				emp.setPositionName(rset.getString("POSITIONNAME"));

				list.add(emp);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	// 사원 상세보기
	public HashMap<String, Object> selectOne(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		Employee emp = null;
		Attachments at = null;
		ArrayList<Attachments> list = null;

		String query = prop.getProperty("selectMemberOne");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);

			rset = pstmt.executeQuery();

			list = new ArrayList<Attachments>();

			while (rset.next()) {
				emp = new Employee();

				emp.setEmpid(rset.getInt("EMPID"));
				emp.setEmpName(rset.getString("EMPNAME"));
				emp.setEmpPwd(rset.getString("EMPPWD"));
				emp.setApprovePwd(rset.getString("APPROVEPWD"));
				emp.setEmpGender(rset.getString("EMPGENDER"));
				emp.setEmpBirth(rset.getDate("EMPBIRTH"));
				emp.setEmpAddr(rset.getString("EMPADDR"));
				emp.setEmpPhone(rset.getString("EMPPHONE"));
				emp.setAdminAuthority(rset.getString("ADMINAUTHORITY"));
				emp.setWhetherOfRetire(rset.getString("WHETHEROFRETIRE"));
				emp.setEntryDay(rset.getDate("ENTRYDAY"));
				emp.setLeaveDay(rset.getDate("LEAVEDAY"));
				emp.setEmpVacCount(rset.getInt("EMPVACCOUNT"));
				emp.setDeptId(rset.getString("DEPTID"));
				emp.setDeptName(rset.getString("DEPTNAME"));
				emp.setPositionId(rset.getString("POSITIONID"));
				emp.setPositionName(rset.getString("POSITIONNAME"));

				at = new Attachments();

				at.setAttachNo(rset.getInt("ATTACHNO"));
				at.setAttachPreName(rset.getString("ATTACHPRENAME"));
				at.setAttachName(rset.getString("ATTACHNAME"));
				at.setAttachPath(rset.getString("ATTACHPATH"));
				at.setAttachDay(rset.getDate("ATTACHDAY"));

				list.add(at);
			}

			hmap = new HashMap<String, Object>();
			hmap.put("emp", emp);
			hmap.put("attachment", list);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return hmap;
	}

	// 사원 삭제
	public int deleteMember(Connection con, String userId) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("deleteDepartment");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	// 사원 부서 이력 삭제 (result1)
	public int deleteDept(Connection con, int userId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteMemberLogDept");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userId);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// 사원 직책 이력 삭제 (result2)
	public int deletePosition(Connection con, int userId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteMemberLogPos");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userId);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// 사원 삭제
	public int deleteMember(Connection con, int userId) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("deleteMember");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userId);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	/**
	 * @see 관리자 - 회원 수정
	 * @author 이주영
	 * @since 19.01.05
	 */
	public int updateEmployee(Connection con, Employee emp) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateEmployee");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, emp.getEmpPwd());
			pstmt.setString(2, emp.getEmpPhone());
			pstmt.setString(3, emp.getEmpAddr());
			pstmt.setString(4, emp.getWhetherOfRetire());
			pstmt.setDate(5, emp.getLeaveDay());
			pstmt.setInt(7, emp.getEmpVacCount());
			pstmt.setInt(6, emp.getEmpid());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	/**
	 * @see 관리자 - 회원 수정 (부서 이력 변경)
	 * @author 이주영
	 * @since 19.01.05
	 */
	public int updateEmpDept(Connection con, Employee emp, LogDepartment ld) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateEmpLogDept");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, emp.getEmpid());
			pstmt.setString(2, ld.getDeptId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	/**
	 * @see 관리자 - 회원 수정 (직책 이력 변경)
	 * @author 이주영
	 * @since 19.01.05
	 */
	public int updateEmpPos(Connection con, Employee emp, LogPosition lp) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateEmpLogPos");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, lp.getPositionId());
			pstmt.setInt(2, emp.getEmpid());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	// 아이디 중복검사
	public int idCheck(Connection con, Integer userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("empIdCheck");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	// 이름으로 검색
	public ArrayList<Employee> searchMember(Connection con, String userName) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Employee> list = null;

		String query = prop.getProperty("searchEmpName");

		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, userName);
			
			rset = pstmt.executeQuery();

			list = new ArrayList<Employee>();

			while (rset.next()) {
				Employee emp = new Employee();

				emp.setEmpid(rset.getInt("EMPID"));
				emp.setEmpName(rset.getString("EMPNAME"));
				emp.setEmpGender(rset.getString("EMPGENDER"));
				emp.setEmpPhone(rset.getString("EMPPHONE"));
				emp.setWhetherOfRetire(rset.getString("WHETHEROFRETIRE"));
				emp.setDeptName(rset.getString("DEPTNAME"));
				emp.setPositionName(rset.getString("POSITIONNAME"));

				list.add(emp);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	// 페이징 처리 - 사원 휴가 리스트 조회
	public ArrayList<LogOfVacation> selectVacList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<LogOfVacation> list = null;

		String query = prop.getProperty("selectMemberVacList");
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			list = new ArrayList<LogOfVacation>();
			
			while (rset.next()) {
				LogOfVacation v = new LogOfVacation();

				v.setEmpId(rset.getInt("EMPID"));
				v.setUseReason(rset.getString("USEREASON"));
				v.setEmpName(rset.getString("EMPNAME"));
				v.setDeptName(rset.getString("DEPTNAME"));
				v.setUseStart(rset.getDate("USESTART"));
				v.setUseEnd(rset.getDate("USEEND"));
				v.setUseVacAppDay(rset.getDate("USEVACAPPDAY"));
				v.setApprEmpId(rset.getString("APPREMPID"));
				v.setDays(rset.getInt("CNT"));	// 사용일
				
				list.add(v);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	// 휴가 사원 이름으로 검색
	public ArrayList<LogOfVacation> searchVac(Connection con, String userName) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<LogOfVacation> list = null;

		String query = prop.getProperty("searchVacation");

		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, userName);
			
			rset = pstmt.executeQuery();

			list = new ArrayList<LogOfVacation>();

			while (rset.next()) {
				LogOfVacation v = new LogOfVacation();

				v.setEmpId(rset.getInt("EMPID"));
				v.setUseReason(rset.getString("USEREASON"));
				v.setEmpName(rset.getString("EMPNAME"));
				v.setDeptName(rset.getString("DEPTNAME"));
				v.setUseStart(rset.getDate("USESTART"));
				v.setUseEnd(rset.getDate("USEEND"));
				v.setUseVacAppDay(rset.getDate("USEVACAPPDAY"));
				v.setApprEmpId(rset.getString("APPREMPID"));
				v.setDays(rset.getInt("CNT"));	// 사용일

				list.add(v);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	// 전체 사원 수 조회
	public int getListCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;

		String query = prop.getProperty("memberListCount");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			if (rset.next()) {
				listCount = rset.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return listCount;
	}
	
	// 전체 휴가 수 조회
	public int getVacListCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;

		String query = prop.getProperty("vacListCount");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			if (rset.next()) {
				listCount = rset.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return listCount;
	}

	

	

}
