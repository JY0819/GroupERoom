package com.semi.approval.model.service.trashService;

import java.sql.Connection;
import java.util.ArrayList;

import com.semi.approval.model.vo.Approval;
import static com.semi.common.JDBCTemplate.*;
public class trashService {

	public ArrayList<Approval> selectList() {
		
		Connection con = getConnection();
		ArrayList<Approval> list = new Approval().selectList(con);
		close(con);
		
		
		return list;
	}

}
