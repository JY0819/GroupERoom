package com.semi.schedule.model.service;

import static com.semi.common.JDBCTemplate.close;
import static com.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.semi.admin.user.model.vo.Employee;
import com.semi.schedule.model.dao.ScheduleDao;
import com.semi.schedule.model.vo.Schedule;

public class ScheduleService {

	//전체 캘린더에 일정 가져오는 메소드
	public ArrayList<HashMap<String, Object>> selectAllSchedule(int empId) {
		Connection con=getConnection();
		ArrayList<HashMap<String, Object>> list=null;
		ArrayList<HashMap<String, Object>> list1=new ScheduleDao().selectMySchedule(con, empId);
		list=new ArrayList<HashMap<String, Object>>();
		if(list1!=null) {
			for(int i=0;i<list1.size();i++) {
				list.add(list1.get(i));
			}
			System.out.println("list1 : "+list1);
		}
		ArrayList<HashMap<String, Object>> list2=new ScheduleDao().selectTeamSchedule(con, empId);
		if(list2!=null) {
			for(int i=0;i<list2.size();i++) {
				list.add(list2.get(i));
			}
			System.out.println("list2 : "+list2.size());
		}
		ArrayList<HashMap<String, Object>> list3=new ScheduleDao().selectCompanySchedule(con, empId);
		if(list3!=null) {
			for(int i=0;i<list3.size();i++) {
				list.add(list3.get(i));
			}
			System.out.println("list3 : "+list3.size());
		}
		
		//ArrayList<HashMap<String, Object>> list4=new ScheduleDao().selectUseVac(con, empId);
		
		//System.out.println("list1/list2/list3 : "+list1.size()+'/'+list2.size()+'/'+list3.size());
		System.out.println("서비스 list : "+list);
		
		close(con);
		return list;
	}

	//내 일정 insert
	public int insertMySchedule(Schedule reqSche) {
		Connection con=getConnection();
		int result=new ScheduleDao().insertMySchedule(con, reqSche);
		
		close(con);
		return result;
	}

	//팀 일정 insert
	public int insertTeamSchedule(Schedule reqSche) {
		Connection con=getConnection();
		int result=new ScheduleDao().insertTeamSchedule(con, reqSche);		
		
		close(con);
		return result;
	}

	//회사 일정 insert
	public int insertCompanySchedule(Schedule reqSche) {
		Connection con=getConnection();
		int result=new ScheduleDao().insertCompanySchedule(con, reqSche);		
		
		close(con);
		return result;
	}

	//daySchedule 라벨 표시
	public Schedule selectDaySchedule(int calendarNo) {
		Connection con=getConnection();
		
		Schedule sche=new ScheduleDao().selectDaySchedule(con, calendarNo);
		close(con);
		return sche;
	}


	public int updateMyDaySchedule(Schedule reqSche, Employee loginUser) {
		Connection con=getConnection();
		int result=new ScheduleDao().updateMyDaySchedule(con, reqSche, loginUser);
		
		close(con);
		return result;
	}

	public int updatTeamDaySchedule(Schedule reqSche, Employee loginUser) {
		Connection con=getConnection();
		int result=new ScheduleDao().updatTeamDaySchedule(con, reqSche, loginUser);
		
		close(con);
		return result;
	}
	

	public int updateCompanyDaySchedule(Schedule reqSche, Employee loginUser) {
		Connection con=getConnection();
		int result=new ScheduleDao().updateCompanyDaySchedule(con, reqSche, loginUser);
		
		close(con);
		return result;
	}

	public int deleteDaySchedule(int calendarNo, int empId) {
		Connection con=getConnection();
		int result=new ScheduleDao().deleteDaySchedule(con, calendarNo, empId);
		
		close(con);
		return result;
	}

	public HashMap<String, ArrayList<Employee>> selectDeptEmp() {
		Connection con=getConnection();
		HashMap<String, ArrayList<Employee>> hmap=new HashMap<String, ArrayList<Employee>>();
		//부서ID를 키로 그 부서에 해당하는 직원들 모두 저장
		ArrayList<Employee> empList=null;
		//사원정보 저장

		//ArrayList<HashMap<Integer, ArrayList<DeptEmp>>> listhmap=new ArrayList<HashMap<Integer, ArrayList<DeptEmp>>>();
		
		ArrayList<Integer> empIdList=new ScheduleDao().selectEmpIdList(con);
		//모든 사원번호 선택 
		
		ArrayList<String> deptIdList=new ScheduleDao().selectDeptIdList(con);
		//모든 부서 Id 저장 
		
		if(empIdList != null) {			
			for(int i=0;i<deptIdList.size();i++) {
				empList=new ArrayList<Employee>();
				for(int j=0;j<empIdList.size();j++) {
					Employee emp=new ScheduleDao().selectEmp(con, empIdList.get(j));
					if(deptIdList.get(i).equals(emp.getDeptId())) {
						empList.add(emp);		
						System.out.println(empList.size());
					}
				}
				hmap.put(deptIdList.get(i), empList);
				
			}
			System.out.println("사원수:"+empIdList.size()+"/ 사원객체 수:"+empList.size()+
					"/부서 수 :"+deptIdList.size()+"/hmap 크기 : "+hmap.size());
		}
		for(int i=0;i<hmap.size();i++) {
			for(int j=0;j<hmap.get(deptIdList.get(i)).size();j++) {
				
				System.out.println(deptIdList.get(i)+" : "+hmap.get(deptIdList.get(i)).get(j).getEmpid());
			}
		}
		
		close(con);
		return hmap;
	}

}
