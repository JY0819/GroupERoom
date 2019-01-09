package com.semi.common.dao;

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
import com.semi.common.vo.Alarm;
import com.semi.common.vo.DeptEmp;
import com.semi.schedule.model.dao.ScheduleDao;

public class AttachmentsDao {
	private Properties prop = new Properties();
	private String query = "";
	
	public AttachmentsDao() {
		String fileName = AlarmDao.class.getResource("/sql/attachments.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public String getAttachmentPath(Connection con, int userPhotoId) {
		String result = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		query = prop.getProperty("getAttachmentPath");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, userPhotoId);
			
			rset = pstmt.executeQuery();
			
			while (rset.next()) {

				result = rset.getString("attachName");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}


	

}
