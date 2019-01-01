package com.semi.approval.model.service.finishApprovalService;

import static com.semi.common.JDBCTemplate.*;
import static com.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.semi.approval.approve.model.vo.FinishApproval;
import com.semi.approval.model.dao.finishApprovalDao.FinishApprovalDao;


public class FinishApprovalService {

	public ArrayList<FinishApproval> selectList() {
		System.out.println("서비스");	
		Connection con = getConnection();
		ArrayList<FinishApproval> list = new FinishApprovalDao().selectList(con);
		close(con);
		
		
		return list;
	}

	public int deleteFinish(int[] apprno) {
		
		Connection con = getConnection();
		int result = new FinishApprovalDao().deleteFinish(con,apprno);
		if(result>0) commit(con);
		else rollback(con);
		close(con);
		
		return result;
	}

	public ArrayList<FinishApproval> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<FinishApproval> list = new FinishApprovalDao().selectList(con,currentPage,limit);
		close(con);
		return list;
	}

	public int getListCount() {
		Connection con = getConnection();
		int listCount = new FinishApprovalDao().getListCount(con);
		close(con);
		return listCount;
	}
	
}
