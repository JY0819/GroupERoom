package com.semi.approval.model.service.trashService;

import static com.semi.common.JDBCTemplate.*;
import static com.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.semi.approval.approve.model.vo.ApprLine;
import com.semi.approval.approve.model.vo.Approval;
import com.semi.approval.approve.model.vo.TrashTable;
import com.semi.approval.model.dao.apprLineDao.ApprLineDao;
import com.semi.approval.model.dao.trashDao.TrashDao;
public class TrashService {
	
	//휴지통 조회
	public ArrayList<TrashTable> selectList() {
		System.out.println("서비스");	
		Connection con = getConnection();
		ArrayList<TrashTable> list = new TrashDao().selectList(con);
		close(con);
		
		
		return list;
	}
	
	//보류 메소드(현재사용안함)
	/*public ArrayList<ApprLine> selectLineList() {
		Connection con = getConnection();
		ArrayList<ApprLine> line = new TrashDao().selectLineList(con);
		close(con);
		
		return line;
	}*/
	
	//휴지통 삭제
	public int deleteTrash(int[] apprno) {
		
		Connection con = getConnection();
		int result = new TrashDao().deleteTrash(con,apprno);
		if(result>0) commit(con);
		else rollback(con);
		close(con);
		return result;
	}
	
	//휴지통페이징처리카운트
	public int getListCount() {
		Connection con = getConnection();
		int listCount = new TrashDao().getListCount(con);
		close(con);
		return listCount;
	}

	public ArrayList<TrashTable> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<TrashTable> list = new TrashDao().selectList(con,currentPage,limit);
		close(con);
		return list;
	}

	public int moveTrash(int[] apprno) {
		Connection con = getConnection();
		int result = new TrashDao().moveTrash(con,apprno);
		if(result>0) commit(con);
		else rollback(con);
		close(con);
		return result;
	}

}
