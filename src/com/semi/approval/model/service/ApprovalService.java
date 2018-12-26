package com.semi.approval.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.semi.approval.model.dao.ApprovalDao;
import com.semi.approval.model.vo.Approval;
import static com.semi.common.JDBCTemplate.*;


public class ApprovalService {

	public ArrayList<Approval> selectList() {
		Connection con = getConnection();
		ArrayList<Approval> list = new ApprovalDao().selectList(con);
		close(con);
		return list;
	}

}
