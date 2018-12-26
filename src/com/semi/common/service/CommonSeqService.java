package com.semi.common.service;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;


public class CommonSeqService {

	private Connection con;
	private Properties prop = new Properties();
	
	public CommonSeqService(Connection con){
		this.con = con;
		String fileName = CommonSeqService.class.getResource("/sql/seq.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public int getFileSeq() {
		int pk = -1;
		
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("getFileSeq");
		
		try {
			pstmt = con.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				pk = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return pk;
	}
}
