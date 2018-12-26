package com.semi.board.Free.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.semi.board.Free.model.vo.Free;
import static com.semi.common.JDBCTemplate.*;

public class FreeDao {

	private Properties prop = new Properties();
	
	public FreeDao() {
		String fileName = FreeDao.class.getResource("/sql/board/free/free-query.properties").getPath();
	
		try {
			prop.load(new FileReader(fileName));
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	
	
	}
/*	
	//게시물 조회용 메소드
	public ArrayList<Free> selectList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Free> list = null;
		
		String query = prop.getProperty("selectList");
		
		System.out.println(query);
		
		try {
			pstmt= con.prepareStatement(query);
			
			int startRow = (currentPage -1) * limit + 1;
			int endRow = startRow + limit -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset=pstmt.executeQuery();
			
			list=new ArrayList<Free>();
			
			while(rset.next()) {
				Free f = new Free();
				
				f.setBno(rset.getInt("BOARDNO"));
				f.setbClass(rset.getString("BOARDCLASS"));
				f.setbTitle(rset.getString("BOARDTITLE"));
				f.setbContent(rset.getString("BOARDCONTENTS"));

				f.setbDate(rset.getDate("BOARDDATE"));
				f.setbClicks(rset.getInt("BOARDCLICKS"));
				f.setbAttach(rset.getString("BOARDATTACH"));
				f.setComNo(rset.getInt("COMMENTNO"));
				f.setComLevel(rset.getInt("COMMENTLEVEL"));
				f.setRecomId(rset.getString("RECOMMENTID"));
				

				f.setDeptId(rset.getString("DEPTID"));
				f.setReplebno(rset.getInt("REPLEBOARDNO"));
				f.setWriterId(rset.getString("EMPNAME"));
				f.setStatus(rset.getString("WHETHEROFDELETE"));
				f.setFile01(rset.getInt("FILE01"));
				f.setFile02(rset.getInt("FILE02"));
				f.setFile03(rset.getInt("FILE03"));
				
				list.add(f);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		
		return list;
	}

	public int getListCount(Connection con) {
		Statement stmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("listCount");
		
		try {
			stmt=con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
			
		return listCount;
	}*/
	//게시물 조회
	public ArrayList<Free> selectList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Free> list =  null;
		
		String query = prop.getProperty("selectList");
		
		System.out.println(query);
		
		try {
			stmt=con.createStatement();
			rset=stmt.executeQuery(query);

			list=new ArrayList<Free>();
			
			while(rset.next()) {
				Free f = new Free();
				
				f.setBno(rset.getInt("BOARDNO"));
				f.setbClass(rset.getString("BOARDCLASS"));
				f.setbTitle(rset.getString("BOARDTITLE"));
				f.setbContent(rset.getString("BOARDCONTENTS"));

				f.setbDate(rset.getDate("BOARDDATE"));
				f.setbClicks(rset.getInt("BOARDCLICKS"));
				f.setbAttach(rset.getString("BOARDATTACH"));
				f.setComNo(rset.getInt("COMMENTNO"));
				f.setComLevel(rset.getInt("COMMENTLEVEL"));
				f.setRecomId(rset.getString("RECOMMENTID"));
				

				f.setDeptId(rset.getString("DEPTID"));
				f.setReplebno(rset.getInt("REPLEBOARDNO"));
				f.setWriterId(rset.getString("EMPNAME"));
				f.setStatus(rset.getString("WHETHEROFDELETE"));
				f.setFile01(rset.getInt("FILE01"));
				f.setFile02(rset.getInt("FILE02"));
				f.setFile03(rset.getInt("FILE03"));
				
				list.add(f);
			}
			System.out.println("freeDao list:"+list);
			//ddasfdsafd
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}
	//글 작성용 메소드
	public int insertFree(Connection con, Free f) {
		PreparedStatement pstmt = null;
		int result=0;
		String query = prop.getProperty("insertFree");
		
		try {
			pstmt=con.prepareStatement(query);
			
			pstmt.setString(1, f.getbTitle());
			pstmt.setString(2, f.getbContent());
			pstmt.setString(3, f.getWriterId());
			
			System.out.println(f.getbTitle());
			System.out.println(f.getbContent());
			System.out.println(f.getWriterId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	//조회수 증가
	public int updateCount(Connection con, int num) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateCount");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, num);
			pstmt.setInt(2, num);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	//글 상세보기
	public Free selectOne(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Free f = null;
		
		String query = prop.getProperty("selectOne");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				f = new Free();
				
				f.setBno(rset.getInt("BOARDNO"));
				f.setbClass(rset.getString("BOARDCLASS"));
				f.setbTitle(rset.getString("BOARDTITLE"));
				f.setbContent(rset.getString("BOARDCONTENTS"));
				f.setbDate(rset.getDate("BOARDDATE"));
				f.setbClicks(rset.getInt("BOARDCLICKS"));
				f.setbAttach(rset.getString("BOARDATTACH"));
				f.setComNo(rset.getInt("COMMENTNO"));
				f.setComLevel(rset.getInt("COMMENTLEVEL"));
				f.setRecomId(rset.getString("RECOMMENTID"));
				f.setDeptId(rset.getString("DEPTID"));
				f.setReplebno(rset.getInt("REPLEBOARDNO"));
				f.setWriterId(rset.getString("EMPNAME"));
				f.setStatus(rset.getString("WHETHEROFDELETE"));
				f.setFile01(rset.getInt("FILE01"));
				f.setFile02(rset.getInt("FILE02"));
				f.setFile03(rset.getInt("FILE03"));
				
				rset=pstmt.executeQuery();
				
				
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		return f;
	}

}
