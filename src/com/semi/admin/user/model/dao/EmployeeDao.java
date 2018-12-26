package com.semi.admin.user.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.semi.admin.user.model.vo.Employee;
import com.semi.common.vo.Attachments;

import static com.semi.common.JDBCTemplate.*;

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
			pstmt.setString(2, emp.getEmpPwd());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginUser = new Employee();
				
				loginUser.setEmpid(rset.getInt("EMPID"));
				loginUser.setEmpName(rset.getString("EMPNAME"));
				loginUser.setEmpPwd(rset.getString("EMPPWD"));
				loginUser.setApprovePwd(rset.getString("APPROVEPWD"));
				loginUser.setEmpGender(rset.getString("GENDER"));
				loginUser.setEmpBirth(rset.getDate("GENDER"));
				loginUser.setEmpAddr(rset.getString("EMPADDR"));
				loginUser.setEmpPhone(rset.getString("EMPPHONE"));
				loginUser.setEmpVacCount(rset.getInt("EMPVACCOUNT"));
				loginUser.setAdminAuthority(rset.getString("ADMINAUTHORITY"));
				loginUser.setWhetherOfRetire(rset.getString("WHETHEROFRETIRE"));
				loginUser.setPhotoId(rset.getInt("PHOTOID"));
				loginUser.setEntryDay(rset.getDate("ENTRYDAY"));
				loginUser.setLeaveDay(rset.getDate("LEAVEDAY"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return loginUser;
	}

	public int insertMember(Connection con, Employee emp) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int insertAttachment(Connection con, ArrayList<Attachments> fileList) {
		// TODO Auto-generated method stub
		return 0;
	}

}
