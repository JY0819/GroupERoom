package com.semi.approval.model.dao.updateMyDocDao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.semi.approval.approve.model.vo.DetailDoc;
import static com.semi.common.JDBCTemplate.*;

public class UpdateMyDocDao {
	private Properties prop = new Properties();
	public UpdateMyDocDao() {
		String fileName = UpdateMyDocDao.class.getResource("/sql/approval/documentAppr/docappr-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public int updateMyDoc(Connection con, DetailDoc detaildoc) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateMyDoc");
		
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, detaildoc.getTitle());
			pstmt.setString(2, detaildoc.getContents());
			pstmt.setInt(3, detaildoc.getManagedocno());
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
