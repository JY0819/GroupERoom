package com.semi.approval.document.dao;

import static com.semi.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.semi.admin.user.model.vo.Employee;
import com.semi.approval.document.vo.Document;
import com.semi.approval.document.vo.SumEmpInfo;
public class DocumentDao {
	private Properties prop = new Properties();

	public DocumentDao() {
		String fileName = DocumentDao.class.getResource("/sql/approval/approval-query.properties").getPath();
		try {
		
			prop.load(new FileReader(fileName));
		
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//사원번호, 문서번호, 번호 불러오기
	public Document selectForm(Connection con, int id) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Document document = null;
		String query = prop.getProperty("selectForm");
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, id);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				document = new Document();
				document.setManageEmpId(rset.getInt("MANAGEEMPID"));
				document.setManageDocNo(rset.getInt("MANAGEDOCNO"));
				document.setManageNo(rset.getInt("MANAGENO"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return document;
	}

	public HashMap<Integer, ArrayList<SumEmpInfo>> selectDept(Connection con) {
		//기본은 부서가져오고 2가 붙은건 사원이름 가져옴
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rset = null;
		ResultSet rset2 = null;
		SumEmpInfo emp = null;
		ArrayList<SumEmpInfo> empList = null;
		HashMap<Integer, ArrayList<SumEmpInfo>> hmap = null;
		int key = 0;
		int num = 1;
		
		String query = prop.getProperty("selectDept");
		String query2 = prop.getProperty("selectEmp");
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt2 = con.prepareStatement(query2);
		
			rset = pstmt.executeQuery();
			rset2 = pstmt2.executeQuery();
			
			
			hmap = new HashMap<Integer, ArrayList<SumEmpInfo>>();

			while(rset.next()) {
				emp = new SumEmpInfo();
				emp.setDeptName(rset.getString("DEPTNAME"));
				int count = rset.getInt(2);
				System.out.println("부서행갯수: " + count);
				System.out.println("부서이름: " + emp.getDeptName());
				
					while(rset2.next()) {
				
							emp.setEmpNo(rset2.getInt("EMPID"));
							System.out.println("직원번호: " + emp.getEmpNo());
							emp.setEmpName(rset2.getString("EMPNAME"));
							System.out.println("직원이름: " + emp.getEmpName());
							empList = new ArrayList<SumEmpInfo>();
							empList.add(emp);
							if(num == count) {
								break;
							}
							num++;
				}
				hmap.put(key, empList);
				key++;
				num = 1;
			}
			System.out.println("어레이길이: " + hmap.get(0).size());
			for(int i=0; i<hmap.size(); i++) {
				System.out.println(hmap.get(i).get(i).getDeptName());
				
				/*for(int j=0; j<hmap.size(); j++) {
					System.out.println(hmap.get(i).get(j).getEmpNo() + "\t" + hmap.get(i).get(j).getEmpName());
				}*/
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return hmap;
	}
}