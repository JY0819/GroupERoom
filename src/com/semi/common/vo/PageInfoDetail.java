package com.semi.common.vo;

public class PageInfoDetail {
	// -----------------페이징 처리 추가---------------------- //
	private int currentPage = 1;	// 현재 보고있는 페이지를 표시할 변수
	private int limit 		= 10;	// 한 페이지에 게시글이 몇 개가 보여질 것인지 표시
	private int maxPage 	= 0;	// 전체 페이지에서 가장 마지막 페이지
	private int startPage 	= 0;	// 한번에 표시될 페이지가 시작할 페이지
	private int endPage 	= 0;	// 한번에 표시될 페이지가 끝나는 페이지
	private int listCount 	= 0;	// 전체 게시글 수 조회

	private PageInfo pi; // 페이지 정보
	
	/***
	 * @author 이주영
	 * @since 2019.01.07
	 * @detail construct
	 * @param currentPage 현재 보고 있는 페이지
	 * @param limit 한 페이지에 게시글 수
	 * @param listCount 전체 게시글 페이지 수
	 */
	public PageInfoDetail(int currentPage, int limit, int listCount){
		this.currentPage = currentPage; // 현재 페이지 처리 
		this.limit 		= limit;	 	// 한 페이지에 보여질 목록 갯수
		this.listCount  = listCount; 	// 전체 게시글 수 조회
		
		this.detailLogic();
	}
	
	/**
	 * @author 이주영
	 * @since 2019.01.07
	 * @detail 페이지 정보 가져오기
	 * */
	public PageInfo getPageInfo() {
		return pi;
	}
	
	public void resetPaging(int currentPage, int limit, int listCount){
		this.currentPage = currentPage; // 현재 페이지 처리 
		this.limit 		= limit;	 	// 한 페이지에 보여질 목록 갯수
		this.listCount  = listCount; 	// 전체 게시글 수 조회
		
		this.detailLogic();
	}
	
	private void detailLogic() {
		/* 총 페이지 수 계산 */
		// 예를 들어, 목록 수가 123개이면 페이지는 13페이지가 필요하다.
		this.maxPage = (int)((double)this.listCount / this.limit + 0.9);
		
		
		/* 현재 페이지에 보여줄 시작페이지 수 */
		// (10페이지 기준) 1, 11, 21, 31, ..
		this.startPage = (((int)((double)this.currentPage / this.limit + 0.9)) - 1 ) * this.limit + 1;
		
		
		/* 목록 아래쪽에 보여질 마지막 페이지 수(10, 20, 30, ...) */
		this.endPage = this.startPage + 10 - 1;
		
		if(this.maxPage < this.endPage) {
			this.endPage = this.maxPage;
		}
		
		this.setPageInfo();
	}
	
	private void setPageInfo() {
		if(this.pi == null) {
			this.pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		}else {
			this.pi.setCurrentPage(currentPage);
			this.pi.setListCount(listCount);
			this.pi.setLimit(limit);
			this.pi.setMaxPage(maxPage);
			this.pi.setStartPage(startPage);
			this.pi.setEndPage(endPage);
		}
	}
}
