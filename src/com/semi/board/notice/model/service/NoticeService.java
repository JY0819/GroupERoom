package com.semi.board.notice.model.service;

import static com.semi.common.JDBCTemplate.close;
import static com.semi.common.JDBCTemplate.commit;
import static com.semi.common.JDBCTemplate.getConnection;
import static com.semi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.semi.board.notice.model.dao.NoticeDao;
import com.semi.board.notice.model.vo.Attachment;
import com.semi.board.notice.model.vo.Notice;

public class NoticeService {

	//공지사항 등록
	public int insertNotice(Notice n) {
		Connection con = getConnection();
		
		int result = new NoticeDao().insertNotice(con, n);
		
		System.out.println("service");
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		return result;
	}
	//공지사항 리스트 불러오기
	public ArrayList<Notice> selectList() {
		Connection con = getConnection();
		System.out.println("service ");
		
		ArrayList<Notice> list = new NoticeDao().selectList(con);
		System.out.println("NoticeService list: "+list.size());
		close(con);
		
		return list;
		
		
	}
	//글 상세보기(유파일)
	public HashMap<String, Object> selectOne(int num) {
		Connection con = getConnection();
		HashMap<String, Object> hmap = null;

		
		int result = new NoticeDao().updateCount(con, num);

		if(result > 0) {
			commit(con);
			hmap = new NoticeDao().selectOne(con, num);
		}else {
			rollback(con);
		}
		close(con);

		return hmap;
		
		
		
	}
	//글 삭제
	public int deleteNotice(int bno) {
		Connection con = getConnection();
		
		int result = new NoticeDao().deleteNotice(con, bno);
		
		System.out.println("service bno: "+bno);
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		return result;
	}
	//전체 글 수 조회
	public int getListCount() {
		Connection con = getConnection();
		
		int listCount = new NoticeDao().getlistCount(con);
		
		close(con);
		
		return listCount;
	}
	//페이징 처리 후 글 목록 조회
	public ArrayList<Notice> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<Notice> list = new NoticeDao().selectList(con, currentPage, limit);
		
		System.out.println("service: "+list.size());
		close(con);
		
