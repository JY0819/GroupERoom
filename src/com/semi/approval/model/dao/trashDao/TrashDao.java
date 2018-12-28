package com.semi.approval.model.dao.trashDao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.semi.approval.approve.model.vo.ApprLine;
import com.semi.approval.approve.model.vo.Approval;
import static com.semi.common.JDBCTemplate.*;

public class TrashDao {
	private Properties prop = new Properties();
	public TrashDao() {
		String fileName = TrashDao.class.getResource("/sql/approval/trash/trash-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public ArrayList<Approval> selectList(Connection con) {
		System.out.println("dao들어옴");
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
			System.out.println(list.size());
			close(rset);
			close(stmt);
		}
		
		return list;
		
	}
	public ArrayList<ApprLine> selectLineList(Connection con) {
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
