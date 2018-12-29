package com.semi.board.Free.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.semi.board.Free.model.dao.FreeDao;
import com.semi.board.Free.model.vo.Free;
import static com.semi.common.JDBCTemplate.*;

public class FreeService {
	//글 목록 조회
	/*public ArrayList<Free> selectList() {
		Connection con = getConnection();
		System.out.println("dd");
		ArrayList<Free> list = new FreeDao().selectList(con);
		System.out.println("freeService list: "+list);
		close(con);
		
		return list;
	}*/
	
	//글작성
		public int insertFree(Free f) {
			Connection con = getConnection();

			int result = new FreeDao().insertFree(con, f);

			if(result > 0) {
				commit(con);
			}else {
				rollback(con);
			}

			return result;
		}
		//글 상세보기
		public Free selectOne(int num) {
			Connection con = getConnection();
			Free f = null;

			
			int result = new FreeDao().updateCount(con, num);

			if(result > 0) {
				commit(con);
				f = new FreeDao().selectOne(con, num);
			}else {
				rollback(con);
			}
			close(con);

			return f;
		}
		
		//페이징 처리 후 글목록 조회
		public ArrayList<Free> selectList(int currentPage, int limit) {
			Connection con = getConnection();
			ArrayList<Free> list = new FreeDao().selectList(con, currentPage, limit);
			
			System.out.println("service: "+list.size());
			close(con);
			
			return list;
		}
		
		public int getListCount() {
			Connection con = getConnection();
			
			int listCount = new FreeDao().getlistCount(con);
			
			close(con);
			
			return listCount;
			
		}
		//글 수정하기
		public int updateFree(Free f) {
			Connection con = getConnection();
			
			int result = new FreeDao().updateFree(con, f);
			
			if(result>0) {
				commit(con);
			}else {
				rollback(con);
			}
			
			
			return result;
		}
		//글 삭제
		public int deleteFree(int bno) {
			Connection con = getConnection();
			
			int result = new FreeDao().deleteFree(con, bno);
			
			System.out.println("service bno: "+bno);
			if(result>0) {
				commit(con);
			}else {
				rollback(con);
			}
			
			return result;
		}
		//글 수정
		public Free selectOne(String num) {
			Connection con = getConnection();
			
			Free f = new FreeDao().selectOne(con, num);
			
			int result = 0;
			
			if(f != null) {
				result = new FreeDao().updateCount(con, f.getBno());
				if(result > 0) commit(con);
				else rollback(con);	
				
			}
			
			close(con);
			
			return f;
		}
		//댓글작성
		public ArrayList<Free> insertReply(Free f) {
			Connection con = getConnection();
			ArrayList<Free> replyList = null;
			
			int result= new FreeDao().insertReply(con, f);
			
			System.out.println("service: "+replyList);
			
			if(result > 0) {
				
				commit(con);
				replyList = new FreeDao().selectReplyList(con, f.getBno());
				//=>20번글을 보고 있으면 20번글에 대한 댓글만 조회할 수 있도록
			}else {
				rollback(con);
			}
			
			close(con);
			
			return replyList;
		}
	
	

}
