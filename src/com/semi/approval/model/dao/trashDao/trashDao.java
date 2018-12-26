/*package com.semi.approval.model.dao.trashDao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.semi.approval.model.vo.Approval;

public class trashDao {
	private Properties prop = new Properties();
	public trashDao() {
		String fileName = trashDao.class.getResource("/sql/approval/trash/trash-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public ArrayList<Approval> selectList(Connection con) {
		
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Approval> list = null;
		
		String query = prop.getProperty("selecttrashList");
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			list = new ArrayList<Approval>();
			while(rset.next()) {
				Approval a = new Approval();
				a.setApprNo(rset.getInt("EMPID"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

}
*/