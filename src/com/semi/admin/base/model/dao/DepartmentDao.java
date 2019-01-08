package com.semi.admin.base.model.dao;

import static com.semi.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.semi.admin.base.model.vo.Department;
import com.semi.admin.user.model.vo.Employee;
import com.semi.admin.user.model.vo.LogDepartment;

public class DepartmentDao {
	private Properties prop = new Properties();

	public DepartmentDao() {
		String fileName = Department.class.getResource("/sql/admin/admin-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 부서 추가
	public int insertDept(Connection con, Department dept) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertDepartment");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, dept.getDeptId());
			pstmt.setString(2, dept.getDeptName());
			pstmt.setString(3, dept.getDeptAct());
			pstmt.setString(4, dept.getDeptNote());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	// 부서 리스트 조회
	public ArrayList<Department> selectList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Department> list = null;

		String query = prop.getProperty("selectDeptList");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			list = new ArrayList<Department>();

			while (rset.next()) {
				Department dep = new Department();

				dep.setDeptId(rset.getString("DEPTID"));
				dep.setDeptName(rset.getString("DEPTNAME"));
				dep.setDeptAct(rset.getString("DEPTACT"));

				String note = "";
				if (rset.getString("DEPTNOTE") != null) {
					note = rset.getString("DEPTNOTE");
				}
				
				dep.setDeptNote(note);
				
				list.add(dep);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return list;
	}

	// 부서 상세보기
	public Department selectOne(Connection con, String num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Department dept = null;

		String query = prop.getProperty("selectDepartmentOne");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, num);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				dept = new Department();

				dept.setDeptId(rset.getString("DEPTID"));
				dept.setDeptName(rset.getString("DEPTNAME"));
				dept.setDeptAct(rset.getString("DEPTACT"));
				dept.setDeptNote(rset.getString("DEPTNOTE"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return dept;
	}

	// 부서 수정
	public int updateDept(Connection con, Department dept) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateDepartment");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, dept.getDeptAct());
			pstmt.setString(2, dept.getDeptNote());
			pstmt.setString(3, dept.getDeptId());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	// 부서 삭제
	public int deleteDept(Connection con, String deptId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteDepartment");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, deptId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// 부서에 속한 사원 조회
	public ArrayList<Employee> deptMember(Connection con, String deptId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Employee> list = null;
		
		String query = prop.getProperty("departmentMembers");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, deptId);
			
			rset = pstmt.executeQuery();

			list = new ArrayList<Employee>();

			while (rset.next()) {
				Employee emp = new Employee();

				emp.setEmpid(rset.getInt("EMPID"));
				emp.setEmpName(rset.getString("EMPNAME"));
				emp.setDeptName(rset.getString("DEPTNAME"));
				emp.setPositionName(rset.getString("POSITIONNAME"));

				list.add(emp);
			}

			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
