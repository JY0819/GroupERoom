package com.semi.common.service;

import static com.semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.semi.admin.user.model.vo.Employee;
import com.semi.common.dao.AddressDao;
import com.semi.common.vo.DeptEmp;
import com.semi.schedule.model.dao.ScheduleDao;

public class AddressService {
	
	public HashMap<String, ArrayList<DeptEmp>> selectDeptEmp() {
		Connection con=getConnection();
		HashMap<String, ArrayList<DeptEmp>> hmap=new HashMap<String, ArrayList<DeptEmp>>();
		//부서ID를 키로 그 부서에 해당하는 직원들 모두 저장
		
		ArrayList<DeptEmp> empList=null; //사원정보 저장
		
		ArrayList<Integer> empIdList=new AddressDao().selectEmpIdList(con); //모든 사원번호 선택 
		
		ArrayList<String> deptIdList=new AddressDao().selectDeptIdList(con); //모든 부서 Id 저장 
		
		if(empIdList != null) {			
			for(int i=0;i<deptIdList.size();i++) {
				empList=new ArrayList<DeptEmp>();
				for(int j=0;j<empIdList.size();j++) {
					DeptEmp emp=new AddressDao().selectEmpList(con, empIdList.get(j));
					if(deptIdList.get(i).equals(emp.getDeptId())) {
						empList.add(emp);		
						//System.out.println(empList.size());
					}
				}
				hmap.put(deptIdList.get(i), empList);
				
			}
			System.out.println("사원수:"+empIdList.size()+"/ 사원객체 수:"+empList.size()+
					"/부서 수 :"+deptIdList.size()+"/hmap 크기 : "+hmap.size());
		}
		for(int i=0;i<hmap.size();i++) {
			for(int j=0;j<hmap.get(deptIdList.get(i)).size();j++) {
				
				System.out.println(deptIdList.get(i)+" : "+hmap.get(deptIdList.get(i)).get(j).getEmpId());
			}
		}
		System.out.println(hmap);
		close(con);
		return hmap;
	}
	public ArrayList<String> selectDeptIdList(){
		Connection con=getConnection();
		ArrayList<String> deptIdList=new AddressDao().selectDeptIdList(con);
		
		close(con);
		return deptIdList;
	}
}
