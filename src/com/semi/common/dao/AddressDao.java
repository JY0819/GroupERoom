package com.semi.common.dao;

import static com.semi.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.semi.admin.user.model.vo.Employee;
import com.semi.common.vo.DeptEmp;
import com.semi.schedule.model.dao.ScheduleDao;

public class AddressDao {

	private Properties prop=new Properties();
	
	public AddressDao() {
		String fileName=AddressDao.class.getResource("/sql/address.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public ArrayList<Integer> selectEmpIdList(Connection con) {
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		ArrayList<Integer> empIdList=null;
		
		String query=prop.getProperty("empIdList");
		
		try {
			pstmt=con.prepareStatement(query);
			
			empIdList=new ArrayList<Integer>();
			rset=pstmt.executeQuery();
			while(rset.next()) {
				empIdList.add(rset.getInt("EMPID"));
			}
			System.out.println("dao empId : "+empIdList);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return empIdList;
	}


	public ArrayList<String> selectDeptIdList(Connection con) {
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		ArrayList<String> deptIdList=null;
		
		String query=prop.getProperty("deptIdList");
		
		try {
			pstmt=con.prepareStatement(query);
			
			rset=pstmt.executeQuery();
			
			deptIdList=new ArrayList<String>();
			
			while(rset.next()) {
				deptIdList.add(rset.getString("DEPTID"));
			}
			
			System.out.println("dao DEPTID : "+deptIdList);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return deptIdList;
	}
	
	//ArrayList에 Emp 넣는
	public DeptEmp selectEmpList(Connection con, Integer empId) {
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		DeptEmp emp=null;
		
		String query=prop.getProperty("selectEmp");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, empId);
			pstmt.setInt(2, empId);
			pstmt.setInt(3, empId);
			pstmt.setInt(4, empId);
			pstmt.setInt(5, empId);
			
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				emp=new DeptEmp();
				
				emp.setEmpId(rset.getInt("EMPID"));
				emp.setEmpName(rset.getString("EMPNAME"));
				emp.setDeptId(rset.getString("DEPTID"));
				emp.setDeptName(rset.getString("DEPTNAME"));
				emp.setPositionId(rset.getString("POSITIONID"));
				emp.setPositionName(rset.getString("POSITIONNAME"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return emp;
	}

}
