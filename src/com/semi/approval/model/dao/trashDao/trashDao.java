package com.semi.approval.model.dao.trashDao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.semi.approval.approve.model.vo.Approval;
import static com.semi.common.JDBCTemplate.*;

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
				a.setApprNo(rset.getInt("APPRNO"));
				a.setApprWriter(rset.getString("EMPNAME"));
				a.setDeptId(rset.getString("DEPTID"));
				a.setApprDay(rset.getDate("APPRDAY"));
				a.setApprYn(rset.getString("APPRYN"));
				a.setApprKeep(rset.getString("APPRKEEP"));
				a.setApprCan(rset.getString("APPRCAN"));
				a.setWhetherOfDelete(rset.getString("WHETHEROFDELETE"));
				list.add(a);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		System.out.println(list.get(0).getApprNo());
		return list;
		
	}
	
}
