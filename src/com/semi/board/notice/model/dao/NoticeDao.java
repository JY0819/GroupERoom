package com.semi.board.notice.model.dao;

import static com.semi.common.JDBCTemplate.close;
import static com.semi.common.JDBCTemplate.commit;

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

import com.semi.board.notice.model.vo.Attachment;
import com.semi.board.notice.model.vo.Notice;

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
	//글 상세보기(유파일)
	public HashMap<String, Object> selectOne(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Notice n = null;
		HashMap<String, Object> hmap = null;
		Attachment at = null;
		
		String query = prop.getProperty("selectOne");
System.out.println("상세보기 dao : "+query);
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
				
				at = new Attachment();
				at.setAno(rset.getInt("ATTACHNO"));
				at.setOriginName(rset.getString("ATTACHPRENAME"));
				at.setChangeName(rset.getString("ATTACHNAME"));
				at.setFilePath(rset.getString("ATTACHPATH"));
				at.setUploadDate(rset.getDate("ATTACHDAY"));
				at.setWhetherofDelete(rset.getString("WHETHEROFDELETE"));
				
			}
			
			hmap = new HashMap<String, Object>();
			
			hmap.put("Notice", n);
			hmap.put("attachment", at);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}


		return hmap;
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
			System.out.println("notice startRow: "+startRow);
			System.out.println("notice endRow: "+endRow);
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
	public HashMap<String, Object> editOne(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Notice n = null;
		HashMap<String, Object> hmap = null;
		Attachment at = null;
		
		String query = prop.getProperty("selectOne");
		
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
				

				n.setDeptId(rset.getString("DEPTID"));
				n.setReplebno(rset.getInt("REPLEBOARDNO"));
				n.setWriterId(rset.getString("EMPNAME"));
				n.setStatus(rset.getString("WHETHEROFDELETE"));
				n.setFile01(rset.getInt("FILE01"));
				n.setFile02(rset.getInt("FILE02"));
				n.setFile03(rset.getInt("FILE03"));
				
				at = new Attachment();
				at.setAno(rset.getInt("ATTACHNO"));
				at.setOriginName(rset.getString("ATTACHPRENAME"));
				at.setChangeName(rset.getString("ATTACHNAME"));
				at.setFilePath(rset.getString("ATTACHPATH"));
				at.setUploadDate(rset.getDate("ATTACHDAY"));
				at.setWhetherofDelete(rset.getString("WHETHEROFDELETE"));
				
			}
			hmap = new HashMap<String, Object>();
			
			hmap.put("Notice", n);
			hmap.put("attachment", at);
			
			
		} catch (SQLException e) {				
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}

		return hmap;
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
	//검색
	public ArrayList<Notice> searchValue(Connection con, String searchValue) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Notice> list = null;
		
		String query = prop.getProperty("searchValue");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, searchValue);
			
			rset=pstmt.executeQuery();
			
			list = new ArrayList<Notice>();
			
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
	//제목으로 검색 결과 게시글 수
	public int getSearchTitleListCount(Connection con, String title) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("searchTitleListCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, title);
			
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
	//내용으로 검색 결과 게시글 수
	public int getSearchContentListCount(Connection con, String content) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("searchContentListCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, content);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			System.out.println("dao 내용listCount: "+listCount);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
			
		return listCount;
	}
	//제목으로 검색 결과 페이징
	public ArrayList<Notice> searchTitle(String title, Connection con, int currentPage, int maxPage, int limit) {
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		ArrayList<Notice> list=null;
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
			
			rset=pstmt.executeQuery();
			list=new ArrayList<Notice>();
			
			while(rset.next()) {
				Notice n=new Notice();
				
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
				
				if(rset.getInt("ROWNUM") >=startRow && rset.getInt("ROWNUM") <=endRow) {
					list.add(n);
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
	//글내용으로 검색 결과 페이징
	public ArrayList<Notice> searchContent(String content, Connection con, int currentPage, int maxPage, int limit) {
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		ArrayList<Notice> list=null;
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
			
			rset=pstmt.executeQuery();
			list=new ArrayList<Notice>();
			
			while(rset.next()) {
				Notice n=new Notice();
				
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
				
				if(rset.getInt("ROWNUM") >=startRow && rset.getInt("ROWNUM") <=endRow) {
					list.add(n);
				}
				
				
			}
			System.out.println("content 검색dao list: "+list.size());

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	//선택한 공지사항 삭제
	public int deleteNotice2(Connection con, ArrayList<Integer> deleteList) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		for (int i = 0; i < deleteList.size(); i++) {
			pstmt = null;
			String query = prop.getProperty("deleteNotice2");
			
			try {
				pstmt = con.prepareStatement(query);
				
				pstmt.setInt(1, deleteList.get(i));
				
				result += pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		close(pstmt);
		
		System.out.println("dao result:"+result);
		return result;
	}
	//시퀀스조회
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
	//첨부파일 등록1
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
	//첨부파일 등록2
	public int insertThumbnailContent(Connection con, Notice n) {
		PreparedStatement pstmt = null;

		int result=0;

		String query = prop.getProperty("insertThumb");
		System.out.println("첨부파일 등록 dao query: "+query);
		try {

		pstmt=con.prepareStatement(query);

		pstmt.setString(1, n.getbTitle());
		pstmt.setString(2, n.getbContent());
		pstmt.setString(3, n.getDeptId());
		pstmt.setInt(4, Integer.parseInt(n.getWriterId()));
		pstmt.setInt(5, n.getFile01());
		result = pstmt.executeUpdate();

		} catch (SQLException e) {

		e.printStackTrace();

		}finally {

		close(pstmt);
		commit(con);
		}

		return result;
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
	//글 상세보기(노파일)
	public Notice selectOneNoFile(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Notice n = null;
		
		String query = prop.getProperty("selectOneNoFile");
		System.out.println("첨부파일 없는 글 상세보기 dao query: "+query);
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				 n=new Notice();
				
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
				
			}
			System.out.println("노파일 dao ");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}

		
		return n;
	}
	//노파일 글 수정
	public Notice editNoFile(Connection con, int num) {
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		Notice n=null;
		
		String query=prop.getProperty("selectNoFile");
		System.out.println("노파일 수정페이지 가기 전 dao query: "+query);
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, num);
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				 n=new Notice();
					
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
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return n;
	}
	//첨부파일 등록
	public int updateAttachment(Connection con, Attachment at) {
		PreparedStatement pstmt = null;
		int result=0;
		String query = prop.getProperty("updateAttachment");
		System.out.println("updateAttachment dao query: "+query);
		try {

		

		pstmt=con.prepareStatement(query);

		
		pstmt.setString(1, at.getOriginName());
		pstmt.setString(2, at.getChangeName());
		pstmt.setString(3, at.getFilePath());


		result = pstmt.executeUpdate(); 

	

		} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}finally {
		close(pstmt);
		}

		return result;
	}
	//유파일 수정용
	public int updateFileNotice(Connection con, Notice n) {
		PreparedStatement pstmt = null;
		int result=0;
		String query = prop.getProperty("updateFileNotice");
		System.out.println("update쿼리:"+query);
		System.out.println("1, n.getbTitle(): "+n.getbTitle());
		System.out.println("2, n.getbContent() : "+n.getbContent());
		System.out.println("3, n.getFile02() :"+n.getFile02());
		System.out.println("4, n.getBno(): "+n.getBno());
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, n.getbTitle());
			pstmt.setString(2, n.getbContent());
		
			pstmt.setInt(3, n.getFile02());
			pstmt.setInt(4, n.getBno());
			
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
	}
	//유파일 수정용
	public int deleteOriginFile(Connection con, int originAno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result=0;
		String query = prop.getProperty("selectOneAttachment");
		System.out.println("deleteOriginFile dao query :" +query);
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, originAno);
			
			result=pstmt.executeUpdate();
		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return result;
	}
	//유파일 수정용
	public int deleteAttachment(Connection con, int originAno) {
		PreparedStatement pstmt = null;
		int result =0;
		String query = prop.getProperty("deleteAttachment");
		System.out.println("deleteAttachment dao query: "+query);
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, originAno);
			
			result=pstmt.executeUpdate();
			System.out.println("deleteAttachment dao result: "+result);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	

}
