package com.semi.memo.model.service;

import static com.semi.common.JDBCTemplate.*;

import java.sql.Connection;

import com.semi.memo.model.dao.MemoDao;
import com.semi.memo.model.vo.Memo;

public class MemoService {

	public Memo selectMemo(int empId) {
		Connection con=getConnection();
		Memo memo=new MemoDao().selectMemo(con, empId);
		
		close(con);
		return memo;
	}

	public int insertMemo(Memo reqMemo) {
		Connection con=getConnection();
		int result= new MemoDao().insertMemo(con, reqMemo);
		
		close(con);
		return result;
	}

}
