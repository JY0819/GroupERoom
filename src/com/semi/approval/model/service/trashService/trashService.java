package com.semi.approval.model.service.trashService;

import java.sql.Connection;
import java.util.ArrayList;

import com.semi.approval.approve.model.vo.Approval;
import com.semi.approval.model.dao.trashDao.trashDao;
import static com.semi.common.JDBCTemplate.*;
public class trashService {
	
	public ArrayList<Approval> selectList() {
		System.out.println("서비스");	
		Connection con = getConnection();
		ArrayList<Approval> list = new trashDao().selectList(con);
		close(con);
		
		
		return list;
	}

}
