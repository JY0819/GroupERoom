package com.semi.myPage.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.semi.myPage.model.vo.Msg;
import static com.semi.common.JDBCTemplate.*;

public class MsgDao {
	private Properties prop = new Properties();
	private String query = "";
	
	public MsgDao () {
		String fileName = MsgDao.class.getResource("/sql/myPage/myPage-query.properties").getPath();
	
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	public ArrayList<Msg> showMyPageMain(Connection con, int userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Msg> list = new ArrayList<Msg>();
		
		query = prop.getProperty("showMyPageMain");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, userId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Msg m = new Msg();
				
				m.setMsgContents(rset.getString("msgContents"));
				m.setMsgSendD(rset.getDate("msgSendD"));
				m.setMsgReceiveD(rset.getDate("msgReceiveD"));
				m.setMsgSender(rset.getString("sender"));
				m.setMsgReceiver(rset.getString("receiver"));
				
				list.add(m);
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
