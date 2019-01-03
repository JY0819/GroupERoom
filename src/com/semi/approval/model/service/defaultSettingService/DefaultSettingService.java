package com.semi.approval.model.service.defaultSettingService;

import java.sql.Connection;

import com.semi.approval.model.dao.defaultSettingDao.DefaultSettingDao;

import static com.semi.common.JDBCTemplate.*;
public class DefaultSettingService {

	public int loginCheck(String nowpwd, String userId) {
		Connection con = getConnection();
		int result = new DefaultSettingDao().loginCheck(con,nowpwd,userId);
		close(con);
		return result;
	}

	public int updatePwd(String userId , String newpwd2) {
		Connection con = getConnection();
		int result = new DefaultSettingDao().updatePwd(con,userId,newpwd2);
		if(result>0)commit(con);
		else rollback(con);
		close(con);
		return result;
	}

}
