package com.semi.approval.model.service.updateMyDocService;

import java.sql.Connection;

import com.semi.approval.approve.model.vo.DetailDoc;
import com.semi.approval.model.dao.updateMyDocDao.UpdateMyDocDao;
import static com.semi.common.JDBCTemplate.*;
public class UpdateMyDocService {

	public int updateMyDoc(DetailDoc detaildoc) {
		Connection con = getConnection();
		int result = new UpdateMyDocDao().updateMyDoc(con,detaildoc);
		if(result>0) commit(con);
		else rollback(con);
		return result;
	}

}
