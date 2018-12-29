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
	public int insertDepart(Connection con, Department dept) {
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
				dep.setDeptNote(rset.getString("DEPTNOTE"));

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
			
			if(rset.next()) {
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

}
