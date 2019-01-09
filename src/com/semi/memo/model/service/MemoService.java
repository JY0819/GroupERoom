package com.semi.memo.model.service;

import static com.semi.common.JDBCTemplate.*;

import java.sql.Connection;

import com.semi.memo.model.dao.MemoDao;
import com.semi.memo.model.vo.Memo;

public class MemoService {

	public Memo selectMemo(int empId) {
		Connection con=getConnection();
		Memo memo=new MemoDao().selectMemo(con, empId);
		
		System.out.println("service"+memo);
		close(con);
		return memo;
	}

	public int insertMemo(Memo reqMemo) {
		Connection con=getConnection();
		int result= new MemoDao().insertMemo(con, reqMemo);
		
		close(con);
		return result;
	}

	public String selectEmpImg(int photoId) {
		Connection con=getConnection();
		String imgPath=new MemoDao().selectEmpPhoto(con, photoId);
		System.out.println("서비스 :"+imgPath);
		close(con);
		return imgPath;
	}

}
