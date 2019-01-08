package com.semi.board.team.model.dao;

import static com.semi.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.semi.board.team.model.vo.Attachment;
import com.semi.board.team.model.vo.Team;

public class TeamDao {
	
	private Properties prop = new Properties();
	
	public TeamDao() {
		String fileName = TeamDao.class.getResource("/sql/board/team/team-query.properties").getPath();
	
		try {
			prop.load(new FileReader(fileName));
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	
	
	}
	//글목록 조회
	public ArrayList<Team> selectList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Team> list =  null;
		
		String query = prop.getProperty("selectList");
		
		System.out.println(query);
		
		try {
			stmt=con.createStatement();
			rset=stmt.executeQuery(query);

			list=new ArrayList<Team>();
			
			while(rset.next()) {
				Team t = new Team();
				
				t.setBno(rset.getInt("BOARDNO"));
				t.setbClass(rset.getString("BOARDCLASS"));
				t.setbTitle(rset.getString("BOARDTITLE"));
				t.setbContent(rset.getString("BOARDCONTENTS"));

				t.setbDate(rset.getDate("BOARDDATE"));
				t.setbClicks(rset.getInt("BOARDCLICKS"));
				t.setbAttach(rset.getString("BOARDATTACH"));
				t.setComNo(rset.getInt("COMMENTNO"));
				t.setComLevel(rset.getInt("COMMENTLEVEL"));
				t.setRecomId(rset.getString("RECOMMENTID"));
				

				t.setDeptId(rset.getString("DEPTID"));
				t.setReplebno(rset.getInt("REPLEBOARDNO"));
				t.setWriterId(rset.getString("EMPNAME"));
				t.setStatus(rset.getString("WHETHEROFDELETE"));
				t.setFile01(rset.getInt("FILE01"));
				t.setFile02(rset.getInt("FILE02"));
				t.setFile03(rset.getInt("FILE03"));
				
				list.add(t);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}
	//글작성
	public int insertTeam(Connection con, Team t) {
		PreparedStatement pstmt = null;
		int result=0;
		String query = prop.getProperty("insertTeam");

		try {
			pstmt=con.prepareStatement(query);

			pstmt.setString(1, t.getbTitle());
			pstmt.setString(2, t.getbContent());
			pstmt.setString(3, t.getDeptId());

			pstmt.setString(4, t.getWriterId());

			System.out.println("글제목:"+t.getbTitle());
			System.out.println("글내용:"+t.getbContent());
			System.out.println("부서코드:"+t.getDeptId());
			System.out.println("작성자:"+t.getWriterId());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
	}
	//조회수 증가
	public int updateCount(Connection con, int num) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateCount");

		System.out.println("updateCount dao num: "+num);
		System.out.println("조회수 dao query : "+query);
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, num);
			pstmt.setInt(2, num);

			result = pstmt.executeUpdate();
			System.out.println("조회수 dao: "+result);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
	}
	//글 상세보기
	public HashMap<String, Object> selectOne(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Team t = null;
		HashMap<String, Object> hmap = null;
		Attachment at = null;
		
		
		
		String query = prop.getProperty("selectOne");
System.out.println("selectOne dao query: "+query);
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, num);

			rset=pstmt.executeQuery();
			System.out.println("dao rset: "+rset);
			if(rset.next()) {
				t = new Team();

				t.setBno(rset.getInt("BOARDNO"));
				t.setbClass(rset.getString("BOARDCLASS"));
				t.setbTitle(rset.getString("BOARDTITLE"));
				t.setbContent(rset.getString("BOARDCONTENTS"));
				t.setbDate(rset.getDate("BOARDDATE"));
				t.setbClicks(rset.getInt("BOARDCLICKS"));
				t.setbAttach(rset.getString("BOARDATTACH"));
				t.setComNo(rset.getInt("COMMENTNO"));
				t.setComLevel(rset.getInt("COMMENTLEVEL"));
				t.setRecomId(rset.getString("RECOMMENTID"));
				
				t.setDeptId(rset.getString("DEPTID"));
				t.setReplebno(rset.getInt("REPLEBOARDNO"));
				t.setWriterId(rset.getString("EMPNAME"));
				t.setStatus(rset.getString("WHETHEROFDELETE"));
				t.setFile01(rset.getInt("FILE01"));
				t.setFile02(rset.getInt("FILE02"));
				t.setFile03(rset.getInt("FILE03"));

				at = new Attachment();
				at.setAno(rset.getInt("ATTACHNO"));
				at.setOriginName(rset.getString("ATTACHPRENAME"));
				at.setChangeName(rset.getString("ATTACHNAME"));
				at.setFilePath(rset.getString("ATTACHPATH"));
				at.setUploadDate(rset.getDate("ATTACHDAY"));
				at.setWhetherofDelete(rset.getString("WHETHEROFDELETE"));
				


			}
			hmap = new HashMap<String, Object>();
			
			hmap.put("Team", t);
			hmap.put("attachment", at);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}


