package com.semi.myPage.model.Etc.dao;

import static com.semi.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.semi.myPage.model.Etc.vo.LogOfVacation;
import com.semi.myPage.model.Msg.dao.MsgDao;

public class LogOfVacationDao {
	private Properties prop = new Properties();
	private String query = "";
	
	public LogOfVacationDao () {
		String fileName = MsgDao.class.getResource("/sql/myPage/myPage-query.properties").getPath();
	
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<LogOfVacation> ShowMyPageLogOfVac(Connection con, int userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<LogOfVacation> list = new ArrayList<LogOfVacation>();
		
		query = prop.getProperty("ShowMyPageLogOfVac");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, userId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				LogOfVacation v = new LogOfVacation();
				
				v.setNo(rset.getInt("rnum"));
				v.setUseReason(rset.getString("useReason"));
				v.setUseStart(rset.getDate("useStart"));
				v.setUseEnd(rset.getDate("useEnd"));
				v.setUseVacAppDay(rset.getDate("useVacAppDay"));
				v.setEmpId(rset.getString("aName"));
				v.setApprEmpId(rset.getString("bName"));
				
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

}
