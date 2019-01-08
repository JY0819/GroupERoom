package com.semi.approval.model.dao.finishApprovalDao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.semi.approval.approve.model.vo.ApprLine;
import com.semi.approval.approve.model.vo.DetailDoc;

import com.semi.board.Free.model.vo.Attachment;

import static com.semi.common.JDBCTemplate.*;
public class DetailOneDao {
	private Properties prop = new Properties();
	public DetailOneDao() {
		String fileName = DetailOneDao.class.getResource("/sql/approval/documentAppr/docappr-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}

	public HashMap<String, Object> selectDetailMap(Connection con, int docno) {
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		
		ResultSet rset = null;
		ResultSet rset2 = null;
	
		HashMap<String, Object> hmap = null;
		DetailDoc d = null;
		Attachment at = null;
		ArrayList<Attachment> list = null;
		
		String query = prop.getProperty("selectdetail1");
		String query2 = prop.getProperty("selectdetail2");
		
		
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, docno);
				
				rset = pstmt.executeQuery();
				
				list = new ArrayList<Attachment>();
				
				while(rset.next()) {
					d = new DetailDoc();
					
					d.setManageclass(rset.getInt("MANAGECLASS"));
					d.setManagedocno(rset.getInt("MANAGEDOCNO"));
					d.setManageempid(rset.getInt("MANAGEEMPID"));
					d.setVacStart(rset.getDate("VACAPPRSTART"));
					d.setVarEnd(rset.getDate("VACAPPREND"));
					d.setVacReason(rset.getString("VACAPPRREASON"));
					d.setTitle(rset.getString("MANAGETITLE"));
					d.setManageDay(rset.getDate("MANAGEDAY"));
					d.setContents(rset.getString("MANAGECONTENTS"));
					d.setEntryDay(rset.getDate("ENTRYDAY"));
					
					d.setAttachno(rset.getInt("ATTACHNO"));
					
					pstmt2 = con.prepareStatement(query2);
					pstmt2.setInt(1, d.getAttachno());
					rset2 = pstmt2.executeQuery();
					if(rset2.next()) {
						at = new Attachment();
						at.setFilePath(rset2.getString("ATTACHPATH"));
						at.setChangeName(rset2.getString("ATTACHNAME"));
					}
					list.add(at);
			}
				
					
					hmap = new HashMap<String, Object>();
					hmap.put("detaildoc", d);
					hmap.put("attachment", list);
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
				close(rset2);
				close(pstmt2);
			}
		
		
		
		
		return hmap;
		
	}

	public ArrayList<ApprLine> selelctList(Connection con, int docno) {
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;

		ArrayList<ApprLine> list = null;
		
		String query = prop.getProperty("apprlinelist");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, docno);
			rset = pstmt.executeQuery();
			list = new ArrayList<ApprLine>();
			while(rset.next()) {
				
				ApprLine apprline = new ApprLine();
				apprline.setApprName(rset.getString("EMPNAME"));
				list.add(apprline);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}

	
		return list;
	}

}