		return list;
	}
	//글 수정
	public HashMap<String, Object> editOne(int num) {
		Connection con = getConnection();
		
		HashMap<String, Object> hmap = new NoticeDao().editOne(con, num);
		
		int result = 0;
		
		if(hmap != null) {
			result = new NoticeDao().updateCount(con, num);
			if(result > 0) commit(con);
			else rollback(con);	
			
		}
		
		close(con);
		
		return hmap;
	}
	//수정용
	public int updateNotice(Notice n) {
		Connection con = getConnection();
		
		int result = new NoticeDao().updateNotice(con, n);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		
		return result;
	}
	//댓글 작성
	public ArrayList<Notice> insertReply(Notice n) {
		Connection con = getConnection();
		ArrayList<Notice> replyList = null;
		
		int result= new NoticeDao().insertReply(con, n);
		
		System.out.println("service: "+replyList);
		
		if(result > 0) {
			
			commit(con);
			replyList = new NoticeDao().selectReplyList(con, n.getBno());
			//=>20번글을 보고 있으면 20번글에 대한 댓글만 조회할 수 있도록
		}else {
			rollback(con);
		}
		
		close(con);
		
		return replyList;
	}
	//글 클릭하면 댓글 목록 조회
	public ArrayList<Notice> selectReply(int num) {
		Connection con = getConnection();
		
		ArrayList<Notice> reply = new NoticeDao().selectReply(con, num);
		
		System.out.println("service 댓글: "+reply.size());
		close(con);
		
		return reply;
	}
	//검색용
	public ArrayList<Notice> searchValue(String searchValue) {
		Connection con = getConnection();
		ArrayList<Notice> list = new NoticeDao().searchValue(con, searchValue);
		System.out.println("service listsize:"+list.size());
		close(con);
		
		return list;
	}
	//제목으로 검색 결과 게시글 수
	public int getSearchTitleListCount(String title) {
		Connection con = getConnection();
		
		int listCount = new NoticeDao().getSearchTitleListCount(con, title);
		
		System.out.println("service 제목 listCount:"+listCount);
		close(con);
		
		return listCount;
	}
	//내용으로 검색 결과 게시글 수
	public int getSearchContentListCount(String content) {
		Connection con = getConnection();
		
		int listCount = new NoticeDao().getSearchContentListCount(con, content);
		
		System.out.println("service 내용 listCount:"+listCount);
		close(con);
		
		return listCount;
	}
	//제목으로 검색 결과 페이징
	public ArrayList<Notice> searchTitle(String title, int currentPage, int maxPage, int limit) {
		Connection con = getConnection();
		ArrayList<Notice> list = new NoticeDao().searchTitle(title, con, currentPage, maxPage, limit);
		
		System.out.println("title로 검색service: "+list.size());
		close(con);
		
		return list;
	}
	//글내용으로 검색 페이징
	public ArrayList<Notice> searchContent(String content, int currentPage, int maxPage, int limit) {
		Connection con = getConnection();
		ArrayList<Notice> list = new NoticeDao().searchContent(content, con, currentPage, maxPage, limit);
		
		System.out.println("내용으로 검색service: "+list.size());
		close(con);
		
		return list;
	}
	//선택한 공지사항 삭제
	public int deleteNotice2(ArrayList<Integer> deleteList) {
		Connection con = getConnection();
		
		int result = new NoticeDao().deleteNotice2(con, deleteList);
		System.out.println("service");
		close(con);
		
		return result;
	}
	//첨부파일 등록
	public int insertThumbnail(Notice n, ArrayList<Attachment> fileList) {
		Connection con = getConnection();

		int result = 0;
		int result2 = 0;
		int result1 = new NoticeDao().insertAttachment(con, fileList);
		System.out.println("service result1 : "+result1);
					//트랜잭션 처리
		if(result1 > 0) {

			int ano = new NoticeDao().selectCurrval(con); //지금가지고있는 시퀀스값을 조회하기 위함
																	 //메모 확인
			for(int i=0;i<fileList.size(); i++) {
						
				fileList.get(i).setAno(ano); 
				if(i==0) {
					n.setFile01(fileList.get(i).getAno());
				}
				
			} 
			result2 = new NoticeDao().insertThumbnailContent(con, n);
		
		}			

		System.out.println("service result2 : "+result2);
		System.out.println("service fileList 사이즈 : "+fileList.size());
		//board가 부모고 file이 자식이라 부모에 값 먼저 넣어줘야함

		
	

		if(result1 > 0 &&result2 > 0) {
			
			commit(con);
			
			result = 1; //0보다만 크면 되니까 1 처리 해주기
		}else {

			rollback(con);

		}

		close(con);

		return result;
	}
	//다운로드
	public Attachment selectOneAttachment(int num) {
		Connection con = getConnection();
		
		Attachment file = new NoticeDao().selectOneAttachment(con, num);
		
		close(con);
		
		
		return file;
	}
	//글 상세보기(노파일)
	public Notice selectOneNoFile(int num) {
		Connection con = getConnection();
		
		Notice n = null;
		
		//조회수 증가
		int result = new NoticeDao().updateCount(con,  num);
		System.out.println("noFile service 조회수 result : "+result);
		if(result > 0) {
			commit(con);
			n = new NoticeDao().selectOneNoFile(con, num);
		System.out.println("noFile service 상세보기 ");
		}else {
			rollback(con);
		}
		
		close(con);
		return n;
	}
	//노파일 글 수정
	public Notice editNoFile(int num) {
		Connection con=getConnection();
		System.out.println("노파일 글 수정페이지 가기 전 서비스");
		Notice n=new NoticeDao().editNoFile(con, num);
		System.out.println("노파일 글 수정페이지 가기 전 service");
		int result=0;
		if(n!=null) {
			result=new NoticeDao().updateCount(con, n.getBno());
			if(result>0) { commit(con);}
			else { rollback(con); }
			
		}
		close(con);
		
		return n;
	}
	//유파일 글 수정하기
	public int updateFileNotice(Notice n, Attachment at, int originAno) {
		Connection con = getConnection();
		
		int result=0;
		
		int result0 = new NoticeDao().updateAttachment(con, at);
		System.out.println("updateAttachment result0 : "+result0);
		if(result0 > 0) {
			int ano=new NoticeDao().selectCurrval(con);
			
			n.setFile02(ano);
		
		}
		
		int result2=0;
		
		result2= new NoticeDao().updateFileNotice(con, n);
		System.out.println("service result2: "+result2);

			
			
		int result4 = new NoticeDao().deleteOriginFile(con, originAno);
			System.out.println("service result4: "+result4);
		int result3 = new NoticeDao().deleteAttachment(con, originAno);
		System.out.println(result0+""+result2+""+result4+""+result3);
		
		if(result0 > 0 && result2 > 0 && result3 > 0 && result4 > 0 ) {			
			commit(con);
			result=1;
		}else {
			rollback(con);
		}
		
		return result;
	}
	

}
