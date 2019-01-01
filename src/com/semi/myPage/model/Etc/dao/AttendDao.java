package com.semi.myPage.model.Etc.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.semi.myPage.model.Etc.vo.Attend;
import com.semi.myPage.model.Msg.dao.MsgDao;

import static com.semi.common.JDBCTemplate.*;

public class AttendDao {
	private Properties prop = new Properties();
	private String query = "";
	
	public AttendDao () {
		String fileName = MsgDao.class.getResource("/sql/myPage/myPage-query.properties").getPath();
	
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	public ArrayList<Attend> chkAttend(Connection con, int empId) {
		ArrayList<Attend> list = new ArrayList<Attend>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		query = prop.getProperty("chkAttend");
		
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, empId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Attend at = new Attend();
				
				at.setRnum(rset.getInt("RNUM"));
				at.setEmpId(rset.getInt("EMPID"));
				at.setEmpName(rset.getString("EMPNAME"));
				at.setAttendance(rset.getDate("ATTENDANCE"));
				at.setGetOff(rset.getDate("GETOFF"));
				
				list.add(at);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
				
		
		
		return list;
	}

}
