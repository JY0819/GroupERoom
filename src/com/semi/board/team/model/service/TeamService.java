package com.semi.board.team.model.service;

import static com.semi.common.JDBCTemplate.close;
import static com.semi.common.JDBCTemplate.commit;
import static com.semi.common.JDBCTemplate.getConnection;
import static com.semi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.semi.board.team.model.dao.TeamDao;
import com.semi.board.team.model.vo.Team;

public class TeamService {
	//글목록 조회
	public ArrayList<Team> selectList() {
		Connection con = getConnection();
		
		ArrayList<Team> list = new TeamDao().selectList(con);
		System.out.println("TeamService list: "+list);
		close(con);
		
		return list;
	}
	//글 작성
	public int insertTeam(Team t) {
		Connection con = getConnection();

		int result = new TeamDao().insertTeam(con, t);

		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}

		return result;
	}
	//글 상세보기
	public Team selectOne(int num) {
		Connection con = getConnection();
		Team t = null;

		System.out.println("service num: "+num);
		int result = new TeamDao().updateCount(con, num);

		if(result > 0) {
			commit(con);
			t = new TeamDao().selectOne(con, num);
		}else {
			rollback(con);
		}
		close(con);

		return t;
	}
	//글삭제
	public int deleteteam(int bno) {
		Connection con = getConnection();
		
		int result = new TeamDao().deleteTeam(con, bno);
		
		System.out.println("service bno: "+bno);
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		return result;
	}
	//글 수정
	public Team selectOne(String num) {
		Connection con = getConnection();
		
		Team t = new TeamDao().selectOne(con, num);
		
		int result = 0;
		
		if(t != null) {
			result = new TeamDao().updateCount(con, t.getBno());
			if(result > 0) commit(con);
			else rollback(con);	
			
		}
		
		close(con);
		
		return t;
	}
	//수정용
	public int updateTeam(Team t) {
		Connection con = getConnection();
		
		int result = new TeamDao().updateTeam(con, t);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		
		return result;
	}
	//댓글 작성
	public ArrayList<Team> insertReply(Team t) {
		Connection con = getConnection();
		ArrayList<Team> replyList = null;
		
		int result= new TeamDao().insertReply(con, t);
		
		System.out.println("service: "+replyList);
		
		if(result > 0) {
			
			commit(con);
			replyList = new TeamDao().selectReplyList(con, t.getBno());
			//=>20번글을 보고 있으면 20번글에 대한 댓글만 조회할 수 있도록
		}else {
			rollback(con);
		}
		
		close(con);
		
		return replyList;
	}
	//전체 게시글 수 조회
	public int getListCount(String deptId) {
		Connection con = getConnection();
		
		int listCount = new TeamDao().getlistCount(con, deptId);
		
		close(con);
		
		return listCount;
	}
	//페이징 처리 후 글 목록 조회
	public ArrayList<Team> selectList(int currentPage, int maxPage, int limit, String deptId) {
		Connection con = getConnection();
		ArrayList<Team> list = new TeamDao().selectList(con, currentPage, maxPage, limit, deptId);
		
		System.out.println("service: "+list.size());
		close(con);
		
		return list;
	}
	//글 클릭하면 댓글 보이기
	public ArrayList<Team> selectReply(int num) {
		Connection con = getConnection();
		
		ArrayList<Team> reply = new TeamDao().selectReply(con, num);
		
		System.out.println("service 댓글: "+reply.size());
		close(con);
		
		return reply;
	}
	//부서코드 검색
	public ArrayList<Team> searchValue(String searchValue) {
		Connection con = getConnection();
		ArrayList<Team> list = new TeamDao().searchValue(con, searchValue);
		System.out.println("service listsize:"+list.size());
		close(con);
		
		return list;
	}
	//이름으로 검색 게시글 수 
	public int getSearchNameListCount(String userName, String deptId) {
		Connection con = getConnection();
		
		int listCount = new TeamDao().getSearchNameListCount(con, userName, deptId);
		
		System.out.println("service listCount:"+listCount);
		close(con);
		
		return listCount;
	}
	//제목으로 검색 게시글 수
	public int getSearchTitleListCount(String title, String deptId) {
		Connection con = getConnection();
		
		int listCount = new TeamDao().getSearchTitleListCount(con, title, deptId);
		
		System.out.println("service 제목listCount:"+listCount);
		close(con);
		
		return listCount;
	}
	//글내용으로 검색 게시글 수
	public int getSearchContentListCount(String content, String deptId) {
		Connection con = getConnection();
		
		int listCount = new TeamDao().getSearchContentListCount(con, content, deptId);
		
		System.out.println("service 내용listCount:"+listCount);
		close(con);
		
		return listCount;
	}
	//이름으로 검색 후 결과 페이징
	public ArrayList<Team> searchName(String userName, int currentPage, int maxPage, int limit, String deptId) {
		Connection con = getConnection();
		
		ArrayList<Team> list = new TeamDao().searchName(userName, con, currentPage,maxPage, limit, deptId);
		System.out.println("servcie list: "+list.size());

		
		System.out.println("name으로 검색service: "+list.size());
		close(con);
		
		return list;
	}
	//제목으로 검색 결과 페이징
	public ArrayList<Team> searchTitle(String title, int currentPage, int maxPage, int limit, String deptId) {
		Connection con = getConnection();
		
		ArrayList<Team> list = new TeamDao().searchTitle(title, con, currentPage,maxPage, limit, deptId);
		System.out.println("servcie list: "+list.size());

		
		System.out.println("title으로 검색service: "+list.size());
		close(con);
		
		return list;
	}
	//내용으로 검색 결과 페이징
	public ArrayList<Team> searchContent(String content, int currentPage, int maxPage, int limit, String deptId) {
		Connection con = getConnection();
		
		ArrayList<Team> list = new TeamDao().searchContent(content, con, currentPage,maxPage, limit, deptId);
		System.out.println("servcie list: "+list.size());

		
		System.out.println("content으로 검색service: "+list.size());
		close(con);
		
		return list;
	}
	
}
