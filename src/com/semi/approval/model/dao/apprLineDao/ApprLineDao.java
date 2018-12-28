package com.semi.approval.model.dao.apprLineDao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.semi.approval.approve.model.vo.ApprLine;
import static com.semi.common.JDBCTemplate.*;

public class ApprLineDao {
	
	private Properties prop = new Properties();
	public ApprLineDao() {
		String fileName = ApprLineDao.class.getResource("/sql/approval/trash/trash-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	public ArrayList<ApprLine> selectList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<ApprLine> line = null;
		String query = prop.getProperty("selectapprLineList");
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			line = new ArrayList<ApprLine>();
			while(rset.next()) {
				ApprLine l = new ApprLine();
				l.setApprEmpId(rset.getString("EMPNAME"));
				l.setApprOrder(rset.getInt("APPRORDER"));
				l.setApprNo(rset.getInt("APPRNO"));
				line.add(l);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			System.out.println("결재자 : " + line.size());
			close(rset);
			close(stmt);
		}
		
		
		
		return line;
	}


	

}
