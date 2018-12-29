package com.semi.admin.base.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.semi.admin.base.model.vo.Position;
import static com.semi.common.JDBCTemplate.*;

public class PositionDao {
	private Properties prop = new Properties();
	
	public PositionDao() {
		String fileName = Position.class.getResource("/sql/admin/admin-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));

		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 직급 추가
	public int insertPosition(Connection con, Position pos) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertPosition");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, pos.getPositionId());
			pstmt.setString(2, pos.getPositionName());
			pstmt.setInt(3, pos.getPositionNo());
			pstmt.setString(4, pos.getPositionAct());
			pstmt.setString(5, pos.getPositionNote());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	// 직급 리스트 조회
	public ArrayList<Position> selectList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Position> list = null;
		
		String query = prop.getProperty("selectPosList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Position>();
			
			while (rset.next()) {
				Position p = new Position();
				
				p.setPositionId(rset.getString("POSITIONID"));
				p.setPositionName(rset.getString("POSITIONNAME"));
				p.setPositionNo(rset.getInt("POSITIONNO"));
				p.setPositionAct(rset.getString("POSITIONACT"));
				
				String note = "";
				
				if (rset.getString("POSITIONNOTE") != null) {
					note = rset.getString("POSITIONNOTE");
				}
				
				p.setPositionNote(note);
				
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}

	// 직급 상세보기
	public Position selectOne(Connection con, String num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Position p = null;
		
		String query = prop.getProperty("selectPositionOne");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, num);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				p = new Position();
				
				p.setPositionId(rset.getString("POSITIONID"));
				p.setPositionName(rset.getString("POSITIONNAME"));
				p.setPositionNo(rset.getInt("POSITIONNO"));
				p.setPositionAct(rset.getString("POSITIONACT"));
				p.setPositionNote(rset.getString("POSITIONNOTE"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return p;
	}

	// 직급 수정
	public int updatePosition(Connection con, Position p) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updatePosition");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, p.getPositionNo());
			pstmt.setString(2, p.getPositionAct());
			pstmt.setString(3, p.getPositionNote());
			pstmt.setString(4, p.getPositionId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	// 직급 삭제
	public int deletePosition(Connection con, String posId) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("deletePosition");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, posId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	
	
	
	
	
	
	
	
	
}
