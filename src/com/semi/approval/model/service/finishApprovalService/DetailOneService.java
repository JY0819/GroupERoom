package com.semi.approval.model.service.finishApprovalService;

import java.sql.Connection;
import java.util.HashMap;

import com.semi.approval.model.dao.finishApprovalDao.DetailOneDao;
import static com.semi.common.JDBCTemplate.*;

public class DetailOneService {

	public HashMap<String, Object> selectDetailMap(int docno) {
		Connection con = getConnection();
		HashMap<String, Object> hmap = null;
		
			
			hmap = new DetailOneDao().selectDetailMap(con,docno);
			commit(con);
			close(con);
			
		return hmap;
		
	}

}
