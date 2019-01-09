<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="/semi/assets/css/admin/board.css">
<jsp:include page="/views/layout/treeview/admin/layout-up.jsp" />

<script>
	$(function(){
		$("#checkAll").click(function(){
			if($("#checkAll").prop("checked")){
				$("input[name=chk]").prop("checked", true);
			} else{
				$("input[name=chk]").prop("checked", false);
			}
		});
	});
	
	var jsonData = treeviewJson.adminJson;
	var nodeName = "공지 관리";
</script>

<section class="content">
	<div class="content-left">
		<div id="treeview"></div>
	</div>
	
	<div class="content-right container">
		<div id="title">
			<h1 align="left">공지사항</h1>
		</div>
		
		<div class="noticeListBtn">
			<button type="button" id="writeBtn" class="btn btn-primary">작성</button>
			<button type="button" id="deleteBtn" class="btn btn-warning">삭제</button>
		</div>
		<table class="table table-striped">
			<thead>
				<tr>
					<th><input type="checkbox" id="checkAll"></th>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
	
			<tbody>
				<tr>
					<td><input type="checkbox" name="chk"></td>
					<td>3</td>
					<td>공지사항 2</td>
					<td>관리자</td>
					<td>2018.12.22</td>
					<td>0</td>
				</tr>
	
				<tr>
					<td><input type="checkbox" name="chk"></td>
					<td>2</td>
					<td>공지사항 2</td>
					<td>관리자</td>
					<td>2018.12.22</td>
					<td>0</td>
				</tr>
	
				<tr>
					<td><input type="checkbox" name="chk"></td>
					<td>1</td>
					<td>공지사항 1</td>
					<td>관리자</td>
					<td>2018.12.22</td>
					<td>0</td>
				</tr>
			</tbody>
		</table>
		
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

<jsp:include page="/views/layout/treeview/admin/layout-down.jsp" />