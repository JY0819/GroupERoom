package com.semi.memo.model.dao;

import static com.semi.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.semi.memo.model.vo.Memo;

public class MemoDao {
	
	private Properties prop=new Properties();
	
	public MemoDao() {
		String fileName=MemoDao.class.getResource("/sql/memo.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	//메모 불러오기
	public Memo selectMemo(Connection con, int empId) {
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		Memo memo=null;
		
		String query=prop.getProperty("selectMemo");
		System.out.println(query);
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, empId);
			
			rset=pstmt.executeQuery();
			
			memo=new Memo();
			
			while(rset.next()) {
				memo.setMemoNo(rset.getInt("NOTENO"));
				memo.setMemoContents(rset.getString("NOTECONTENTS"));
				memo.setEmpId(rset.getInt("EMPID"));
				if(rset.getInt("NOTENO")==0) {
					memo=null;	
				}else {					
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return memo;
	}

	public int insertMemo(Connection con, Memo reqMemo) {
		PreparedStatement pstmt=null;
		int result=0;
		
		String query=prop.getProperty("insertMemo");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, reqMemo.getMemoContents());
			pstmt.setInt(2, reqMemo.getEmpId());
			
			result=pstmt.executeUpdate();
			
			if(result>0) {
				commit(con);
				System.out.println("작성 완료");
			}else {
				rollback(con);
				System.out.println("작성 실패");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			System.out.println("dao result:"+result);
		}
	
		return result;
	}


	public String selectEmpPhoto(Connection con, int photoId) {
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String imgPath="";
		
		String query=prop.getProperty("selectEmpPhoto");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, photoId);
			
			System.out.println(query);
			
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				System.out.println(rset.getString("ATTACHPATH")+"!!@#!@#!@#"+rset.getString("ATTACHNAME"));
				imgPath=rset.getString("ATTACHNAME");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return imgPath;
	}

}
