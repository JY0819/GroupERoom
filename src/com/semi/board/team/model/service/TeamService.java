package com.semi.board.team.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.semi.board.Free.model.dao.FreeDao;
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

}
