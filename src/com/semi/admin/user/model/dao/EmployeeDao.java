package com.semi.admin.user.model.dao;

import static com.semi.common.JDBCTemplate.*;

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
				loginUser.setEmpGender(rset.getString("EMPGENDER"));
				loginUser.setEmpBirth(rset.getDate("BIRTH"));
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

	// 사원 등록
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
			
//			System.out.println("insertMember photoId > " + photoId);
			System.out.println(" emp : >> \n" + emp.toString());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} close(pstmt);
		
		return result;
	}
	
	// 사원 등록 - 첨부파일
	public int insertAttachment(Connection con, ArrayList<Attachments> fileList, int photoId) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertEmpAttatchment");
		
		try {
			for (int i = 0; i < fileList.size(); i++) {
				pstmt = con.prepareStatement(query);
				
				pstmt.setInt(1, photoId); //  ATTACHNO
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

}
