package com.semi.admin.user.model.dao;

import static com.semi.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
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

			// System.out.println("insertMember photoId > " + photoId);
			System.out.println(" emp : >> \n" + emp.toString());
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
				emp.setEmpPwd(rset.getString("EMPPWD"));
				emp.setApprovePwd(rset.getString("APPROVEPWD"));
				emp.setEmpGender(rset.getString("EMPGENDER"));
				emp.setEmpBirth(rset.getDate("EMPBIRTH"));
				emp.setEmpAddr(rset.getString("EMPADDR"));
				emp.setEmpPhone(rset.getString("EMPPHONE"));
				emp.setEmpVacCount(rset.getInt("EMPVACCOUNT"));
				emp.setAdminAuthority(rset.getString("ADMINAUTHORITY"));
				emp.setWhetherOfRetire(rset.getString("WHETHEROFRETIRE"));
				emp.setPhotoId(rset.getInt("PHOTOID"));
				emp.setEntryDay(rset.getDate("ENTRYDAY"));
				emp.setLeaveDay(rset.getDate("LEAVEDAY"));
				emp.setDeptId(rset.getString("DEPTID"));
				emp.setDeptName(rset.getString("DEPTNAME"));
				emp.setPositionId(rset.getString("POSITIONID"));
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
				emp.setEmpVacCount(rset.getInt("EMPVACCOUNT"));
				emp.setAdminAuthority(rset.getString("ADMINAUTHORITY"));
				emp.setWhetherOfRetire(rset.getString("WHETHEROFRETIRE"));
				// emp.setPhotoId(rset.getInt("PHOTOID"));
				emp.setEntryDay(rset.getDate("ENTRYDAY"));
				// emp.setLeaveDay(rset.getDate("LEAVEDAY"));

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

}
