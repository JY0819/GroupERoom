package com.semi.myPage.model.Msg.dao;

import static com.semi.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.semi.myPage.model.Msg.vo.Msg;

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
				
				m.setMsgNo(rset.getInt("msgNo"));
				m.setMsgContents(rset.getString("msgContents"));
				m.setMsgSendD(rset.getDate("msgSendD"));
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


	public int deleteMsg(Connection con, ArrayList<Integer> deletelist) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		for (int i = 0; i < deletelist.size(); i++) {
			pstmt = null;
			query = prop.getProperty("deleteMsg");
			
			try {
				pstmt = con.prepareStatement(query);
				
				pstmt.setInt(1, deletelist.get(i));
				
				result += pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		close(pstmt);
		
		System.out.println(result + "행이 수정되었습니다.");
		return result;
	}


	public int saveMsg(Connection con, ArrayList<Integer> savelist) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		for (int i = 0; i < savelist.size(); i++) {
			pstmt = null;
			query = prop.getProperty("saveMsg");
			
			try {
				pstmt = con.prepareStatement(query);
				
				pstmt.setInt(1, savelist.get(i));
				
				result += pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		close(pstmt);
		
		System.out.println(result + "행이 수정되었습니다.");
		return result;
	}


	public ArrayList<Msg> showMyPageSendMessage(Connection con, int userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Msg> list = new ArrayList<Msg>();
		
		query = prop.getProperty("showMyPageSendMessage");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, userId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Msg m = new Msg();
				
				m.setMsgNo(rset.getInt("msgNo"));
				m.setMsgContents(rset.getString("msgContents"));
				m.setMsgSendD(rset.getDate("msgSendD"));
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


	public ArrayList<Msg> ShowMyPageLockerMessage(Connection con, int userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Msg> list = new ArrayList<Msg>();
		
		query = prop.getProperty("ShowMyPageLockerMessage");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, userId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Msg m = new Msg();
				
				m.setMsgNo(rset.getInt("msgNo"));
				m.setMsgContents(rset.getString("msgContents"));
				m.setMsgSendD(rset.getDate("msgSendD"));
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
