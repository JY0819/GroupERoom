package com.semi.board.notice.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.semi.board.Free.model.vo.Free;
import com.semi.board.notice.model.vo.Notice;
import static com.semi.common.JDBCTemplate.*;

public class NoticeDao {
	
	private Properties prop = new Properties();
	
	public NoticeDao() {
		String fileName = NoticeDao.class.getResource("/sql/board/notice/notice-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//공지사항 등록
	public int insertNotice(Connection con, Notice n) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertNotice");
		
		System.out.println("dao"+query);
		try {
			pstmt=con.prepareStatement(query);
			
			pstmt.setString(1, n.getbTitle());
			pstmt.setString(2, n.getbContent());
			pstmt.setString(3, n.getDeptId());
			pstmt.setString(4, n.getWriterId());
			
			System.out.println(n.getbTitle());
			System.out.println(n.getbContent());
			System.out.println(n.getWriterId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	//공지사항 리스트 불러오기
	public ArrayList<Notice> selectList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Notice> list =  null;
		
		String query = prop.getProperty("selectList");
		
		System.out.println(query);
		
		try {
			stmt=con.createStatement();
			rset=stmt.executeQuery(query);

			list=new ArrayList<Notice>();
			
			while(rset.next()) {
				Notice n = new Notice();
				
				n.setBno(rset.getInt("BOARDNO"));
				n.setbClass(rset.getString("BOARDCLASS"));
				n.setbTitle(rset.getString("BOARDTITLE"));
				n.setbContent(rset.getString("BOARDCONTENTS"));

				n.setbDate(rset.getDate("BOARDDATE"));
				n.setbClicks(rset.getInt("BOARDCLICKS"));
				n.setbAttach(rset.getString("BOARDATTACH"));
				n.setComNo(rset.getInt("COMMENTNO"));
				n.setComLevel(rset.getInt("COMMENTLEVEL"));
				n.setRecomId(rset.getString("RECOMMENTID"));
				

				n.setDeptId(rset.getString("DEPTID"));
				n.setReplebno(rset.getInt("REPLEBOARDNO"));
				n.setWriterId(rset.getString("EMPNAME"));
				n.setStatus(rset.getString("WHETHEROFDELETE"));
				n.setFile01(rset.getInt("FILE01"));
				n.setFile02(rset.getInt("FILE02"));
				n.setFile03(rset.getInt("FILE03"));
				
				list.add(n);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}
	//조회수 증가
	public int updateCount(Connection con, int num) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateCount");

		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, num);
			pstmt.setInt(2, num);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
	}
	//글 상세보기
	public Notice selectOne(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Notice n = null;
			
		
		String query = prop.getProperty("selectOne");
		System.out.println(query);
					try {
						pstmt=con.prepareStatement(query);
						pstmt.setInt(1, num);

						rset=pstmt.executeQuery();

						if(rset.next()) {
							n = new Notice();

							n.setBno(rset.getInt("BOARDNO"));
							n.setbClass(rset.getString("BOARDCLASS"));
							n.setbTitle(rset.getString("BOARDTITLE"));
							n.setbContent(rset.getString("BOARDCONTENTS"));
							n.setbDate(rset.getDate("BOARDDATE"));
							n.setbClicks(rset.getInt("BOARDCLICKS"));
							n.setbAttach(rset.getString("BOARDATTACH"));
							n.setComNo(rset.getInt("COMMENTNO"));
							n.setComLevel(rset.getInt("COMMENTLEVEL"));
							n.setRecomId(rset.getString("RECOMMENTID"));
							
							n.setReplebno(rset.getInt("REPLEBOARDNO"));
							n.setWriterId(rset.getString("EMPNAME"));
							n.setStatus(rset.getString("WHETHEROFDELETE"));
							n.setFile01(rset.getInt("FILE01"));
							n.setFile02(rset.getInt("FILE02"));
							n.setFile03(rset.getInt("FILE03"));

							rset=pstmt.executeQuery();



						}
					} catch (SQLException e) {
						e.printStackTrace();
					}finally {
						close(pstmt);
						close(rset);
					}


					return n;
	}
	//글 삭제
	public int deleteNotice(Connection con, int bno) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("deleteNotice");
		
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
	//전체 글 수 조회
	public int getlistCount(Connection con) {
		Statement stmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("listCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
			
		return listCount;
	}
	//페이징 처리 후 글 목록 조회
	public ArrayList<Notice> selectList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Notice> list = null;
		
		String query = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset=pstmt.executeQuery();
			
			list= new ArrayList<Notice>();
			
			while(rset.next()) {
				
			
			Notice n = new Notice();
			
			n.setBno(rset.getInt("BOARDNO"));
			n.setbClass(rset.getString("BOARDCLASS"));
			n.setbTitle(rset.getString("BOARDTITLE"));
			n.setbContent(rset.getString("BOARDCONTENTS"));
			n.setbDate(rset.getDate("BOARDDATE"));
			n.setbClicks(rset.getInt("BOARDCLICKS"));
			n.setbAttach(rset.getString("BOARDATTACH"));
			n.setComNo(rset.getInt("COMMENTNO"));
			n.setComLevel(rset.getInt("COMMENTLEVEL"));
			n.setRecomId(rset.getString("RECOMMENTID"));
			
			n.setReplebno(rset.getInt("REPLEBOARDNO"));
			n.setWriterId(rset.getString("EMPNAME"));
			n.setStatus(rset.getString("WHETHEROFDELETE"));
			n.setFile01(rset.getInt("FILE01"));
			n.setFile02(rset.getInt("FILE02"));
			n.setFile03(rset.getInt("FILE03"));
			
			list.add(n);
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
	//글 수정
	public Notice selectOne(Connection con, String num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Notice n = null;
		
		String query = prop.getProperty("selectOne");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(num));
			
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				n = new Notice();

				n.setBno(rset.getInt("BOARDNO"));
				n.setbClass(rset.getString("BOARDCLASS"));
				n.setbTitle(rset.getString("BOARDTITLE"));
				n.setbContent(rset.getString("BOARDCONTENTS"));

				n.setbDate(rset.getDate("BOARDDATE"));
				n.setbClicks(rset.getInt("BOARDCLICKS"));
				n.setbAttach(rset.getString("BOARDATTACH"));
				n.setComNo(rset.getInt("COMMENTNO"));
				n.setComLevel(rset.getInt("COMMENTLEVEL"));
				n.setRecomId(rset.getString("RECOMMENTID"));
				

				n.setDeptId(rset.getString("DEPTID"));
				n.setReplebno(rset.getInt("REPLEBOARDNO"));
				n.setWriterId(rset.getString("EMPNAME"));
				n.setStatus(rset.getString("WHETHEROFDELETE"));
				n.setFile01(rset.getInt("FILE01"));
				n.setFile02(rset.getInt("FILE02"));
				n.setFile03(rset.getInt("FILE03"));
				
				
			}
			
			
		} catch (SQLException e) {				
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}

		return n;
	}
	//수정용
	public int updateNotice(Connection con, Notice n) {
		PreparedStatement pstmt = null;
		int result=0;
		String query = prop.getProperty("updateNotice");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, n.getbTitle());
			pstmt.setString(2, n.getbContent());
			pstmt.setInt(3, n.getBno());
			
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
	public int insertReply(Connection con, Notice n) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		String query = prop.getProperty("insertReply");
		System.out.println("dao댓글작성: "+query);
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, n.getbContent());
			pstmt.setInt(2, n.getBno());
			pstmt.setString(3, n.getWriterId());
			
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
	//댓글조회
	public ArrayList<Notice> selectReplyList(Connection con, int bno) {
		PreparedStatement pstmt= null;
		ResultSet rset = null;
		ArrayList<Notice> list=null;
		
		String query = prop.getProperty("selectReplyList");
		System.out.println("dao 목록 쿼리 : "+query);
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, bno);
			
			rset=pstmt.executeQuery();
			
			list=new ArrayList<Notice>();
			
			while(rset.next()) {
				Notice n = new Notice();
				
				n.setBno(rset.getInt("BOARDNO"));
				n.setbContent(rset.getString("BOARDCONTENTS"));
				n.setWriterId(rset.getString("EMPNAME"));
				n.setComNo(rset.getInt("COMMENTNO"));
				n.setComLevel(rset.getInt("COMMENTLEVEL"));
				n.setbDate(rset.getDate("BOARDDATE"));
				
				list.add(n);

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
	//글 클릭하면서 댓글 목록 가져오기
	public ArrayList<Notice> selectReply(Connection con, int num) {
		PreparedStatement pstmt = null;
		ArrayList<Notice> reply = null;
		ResultSet rset = null;
		Notice n = null;

		String query = prop.getProperty("selectReply");
		System.out.println(num);
		System.out.println(query);
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset=pstmt.executeQuery();
			
		
				reply= new ArrayList<Notice>();
				
				while(rset.next()) {
					n= new Notice();
				
				
				n.setBno(rset.getInt("BOARDNO"));
				n.setbContent(rset.getString("BOARDCONTENTS"));
				n.setbDate(rset.getDate("BOARDDATE"));
				
				n.setReplebno(rset.getInt("REPLEBOARDNO"));
				n.setWriterId(rset.getString("EMPNAME"));
		
				reply.add(n);
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

}
