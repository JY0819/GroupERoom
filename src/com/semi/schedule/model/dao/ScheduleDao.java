package com.semi.schedule.model.dao;

import static com.semi.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Properties;

import com.semi.admin.user.model.vo.Employee;
import com.semi.common.vo.DeptEmp;
import com.semi.schedule.model.vo.Schedule;

public class ScheduleDao {
	
	private Properties prop=new Properties();
	
	public ScheduleDao() {
		String fileName=ScheduleDao.class.getResource("/sql/schedule/schedule-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	//내 일정 select
	public ArrayList<HashMap<String, Object>> selectMySchedule(Connection con, int empId) {
		ArrayList<HashMap<String, Object>> list=null;
		HashMap<String, Object> hmap=null;
		PreparedStatement pstmt=null;
		ResultSet rset=null;

		String query=prop.getProperty("selectMySchedule");
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, empId);
			
			rset=pstmt.executeQuery();
			
			list=new ArrayList<HashMap<String, Object>>();
			System.out.println("개인 list 선언");
			
			while(rset.next()) {				
				hmap=new HashMap<String, Object>();

				System.out.println(rset.getString("CALENDARDATE").substring(0, 10).replaceAll("/",""));
				
				hmap.put("calendarId", rset.getString("CALENDARDATE").substring(0, 10).replaceAll("/",""));
				hmap.put("calendarNo", rset.getInt("CALENDARNO"));
				hmap.put("calendarClass", rset.getInt("CALENDARCLASS"));
				hmap.put("empName", rset.getString("EMPNAME"));
				hmap.put("calendarContents",rset.getString("CALENDARCONTENTS"));	
				hmap.put("calendarDate", rset.getString("CALENDARDATE"));
				System.out.println(rset.getString("CALENDARDATE").substring(11, 16));
				String time=rset.getString("CALENDARDATE").substring(11, 16);
				if(time.equals("00:00")) {
					time="";
				}
				hmap.put("calendarTime", time);
				list.add(hmap);
				System.out.println("리스트 +"+list.size());
				
			}

			System.out.println("list:"+list);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	//팀 일정 select
	public ArrayList<HashMap<String, Object>> selectTeamSchedule(Connection con, int empId) {
		ArrayList<HashMap<String, Object>> list=null;
		HashMap<String, Object> hmap=null;
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		
		String query=prop.getProperty("selectTeamSchedule");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, empId);
			
			rset=pstmt.executeQuery();
			
			list=new ArrayList<HashMap<String, Object>>();
			System.out.println("팀 list 선언");
			
			while(rset.next()) {
				hmap=new HashMap<String, Object>();

				System.out.println(rset.getString("CALENDARDATE").substring(0, 10).replaceAll("/",""));
				System.out.println(rset.getString("CALENDARDATE").substring(11, 16));

				hmap.put("calendarId", rset.getString("CALENDARDATE").substring(0, 10).replaceAll("/",""));
				hmap.put("calendarNo", rset.getInt("CALENDARNO"));
				hmap.put("calendarClass", rset.getInt("CALENDARCLASS"));
				hmap.put("deptName",rset.getString("DEPTNAME"));
				hmap.put("calendarContents", rset.getString("CALENDARCONTENTS"));
				hmap.put("calendarDate", rset.getString("CALENDARDATE").substring(0, 10).replaceAll("/",""));
				String time=rset.getString("CALENDARDATE").substring(11, 16);
				if(time.equals("00:00")) {
					time="";
				}
				hmap.put("calendarTime", time);
				
				list.add(hmap);
				System.out.println("리스트 +"+list.size());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//회사 일정 select
	public ArrayList<HashMap<String, Object>> selectCompanySchedule(Connection con, int empId) {
		ArrayList<HashMap<String, Object>> list=null;
		HashMap<String, Object> hmap=null;
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		
		String query=prop.getProperty("selectCompanySchedule");
		
		try {
			pstmt=con.prepareStatement(query);
			rset=pstmt.executeQuery();
			list=new ArrayList<HashMap<String,Object>>();
			System.out.println("팀 list 선언");
			
			while(rset.next()) {
				hmap=new HashMap<String, Object>();

				System.out.println(rset.getString("CALENDARDATE").substring(0, 10).replaceAll("/",""));
				System.out.println(rset.getString("CALENDARDATE").substring(11, 16));

				hmap.put("calendarId", rset.getString("CALENDARDATE").substring(0, 10).replaceAll("/",""));
				hmap.put("calendarNo", rset.getInt("CALENDARNO"));
				hmap.put("calendarClass", rset.getInt("CALENDARCLASS"));
				hmap.put("calendarContents", rset.getString("CALENDARCONTENTS"));
				hmap.put("calendarDate", rset.getString("CALENDARDATE").substring(0, 10).replaceAll("/",""));
				String time=rset.getString("CALENDARDATE").substring(11, 16);
				if(time.equals("00:00")) {
					time="";
				}
				hmap.put("calendarTime", time);
				
				list.add(hmap);
				System.out.println("리스트 +"+list.size());
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	//개인 일정
	public int insertMySchedule(Connection con, Schedule reqSche) {
		PreparedStatement pstmt=null;
		int result=0;
		
		String query=prop.getProperty("insertMySchedule");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, reqSche.getCalendarClass());
			pstmt.setString(2, reqSche.getCalendarContents());
			pstmt.setString(3, reqSche.getScheduleDate());
			pstmt.setInt(4, reqSche.getEmpId());
			
			result=pstmt.executeUpdate();
			
			if(result>0) {
				commit(con);
			}else {
				rollback(con);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	//팀 일정
	public int insertTeamSchedule(Connection con, Schedule reqSche) {
		PreparedStatement pstmt=null;
		int result=0;
		
		String query=prop.getProperty("insertTeamSchedule");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, reqSche.getCalendarClass());
			pstmt.setString(2, reqSche.getCalendarContents());
			pstmt.setString(3, reqSche.getScheduleDate());
			pstmt.setInt(4, reqSche.getEmpId());
			pstmt.setInt(5, reqSche.getEmpId());
			
			
			result=pstmt.executeUpdate();
			
			if(result>0) {
				commit(con);
			}else {
				rollback(con);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	//회사 일정
	public int insertCompanySchedule(Connection con, Schedule reqSche) {
		PreparedStatement pstmt=null;
		int result=0;
		
		String query=prop.getProperty("insertCompanySchedule");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, reqSche.getCalendarClass());
			pstmt.setString(2, reqSche.getCalendarContents());
			pstmt.setString(3, reqSche.getScheduleDate());
			pstmt.setInt(4, reqSche.getEmpId());
			
			result=pstmt.executeUpdate();
			
			if(result>0) {
				commit(con);
			}else {
				rollback(con);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	//일정 상세보기
	public Schedule selectDaySchedule(Connection con, int calendarNo) {
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		Schedule sche=null;
		String query=prop.getProperty("selectDaySchedule");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, calendarNo);
			
			rset=pstmt.executeQuery();
			
			
			while(rset.next()) {
				sche=new Schedule();
				
				sche.setCalendarNo(rset.getInt("CALENDARNO"));
				sche.setCalendarClass(rset.getInt("CALENDARCLASS"));
				sche.setCalendarContents(rset.getString("CALENDARCONTENTS"));
				sche.setScheduleDate(rset.getString("CALENDARDATE"));
				sche.setScheduleTime(rset.getString("CALENDARDATE").substring(9, 14));
				sche.setEmpId(rset.getInt("EMPID"));
				sche.setDeptId(rset.getString("DEPTID"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return sche;
	}

	//일정 수정하기
	public int updateMyDaySchedule(Connection con, Schedule reqSche, Employee loginUser) {
		PreparedStatement pstmt=null;
		int result=0;
		
		String query=prop.getProperty("updateMySchedule");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, reqSche.getCalendarClass());
			pstmt.setString(2, reqSche.getCalendarContents());
			pstmt.setString(3, reqSche.getScheduleDate());
			pstmt.setInt(4, loginUser.getEmpid());
			pstmt.setInt(5, reqSche.getCalendarNo());
			
			result=pstmt.executeUpdate();
			
			if(result>0) {
				commit(con);
				System.out.println("No."+reqSche.getCalendarNo()+" 스케줄 수정 완료");
			}else {
				rollback(con);
				System.out.println("수정 실패");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	//팀 일정 수정하기
	public int updatTeamDaySchedule(Connection con, Schedule reqSche, Employee loginUser) {
		PreparedStatement pstmt=null;
		int result=0;
		
		String query=prop.getProperty("updateTeamSchedule");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, reqSche.getCalendarClass());
			pstmt.setString(2, reqSche.getCalendarContents());
			pstmt.setString(3, reqSche.getScheduleDate());
			pstmt.setInt(4, loginUser.getEmpid());
			pstmt.setString(5, loginUser.getDeptId());
			pstmt.setInt(6, reqSche.getCalendarNo());
			
			result=pstmt.executeUpdate();
			
			if(result>0) {
				commit(con);
			}else {
				rollback(con);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	//회사일정 수정하기
	public int updateCompanyDaySchedule(Connection con, Schedule reqSche, Employee loginUser) {
		PreparedStatement pstmt=null;
		int result=0;
		
		String query=prop.getProperty("updateCompanySchedule");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, reqSche.getCalendarClass());
			pstmt.setString(2, reqSche.getCalendarContents());
			pstmt.setString(3, reqSche.getScheduleDate());
			pstmt.setInt(4, loginUser.getEmpid());
			pstmt.setInt(5, reqSche.getCalendarNo());
			
			result=pstmt.executeUpdate();
			
			if(result>0) {
				commit(con);
			}else {
				rollback(con);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteDaySchedule(Connection con, int calendarNo, int empId) {
		PreparedStatement pstmt=null;
		int result=0;
		
		String query=prop.getProperty("deleteDaySchedule");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, empId);
			pstmt.setInt(2, calendarNo);
			
			result=pstmt.executeUpdate();
			
			if(result>0) {
				commit(con);
				System.out.println("delete 완료");
			}else {
				rollback(con);
				System.out.println("delete 실패");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
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
	public Employee selectEmpList(Connection con, Integer empId) {
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		Employee emp=null;
		
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
				emp=new Employee();
				
				emp.setEmpid(rset.getInt("EMPID"));
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

	public Employee selectEmp(Connection con, Integer integer) {
		// TODO Auto-generated method stub
		return null;
	}

	public ArrayList<HashMap<String, Object>> selectVacList(Connection con, int empId) {
		ArrayList<HashMap<String, Object>> vacList=new ArrayList<HashMap<String, Object>>();
		HashMap<String, Object> vac=null;
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		
		String query=prop.getProperty("selectVac");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, empId);
			pstmt.setInt(2, empId);
			pstmt.setInt(3, empId);
			
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				vac=new HashMap<String, Object>();
				ArrayList<String> useDays=new ArrayList<String>();
				vac.put("empName", rset.getString("EMPNAME"));
				vac.put("useStart", rset.getString("USESTART"));				
				vac.put("useEnd", rset.getString("USEEND"));
				vac.put("useDay", rset.getInt("CNT"));
				vac.put("tDay", rset.getInt("TDAY"));
				SimpleDateFormat vacDate=new SimpleDateFormat("yyyyMMdd");
			
				if(rset.getString("USEEND")!=null) {
					try {
						Date startDate = vacDate.parse(rset.getString("USESTART"));
						String useStart="";
						Calendar cal=Calendar.getInstance();
						cal.setTime(startDate);
						
						for(int i=0;i<rset.getInt("TDAY");i++) {
							useStart = vacDate.format(cal.getTime());
							useDays.add(useStart);
							cal.add(Calendar.DATE, +1);
						}
						vac.put("useDays", useDays);
						System.out.println(empId+":"+vacList);
					} catch (ParseException e) {
						e.printStackTrace();
					}
					vacList.add(vac);
				}				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return vacList;
	}


}
