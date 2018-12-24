<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="/semi/assets/css/admin/board.css">
<jsp:include page="/views/layout/treeview/board/layout-up.jsp" />

<script>
	
	var jsonData = treeviewJson.boardJson;
	var nodeName = "부서게시판";
</script>

<section class="content">
	<div class="content-left">
		<div id="treeview"></div>
	</div>
	
	<div class="content-right container">
		<div id="title">
			<h1 align="left"> | 부서게시판 |</h1>
		</div>
		<hr>
		<h2 align="center">"#"에 해당하는 검색 결과</h2>
		
		<div class="noticeListBtn">
			<button type="button" id="writeBtn" class="btn btn-primary">작성</button>
			<button type="button" id="deleteBtn" class="btn btn-warning">삭제</button>
		</div>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>부서</th>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
	
			<tbody>
				<tr>
					<td>기획</td>
					<td>3</td>
					<td>자유게시글 3</td>
					<td>김길동</td>
					<td>2018.12.22</td>
					<td>0</td>
				</tr>
	
				<tr>
					<td>마케팅</td>
					
					<td>2</td>
					<td>자유게시글 2</td>
					<td>강길동</td>
					<td>2018.12.22</td>
					<td>0</td>
				</tr>
	
				<tr>
					<td>회계</td>
					
					<td>1</td>
					<td>자유게시글 1</td>
					<td>민길동</td>
					<td>2018.12.22</td>
					<td>0</td>
				</tr>
			</tbody>
		</table>
		
		<div id="searchBtn" align="center">
    	<input type="search">
    	<button type="submit" class="btn btn-primary"><a href="searchViewTeam.jsp" id="textBtn" >검색</a></button>
    	
	</div>	
		
		<div class="paging" align="center">
			<ul class="pagination">
				<li><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
			</ul>
		</div>
	</div>
</section>
<script>
	$(function(){
		$("#writeBtn").click(function(){
			location.href="/semi/views/board/team/writeTeam.jsp";
		});
	});
</script>
<jsp:include page="/views/layout/treeview/board/layout-down.jsp" />