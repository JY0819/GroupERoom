package com.semi.approval.model.dao.finishApprovalDao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

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
	
		ResultSet rset = null;
	
		HashMap<String, Object> hmap = null;
		DetailDoc d = null;
		Attachment at = null;
		ArrayList<Attachment> list = null;
		
		String query = prop.getProperty("selectdetail1");
		
		
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
					d.setEntryDay(rset.getDate("ENTRYDAY"));
					d.setContents(rset.getString("MANAGECONTENTS"));
					d.setAttachno(rset.getInt("ATTACHNO"));		
					at = new Attachment();
					at.setChangeName(rset.getString("ATTACHNAME"));
					at.setFilePath(rset.getString("ATTACHPATH"));
					
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
			}
		
		
		
		
		return hmap;
		
	}

}
