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
	
	
	public ArrayList<Msg> selectList(Connection con, int userId, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Msg> list = null;
		
		String query = prop.getProperty("selectMsgList");
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setInt(1, userId);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Msg>();
			
			while(rset.next()) {
				Msg m = new Msg();
				
				m.setRnum(rset.getInt("rnum"));
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
			close(pstmt);
			close(rset);
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
	
	public ArrayList<Msg> showMyPageSendMessage(Connection con, int userId, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Msg> list = new ArrayList<Msg>();
		
		query = prop.getProperty("showMyPageSendMessagePaging");
		
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, userId);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Msg m = new Msg();
				
				m.setRnum(rset.getInt("rnum"));
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
	

	public ArrayList<Msg> ShowMyPageLockerMessage(Connection con, int userId, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Msg> list = new ArrayList<Msg>();
		
		query = prop.getProperty("ShowMyPageLockerMessagePaging");
		
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			System.out.println(startRow);
			System.out.println(endRow);
			pstmt.setInt(1, userId);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Msg m = new Msg();
				
				m.setRnum(rset.getInt("rnum"));
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

	
	public Msg messageDetail(Connection con, Msg msg) {
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		ResultSet rset = null;
		ResultSet rset2 = null;
		int result = 0;
		query = prop.getProperty("msgDetail");
			
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, msg.getMsgNo());
			
			rset = pstmt.executeQuery();
			while (rset.next()) {
				msg.setMsgContents(rset.getString("msgContents"));
				msg.setMsgSender(rset.getString("sender"));
				msg.setMsgReceiver(rset.getString("receiver"));
				msg.setMsgSendD(rset.getDate("msgSendD"));
				msg.setMsgReceiveD(rset.getDate("msgReceiveD"));
				msg.setMsgSenderID(rset.getInt("senderid"));
				msg.setMsgReceiverID(rset.getInt("receiverid"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if (msg.getMsgReceiveD() == null) {
			query = prop.getProperty("updateMsgD");
			
			try {
				pstmt2 = con.prepareStatement(query);
				
				pstmt2.setInt(1, msg.getMsgNo());
				
				result = pstmt2.executeUpdate();
				
				System.out.println("메세지를 읽었습니다.");
				
				query = prop.getProperty("readMsgD");
				
				pstmt3 = con.prepareStatement(query);
				
				pstmt3.setInt(1, msg.getMsgNo());
				
				rset2 = pstmt3.executeQuery();
				
				while (rset2.next()) {
					msg.setMsgReceiveD(rset2.getDate("msgReceiveD"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		close(rset);
		close(pstmt);
		
		close(pstmt2);
		close(pstmt3);
		close(rset2);
		
		
		return msg;
	}
	

	public Msg messageDetail(Connection con, Msg msg, String whetherOfSendList) {
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		ResultSet rset = null;
		ResultSet rset2 = null;
		int result = 0;
		query = prop.getProperty("msgDetail");
			
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, msg.getMsgNo());
			
			rset = pstmt.executeQuery();
			while (rset.next()) {
				msg.setMsgContents(rset.getString("msgContents"));
				msg.setMsgSender(rset.getString("sender"));
				msg.setMsgReceiver(rset.getString("receiver"));
				msg.setMsgSendD(rset.getDate("msgSendD"));
				msg.setMsgReceiveD(rset.getDate("msgReceiveD"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if (msg.getMsgReceiveD() == null && whetherOfSendList.equals("false")) {
			query = prop.getProperty("updateMsgD");
			
			try {
				pstmt2 = con.prepareStatement(query);
				
				pstmt2.setInt(1, msg.getMsgNo());
				
				result = pstmt2.executeUpdate();
				
				System.out.println("메세지를 읽었습니다.");
				
				query = prop.getProperty("readMsgD");
				
				pstmt3 = con.prepareStatement(query);
				
				pstmt3.setInt(1, msg.getMsgNo());
				
				rset2 = pstmt3.executeQuery();
				
				while (rset2.next()) {
					msg.setMsgReceiveD(rset2.getDate("msgReceiveD"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		close(rset);
		close(pstmt);
		
		close(pstmt2);
		close(pstmt3);
		close(rset2);
		
		
		return msg;
	}


	public int saveMsgOne(Connection con, int msgNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		pstmt = null;
		query = prop.getProperty("saveMsg");
			
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, msgNo);
			
			result += pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		System.out.println(result + "행이 수정되었습니다.");
		return result;
	}


	public int deleteMsgOne(Connection con, int msgNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		

		pstmt = null;
		query = prop.getProperty("deleteMsg");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, msgNo);
			
			result += pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		System.out.println(result + "행이 수정되었습니다.");
		return result;
	}


	public int sendMsg(Connection con, int empNo, String contents, int receiver) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		query = prop.getProperty("sendMsg");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, contents);
			pstmt.setInt(2, empNo);
			pstmt.setInt(3, receiver);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		
		
		return result;
	}
	

	public int getListCount(Connection con, int userId) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("listCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userId);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return listCount;
	}


	public int getSendListCount(Connection con, int userId) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("listSendCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userId);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return listCount;
	}


	public int getLockerCount(Connection con, int userId) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("listLockerCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userId);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return listCount;
	}


}
