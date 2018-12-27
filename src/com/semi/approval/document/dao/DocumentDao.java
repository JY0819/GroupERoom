package com.semi.approval.document.dao;

import static com.semi.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import com.semi.approval.document.vo.Document;
public class DocumentDao {
	private Properties prop = new Properties();

	public DocumentDao() {
		
		String fileName = DocumentDao.class.getResource("/sql/approval/approval-query.properties").getPath();
		try {
		
			prop.load(new FileReader(fileName));
		
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Document selectForm(Connection con, int id) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Document document = null;
		
		String query = prop.getProperty("selectForm");
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, id);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				document = new Document();
				document.setManageEmpId(rset.getInt("MANAGEEMPID"));
				document.setManageDocNo(rset.getInt("MANAGEDOCNO"));
				document.setManageNo(rset.getInt("MANAGENO"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return document;
	}
}