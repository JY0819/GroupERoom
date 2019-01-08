package com.semi.common.service;

import static com.semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.semi.admin.user.model.vo.Employee;
import com.semi.board.notice.model.vo.Notice;
import com.semi.common.dao.MainDao;
import com.semi.schedule.model.vo.Schedule;

public class MainService {

	public HashMap<String, Object> selectMainList(Employee loginUser) {
		Connection con=getConnection();
		HashMap<String, Object> hmap=new HashMap<String, Object>();
		ArrayList<Schedule> scheduleList=new ArrayList<Schedule>();
		ArrayList<Notice> noticeList=null;
		
		noticeList=new MainDao().selectNotice(con);
		
		hmap.put("notice", noticeList);
		
		ArrayList<Schedule> scheduleList1=new MainDao().selectMySchedule(con, loginUser.getEmpid());
		ArrayList<Schedule> scheduleList2=new MainDao().selectTeamSchedule(con, loginUser.getEmpid());
		ArrayList<Schedule> scheduleList3=new MainDao().selectCompanySchedule(con);
		if(scheduleList1!=null) {
			System.out.println(scheduleList1.size()+"/"+scheduleList2.size()+"/"+scheduleList3.size());
			for(int i=0;i<scheduleList1.size();i++) {
				scheduleList.add(scheduleList1.get(i));
			}
		}
		if(scheduleList1!=null) {
			for(int i=0;i<scheduleList2.size();i++) {
				scheduleList.add(scheduleList2.get(i));
			}
		}
		if(scheduleList1!=null) {
			for(int i=0;i<scheduleList3.size();i++) {
				scheduleList.add(scheduleList3.get(i));
			}
		}
		
		hmap.put("schedule", scheduleList);
		
		close(con);
		return hmap;
	}

}
