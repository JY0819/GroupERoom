package com.semi.approval.model.dao.defaultSettingDao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import static com.semi.common.JDBCTemplate.*;

public class DefaultSettingDao {
	private Properties prop = new Properties();
	public DefaultSettingDao() {
		String fileName = DefaultSettingDao.class.getResource("/sql/approval/defaultSetting/setting-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public int loginCheck(Connection con, String nowpwd, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("pwdCheck");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, nowpwd);
			pstmt.setString(2, userId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		
		
		return result;
		
	}


	public int updatePwd(Connection con, String userId, String newpwd2) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updatePwd");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, newpwd2);
			pstmt.setString(2, userId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		
		return result;
	}

}