		return hmap;
	}
	//글삭제
	public int deleteTeam(Connection con, int bno) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("deleteTeam");
		
		System.out.println("dao query: "+query);
		System.out.println("dao bno:"+bno);
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, bno);
			
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
			
		return result;
	}
	//글 수정
	public Team selectOne(Connection con, String num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Team t = null;
		
		String query = prop.getProperty("selectOne");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(num));
			
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				t = new Team();

				t.setBno(rset.getInt("BOARDNO"));
				t.setbClass(rset.getString("BOARDCLASS"));
				t.setbTitle(rset.getString("BOARDTITLE"));
				t.setbContent(rset.getString("BOARDCONTENTS"));
				
				t.setbDate(rset.getDate("BOARDDATE"));
				t.setbClicks(rset.getInt("BOARDCLICKS"));
				t.setbAttach(rset.getString("BOARDATTACH"));
				t.setComNo(rset.getInt("COMMENTNO"));
				t.setComLevel(rset.getInt("COMMENTLEVEL"));
				t.setRecomId(rset.getString("RECOMMENTID"));
			

				t.setDeptId(rset.getString("DEPTID"));
				t.setReplebno(rset.getInt("REPLEBOARDNO"));
				t.setWriterId(rset.getString("EMPNAME"));
				t.setStatus(rset.getString("WHETHEROFDELETE"));
				t.setFile01(rset.getInt("FILE01"));
				t.setFile02(rset.getInt("FILE02"));
				t.setFile03(rset.getInt("FILE03"));
				
				
			}
			
			
		} catch (SQLException e) {				
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}

		return t;
	}
	//글 수정용
	public int updateTeam(Connection con, Team t) {
		PreparedStatement pstmt = null;
		int result=0;
		String query = prop.getProperty("updateTeam");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, t.getbTitle());
			pstmt.setString(2, t.getbContent());
			pstmt.setInt(3, t.getBno());
			
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
	}
	//댓글작성
	public int insertReply(Connection con, Team t) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		String query = prop.getProperty("insertReply");
		System.out.println("dao댓글작성: "+query);
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, t.getbContent());
			pstmt.setInt(2, t.getBno());
			pstmt.setString(3, t.getWriterId());
			
			result=pstmt.executeUpdate();
			
			System.out.println("dao 작성");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}
	//댓글 보이기
	public ArrayList<Team> selectReplyList(Connection con, int bno) {
		PreparedStatement pstmt= null;
		ResultSet rset = null;
		ArrayList<Team> list=null;
		
		String query = prop.getProperty("selectReplyList");
		System.out.println("dao 목록 쿼리 : "+query);
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, bno);
			
			rset=pstmt.executeQuery();
			
			list=new ArrayList<Team>();
			
			while(rset.next()) {
				Team t = new Team();
				
				t.setBno(rset.getInt("BOARDNO"));
				t.setbContent(rset.getString("BOARDCONTENTS"));
				t.setWriterId(rset.getString("EMPNAME"));
				t.setComNo(rset.getInt("COMMENTNO"));
				t.setComLevel(rset.getInt("COMMENTLEVEL"));
				t.setbDate(rset.getDate("BOARDDATE"));
				
				list.add(t);

			}
			System.out.println("dao 목록부르기: "+list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		 
		
		return list;
	}
	//전체 게시글 수 조회
	public int getlistCount(Connection con, String deptId) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("listCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, deptId);
			
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
			
		return listCount;
	}
	//페이징 처리 후 글목록 조회
	public ArrayList<Team> selectList(Connection con, int currentPage, int maxPage, int limit, String deptId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Team> list = null;
		
		
		System.out.println("dao deptId: "+deptId);
		System.out.println("dao currentPage: "+currentPage);
		
		
		
		String query = prop.getProperty("selectList");
		
		System.out.println("dao query: "+query);
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			System.out.println("dao startRow: "+startRow);
			System.out.println("dao endRow: "+endRow);
			
			
			pstmt.setInt(1, 1);
			pstmt.setInt(2, limit*maxPage);
			pstmt.setString(3, deptId);
			
			rset=pstmt.executeQuery();
			
			list= new ArrayList<Team>();
			
			while(rset.next()) {
				
			
			Team t = new Team();
			
			t.setBno(rset.getInt("BOARDNO"));
			t.setbClass(rset.getString("BOARDCLASS"));
			t.setbTitle(rset.getString("BOARDTITLE"));
			t.setbContent(rset.getString("BOARDCONTENTS"));

			t.setbDate(rset.getDate("BOARDDATE"));
			t.setbClicks(rset.getInt("BOARDCLICKS"));
			t.setbAttach(rset.getString("BOARDATTACH"));
			t.setComNo(rset.getInt("COMMENTNO"));
			t.setComLevel(rset.getInt("COMMENTLEVEL"));
			t.setRecomId(rset.getString("RECOMMENTID"));
			

			t.setDeptId(rset.getString("DEPTID"));
			t.setReplebno(rset.getInt("REPLEBOARDNO"));
			t.setWriterId(rset.getString("EMPNAME"));
			t.setStatus(rset.getString("WHETHEROFDELETE"));
			t.setFile01(rset.getInt("FILE01"));
			t.setFile02(rset.getInt("FILE02"));
			t.setFile03(rset.getInt("FILE03"));
			if(rset.getInt("ROWNUM") >=startRow && rset.getInt("ROWNUM") <=endRow) {
				list.add(t);
			}
			
			}
			System.out.println("dao list: "+list.size());
			

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}
	//글 클릭하면 댓글 바로 보이기
	public ArrayList<Team> selectReply(Connection con, int num) {
		PreparedStatement pstmt = null;
		ArrayList<Team> reply = null;
		ResultSet rset = null;
		Team t = null;

		String query = prop.getProperty("selectReply");
		System.out.println(num);
		System.out.println(query);
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset=pstmt.executeQuery();
			
		
				reply= new ArrayList<Team>();
				
				while(rset.next()) {
					t= new Team();
				
				
				t.setBno(rset.getInt("BOARDNO"));
				t.setbContent(rset.getString("BOARDCONTENTS"));
				t.setbDate(rset.getDate("BOARDDATE"));
				
				t.setReplebno(rset.getInt("REPLEBOARDNO"));
				t.setWriterId(rset.getString("EMPNAME"));
			
				reply.add(t);
				}
							
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return reply;
	}
	//부서코드 검색
	public ArrayList<Team> searchValue(Connection con, String searchValue) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Team> list = null;
		
		String query = prop.getProperty("searchValue");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, searchValue);
			
			rset=pstmt.executeQuery();
			
			list = new ArrayList<Team>();
			
			while(rset.next()) {
				Team t = new Team();
				
				t.setBno(rset.getInt("BOARDNO"));
				t.setbClass(rset.getString("BOARDCLASS"));
				t.setbTitle(rset.getString("BOARDTITLE"));
				t.setbContent(rset.getString("BOARDCONTENTS"));
				t.setbDate(rset.getDate("BOARDDATE"));
				t.setbClicks(rset.getInt("BOARDCLICKS"));
				t.setbAttach(rset.getString("BOARDATTACH"));
				t.setComNo(rset.getInt("COMMENTNO"));
				t.setComLevel(rset.getInt("COMMENTLEVEL"));
				t.setRecomId(rset.getString("RECOMMENTID"));
				
				t.setReplebno(rset.getInt("REPLEBOARDNO"));
				t.setWriterId(rset.getString("EMPNAME"));
				t.setStatus(rset.getString("WHETHEROFDELETE"));
				t.setFile01(rset.getInt("FILE01"));
				t.setFile02(rset.getInt("FILE02"));
				t.setFile03(rset.getInt("FILE03"));
		
				list.add(t);
				
			}
			System.out.println("dao listsize:"+list.size());

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}
	//이름으로 검색 게시글 수
	public int getSearchNameListCount(Connection con, String userName, String deptId) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("searchNameListCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userName);
			pstmt.setString(2, deptId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			System.out.println("dao 이름listCount: "+listCount);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
			
		return listCount;
	}
	//제목으로 검색 게시글 수
	public int getSearchTitleListCount(Connection con, String title, String deptId) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("searchTitleListCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, title);
			pstmt.setString(2, deptId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			System.out.println("dao 제목listCount: "+listCount);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
			
		return listCount;
	}
	//글 내용 검색 게시글 수
	public int getSearchContentListCount(Connection con, String content, String deptId) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("searchContentListCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, content);
			pstmt.setString(2, deptId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			System.out.println("dao ㄴㅐ용listCount: "+listCount);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
			
		return listCount;
	}
	//이름으로 검색 결과 페이징
	public ArrayList<Team> searchName(String userName, Connection con, int currentPage, int maxPage, int limit, String deptId) {
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		ArrayList<Team> list=null;
		System.out.println("dao userName: "+userName);
		System.out.println("dao currentPage: "+currentPage);
		String query=prop.getProperty("searchName");
		
		System.out.println("dao query: "+query);
		try {
			pstmt=con.prepareStatement(query);
		
			
			int startRow = (currentPage - 1) * limit + 1; // 조회할 때 시작할 행 번호
			int endRow = startRow + limit - 1;
			
			System.out.println("dao startRow: "+startRow);
			System.out.println("dao endRow: "+endRow);
			pstmt.setInt(1, 1);
			pstmt.setInt(2, limit*maxPage);
			pstmt.setString(3, userName);
			pstmt.setString(4, deptId);
			
			rset=pstmt.executeQuery();
			list=new ArrayList<Team>();
			
			while(rset.next()) {
				Team t=new Team();
				
				t.setBno(rset.getInt("BOARDNO"));
				t.setbClass(rset.getString("BOARDCLASS"));
				t.setbTitle(rset.getString("BOARDTITLE"));
				t.setbContent(rset.getString("BOARDCONTENTS"));
				t.setbDate(rset.getDate("BOARDDATE"));
				t.setbClicks(rset.getInt("BOARDCLICKS"));
				t.setbAttach(rset.getString("BOARDATTACH"));
				t.setComNo(rset.getInt("COMMENTNO"));
				t.setComLevel(rset.getInt("COMMENTLEVEL"));
				t.setRecomId(rset.getString("RECOMMENTID"));
				
				t.setReplebno(rset.getInt("REPLEBOARDNO"));
				t.setWriterId(rset.getString("EMPNAME"));
				t.setStatus(rset.getString("WHETHEROFDELETE"));
				t.setFile01(rset.getInt("FILE01"));
				t.setFile02(rset.getInt("FILE02"));
				t.setFile03(rset.getInt("FILE03"));
				if(rset.getInt("ROWNUM") >=startRow && rset.getInt("ROWNUM") <=endRow) {
					list.add(t);
				}
				
				
			}
			System.out.println("name검색dao list: "+list.size());

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	//제목으로 검색 결과 페이징
	public ArrayList<Team> searchTitle(String title, Connection con, int currentPage, int maxPage, int limit, String deptId) {
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		ArrayList<Team> list=null;
		System.out.println("dao title: "+title);
		System.out.println("dao currentPage: "+currentPage);
		String query=prop.getProperty("searchTitle");
		
		System.out.println("dao query: "+query);
		try {
			pstmt=con.prepareStatement(query);
		
			
			int startRow = (currentPage - 1) * limit + 1; // 조회할 때 시작할 행 번호
			int endRow = startRow + limit - 1;
			
			System.out.println("dao startRow: "+startRow);
			System.out.println("dao endRow: "+endRow);
			pstmt.setInt(1, 1);
			pstmt.setInt(2, limit*maxPage);
			pstmt.setString(3, title);
			pstmt.setString(4, deptId);
			
			rset=pstmt.executeQuery();
			list=new ArrayList<Team>();
			
			while(rset.next()) {
				Team t=new Team();
				
				t.setBno(rset.getInt("BOARDNO"));
				t.setbClass(rset.getString("BOARDCLASS"));
				t.setbTitle(rset.getString("BOARDTITLE"));
				t.setbContent(rset.getString("BOARDCONTENTS"));
				t.setbDate(rset.getDate("BOARDDATE"));
				t.setbClicks(rset.getInt("BOARDCLICKS"));
				t.setbAttach(rset.getString("BOARDATTACH"));
				t.setComNo(rset.getInt("COMMENTNO"));
				t.setComLevel(rset.getInt("COMMENTLEVEL"));
				t.setRecomId(rset.getString("RECOMMENTID"));
				
				t.setReplebno(rset.getInt("REPLEBOARDNO"));
				t.setWriterId(rset.getString("EMPNAME"));
				t.setStatus(rset.getString("WHETHEROFDELETE"));
				t.setFile01(rset.getInt("FILE01"));
				t.setFile02(rset.getInt("FILE02"));
				t.setFile03(rset.getInt("FILE03"));
				if(rset.getInt("ROWNUM") >=startRow && rset.getInt("ROWNUM") <=endRow) {
					list.add(t);
				}
				
				
			}
			System.out.println("title검색dao list: "+list.size());

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	//내용으로 검색 결과 페이징
	public ArrayList<Team> searchContent(String content, Connection con, int currentPage, int maxPage, int limit, String deptId) {
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		ArrayList<Team> list=null;
		System.out.println("dao content: "+content);
		System.out.println("dao currentPage: "+currentPage);
		String query=prop.getProperty("searchContent");
		
		System.out.println("dao query: "+query);
		try {
			pstmt=con.prepareStatement(query);
		
			
			int startRow = (currentPage - 1) * limit + 1; // 조회할 때 시작할 행 번호
			int endRow = startRow + limit - 1;
			
			System.out.println("dao startRow: "+startRow);
			System.out.println("dao endRow: "+endRow);
			pstmt.setInt(1, 1);
			pstmt.setInt(2, limit*maxPage);
			pstmt.setString(3, content);
			pstmt.setString(4, deptId);
			
			rset=pstmt.executeQuery();
			list=new ArrayList<Team>();
			
			while(rset.next()) {
				Team t=new Team();
				
				t.setBno(rset.getInt("BOARDNO"));
				t.setbClass(rset.getString("BOARDCLASS"));
				t.setbTitle(rset.getString("BOARDTITLE"));
				t.setbContent(rset.getString("BOARDCONTENTS"));
				t.setbDate(rset.getDate("BOARDDATE"));
				t.setbClicks(rset.getInt("BOARDCLICKS"));
				t.setbAttach(rset.getString("BOARDATTACH"));
				t.setComNo(rset.getInt("COMMENTNO"));
				t.setComLevel(rset.getInt("COMMENTLEVEL"));
				t.setRecomId(rset.getString("RECOMMENTID"));
				
				t.setReplebno(rset.getInt("REPLEBOARDNO"));
				t.setWriterId(rset.getString("EMPNAME"));
				t.setStatus(rset.getString("WHETHEROFDELETE"));
				t.setFile01(rset.getInt("FILE01"));
				t.setFile02(rset.getInt("FILE02"));
				t.setFile03(rset.getInt("FILE03"));
				if(rset.getInt("ROWNUM") >=startRow && rset.getInt("ROWNUM") <=endRow) {
					list.add(t);
				}
				
				
			}
			System.out.println("content검색dao list: "+list.size());

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	//첨부파일 등록1
	public int insertThumbnailContent(Connection con, Team t) {
		PreparedStatement pstmt = null;

		int result=0;

		String query = prop.getProperty("insertThumb");
System.out.println("insertThumb dao query: "+query);
		try {

		pstmt=con.prepareStatement(query);

		pstmt.setString(1, t.getbTitle());
		pstmt.setString(2, t.getbContent());
		pstmt.setString(3, t.getDeptId());
		pstmt.setInt(4, Integer.parseInt(t.getWriterId()));
		pstmt.setInt(5, t.getFile01());

		result = pstmt.executeUpdate();

		} catch (SQLException e) {

		e.printStackTrace();

		}finally {

		close(pstmt);

		}

		return result;
	}
	//첨부파일 등록
	public int insertAttachment(Connection con, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		int result=0;
		String query = prop.getProperty("insertAttachment");
		System.out.println("query2 "+query);
		System.out.println("insertAttachment dao fileList 사이즈 : "+fileList.size());
		try {

		for(int i=0; i < fileList.size(); i++) {

		pstmt=con.prepareStatement(query);

		
		pstmt.setString(1, fileList.get(i).getOriginName());
		pstmt.setString(2, fileList.get(i).getChangeName());
		pstmt.setString(3, fileList.get(i).getFilePath());

	

		result += pstmt.executeUpdate(); //'='하면 안돼

		}

		} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}finally {
		close(pstmt);
		}

		return result;
	}
	//ㅅㅣ퀀스값 조회
	public int selectCurrval(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		//select관련은 무조건 ResultSet!!

		int ano =0;

		String query = prop.getProperty("selectCurrval");
System.out.println("시퀀스값 조회쿼리 : "+query);
		try {

		stmt=con.createStatement();

		rset=stmt.executeQuery(query);

		if(rset.next()) {
			ano = rset.getInt("CURRVAL");
		}
		System.out.println("시퀀스dao의 ano : "+ano);
		} catch (SQLException e) {
		e.printStackTrace();

		}finally {

		close(stmt);
		close(rset);
		//여기서 close(con)해버리면 service에서 트랜잭션 처리가 안되니 주의할 것~~!!!

		}

		return ano;
	}
	//다운로드
	public Attachment selectOneAttachment(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		Attachment file = null;
		
		String query = prop.getProperty("selectOneAttachment");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				file = new Attachment();
				
				file.setAno(rset.getInt("ATTACHNO"));
				file.setOriginName(rset.getString("ATTACHPRENAME"));
				
				file.setChangeName(rset.getString("ATTACHNAME"));
				file.setFilePath(rset.getString("ATTACHPATH"));
				file.setUploadDate(rset.getDate("ATTACHDAY"));
				file.setWhetherofDelete(rset.getString("WHETHEROFDELETE"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}	
		
		return file;
	}
	
	

}
