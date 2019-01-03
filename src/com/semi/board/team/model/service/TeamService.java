package com.semi.board.team.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.semi.board.Free.model.dao.FreeDao;
import com.semi.board.Free.model.vo.Free;
import com.semi.board.notice.model.dao.NoticeDao;
import com.semi.board.notice.model.vo.Notice;
import com.semi.board.team.model.dao.TeamDao;
import com.semi.board.team.model.vo.Team;
import static com.semi.common.JDBCTemplate.*;

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
	
}