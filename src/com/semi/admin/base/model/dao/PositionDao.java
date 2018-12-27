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

	// 직급 조회
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
				p.setPositionNote(rset.getString("POSITIONNOTE"));
				
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

}
