package com.semi.approval.model.service.trashService;

import static com.semi.common.JDBCTemplate.close;
import static com.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.semi.approval.approve.model.vo.ApprLine;
import com.semi.approval.approve.model.vo.Approval;
import com.semi.approval.model.dao.apprLineDao.ApprLineDao;
import com.semi.approval.model.dao.trashDao.TrashDao;
public class TrashService {
	
	public ArrayList<Approval> selectList() {
		System.out.println("서비스");	
		Connection con = getConnection();
		ArrayList<Approval> list = new TrashDao().selectList(con);
		close(con);
		
		
		return list;
	}

	public ArrayList<ApprLine> selectLineList() {
		Connection con = getConnection();
		ArrayList<ApprLine> line = new TrashDao().selectLineList(con);
		close(con);
		
		return line;
	}

}
