package com.semi.board.Free.model.service;



import static com.semi.common.JDBCTemplate.close;
import static com.semi.common.JDBCTemplate.commit;
import static com.semi.common.JDBCTemplate.getConnection;
import static com.semi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.semi.board.Free.model.dao.FreeDao;
import com.semi.board.Free.model.vo.Attachment;
import com.semi.board.Free.model.vo.Free;

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
		public HashMap<String, Object> selectOne(int num) {
			Connection con = getConnection();
			HashMap<String, Object> hmap = null;

			
			int result = new FreeDao().updateCount(con, num);

			if(result > 0) {
				commit(con);
				hmap = new FreeDao().selectOne(con, num);
			}else {
				rollback(con);
			}
			close(con);

			return hmap;
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
		public int updateFree(Free f, Attachment at, int originAno ) {
			Connection con = getConnection();
			
			int result=0;
			
			int result0 = new FreeDao().updateAttachment(con, at);
			System.out.println("updateAttachment result0 : "+result0);
			if(result0 > 0) {
				int ano=new FreeDao().selectCurrval(con);
				
				f.setFile02(ano);
			
			}
			
			int result2=0;
			
			result2= new FreeDao().updateFree(con, f);
			System.out.println("service result2: "+result2);

				
				
			int result4 = new FreeDao().deleteOriginFile(con, originAno);
				System.out.println("service result4: "+result4);
			int result3 = new FreeDao().deleteAttachment(con, originAno);
			System.out.println(result0+""+result2+""+result4+""+result3);
			
			if(result0 > 0 && result2 > 0 && result3 > 0 && result4 > 0 ) {			
				commit(con);
				result=1;
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
		public HashMap<String, Object> editOne(int num) {
			Connection con = getConnection();
			HashMap<String, Object> hmap = new FreeDao().editOne(con, num);
			
			int result = 0;
			
			if(hmap != null) {
				result = new FreeDao().updateCount(con, num);
				if(result > 0) commit(con);
				else rollback(con);	
				
			}
			
			close(con);
			
			return hmap;
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
		//작성자로 검색
		/*public ArrayList<Free> searchName(String userName) {
			Connection con = getConnection();
			ArrayList<Free> list = new FreeDao().searchName(con, userName);
			System.out.println("service listsize:"+list.size());
			close(con);
			
			return list;
		}*/
		//글 제목으로 검색
		/*public ArrayList<Free> searchtitle(String title) {
			Connection con = getConnection();
			ArrayList<Free> list = new FreeDao().searchTitle(con, title);
			System.out.println("service listsize:"+list.size());
			close(con);
			
			return list;
		}*/
		//이름으로 검색 결과 페이징
		public ArrayList<Free> searchName(String userName, int currentPage ,int maxPage, int limit) {
			Connection con = getConnection();
			
			ArrayList<Free> list = new FreeDao().searchName(userName, con, currentPage,maxPage, limit);
			System.out.println("servcie list: "+list.size());

			
			System.out.println("name으로 검색service: "+list.size());
			close(con);
			
			return list;
		}
		
		//글제목으로 검색 결과 페이징
		public ArrayList<Free> searchTitle(String title, int currentPage, int maxPage,int limit) {
			Connection con = getConnection();
			ArrayList<Free> list = new FreeDao().searchTitle(title, con, currentPage, maxPage, limit);
			
			System.out.println("title로 검색service: "+list.size());
			close(con);
			
			return list;
		}
		//검색 결과 전체 게시글 수
		public int getSearchTitleListCount(String title) {
			Connection con = getConnection();
			
			int listCount = new FreeDao().getSearchTitleListCount(con, title);
			
			close(con);
			
			return listCount;
		}
		//이름 검색 결과 전체 게시물 수
		public int getSearchNameListCount(String userName) {
			Connection con = getConnection();
			
			int listCount = new FreeDao().getSearchNameListCount(con, userName);
			
			System.out.println("service listCount:"+listCount);
			close(con);
			
			return listCount;
		}
		//첨부파일까지 추가해서 글 작성
		/*public int insertAttachment(Free f, ArrayList<Attachment> fileList) {
			Connection con = getConnection();
			int result = 0;
			int result1 = new FreeDao().insertFree(con, f);
			
			if(result1 > 0) {
				int ano = new FreeDao().selectCurrval(con); //지금 가지고 있는 시퀀스값을 조회하기 위함
				
				for(int i=0;i<fileList.size();i++) {
					fileList.get(i).setAno(ano);
				}				
			}
			
			int result2 = new FreeDao().insertAttachment(con, fileList);
			
			//트랜잭션 처리
			if(result1 > 0 && result2 > 0) {
				commit(con);
				result = 1; //0보다만 크면 되니까 1 처리 해주기
			}else {
				rollback(con);
			}
			close(con);
			
			return result;
			
		}*/
		//글 클릭하면서 댓글 목록 같이 조회
		public ArrayList<Free> selectReply(int num) {
			Connection con = getConnection();
			
			ArrayList<Free> reply = new FreeDao().selectReply(con, num);
			
			System.out.println("service 댓글: "+reply.size());
			close(con);
			
			return reply;
			
		}
		//글 내용으로 검색 결과 페이징
		public ArrayList<Free> searchContent(String content, int currentPage, int maxPage, int limit) {
			Connection con = getConnection();
			ArrayList<Free> list = new FreeDao().searchContent(content, con, currentPage, maxPage, limit);
			
			System.out.println("content로 검색service: "+list.size());
			close(con);
			
			return list;
		}
		//글 내용으로 검색 결과 게시글 수
		public int getSearchContentListCount(String content) {
			Connection con = getConnection();
			
			int listCount = new FreeDao().getSearchContentListCount(con, content);
			
			close(con);
			
			return listCount;
		}
		
		
		//첨부파일 등록
		public int insertThumbnail(Free f, ArrayList<Attachment> fileList) {
			Connection con = getConnection();

			int result = 0;
			int result2 = 0;
			int result1 = new FreeDao().insertAttachment(con, fileList);
			System.out.println("service result1 : "+result1);
						//트랜잭션 처리
			if(result1 > 0) {

				int ano = new FreeDao().selectCurrval(con); //지금가지고있는 시퀀스값을 조회하기 위함
																		 //메모 확인
				for(int i=0;i<fileList.size(); i++) {
							
					fileList.get(i).setAno(ano); 
					if(i==0) {
						f.setFile01(fileList.get(i).getAno());
					}
					/*if(i==1) {
						f.setFile02(fileList.get(i).getAno()-1);
					}
					if(i==2) {
						f.setFile03(fileList.get(i).getAno()-2);
					}*/
				} 
				result2 = new FreeDao().insertThumbnailContent(con, f);
			
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
			
			Attachment file = new FreeDao().selectOneAttachment(con, num);
			
			close(con);
			
			
			return file;
		}
		//첨부파일 없는 글 상세보기
		public Free selectOneNoFile(int num) {
			Connection con = getConnection();
			
			Free f = null;
			
			//조회수 증가
			int result = new FreeDao().updateCount(con,  num);
			
			if(result > 0) {
				commit(con);
				f = new FreeDao().selectOneNoFile(con, num);
			
			}else {
				rollback(con);
			}
			
			close(con);
			return f;
		}
		
}
