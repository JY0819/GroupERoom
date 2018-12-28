package com.semi.approval.model.service.apprLineService;

import java.sql.Connection;
import java.util.ArrayList;

import com.semi.approval.approve.model.vo.ApprLine;
import com.semi.approval.model.dao.apprLineDao.ApprLineDao;
import static com.semi.common.JDBCTemplate.*;

public class ApprLineService {

	public ArrayList<ApprLine> selectList() {
		Connection con = getConnection();
		ArrayList<ApprLine> line = new ApprLineDao().selectList(con);
		close(con);
		
		return line;
	}

}
