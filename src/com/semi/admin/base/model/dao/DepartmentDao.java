package com.semi.admin.base.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.semi.admin.base.model.vo.Department;
import static com.semi.common.JDBCTemplate.*;

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
			pstmt.setInt(5, dept.getDeptHeadId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
