<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<jsp:include page="/views/main/mainPage.jsp" />
<link rel="stylesheet" type="text/css"
	href="/semi/assets/css/admin/board.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<div id="title">
		<h1 align="center">l 공지사항</h1>
	</div>

	<div class="container">
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
	</div>

	<div class="noticeListBtn">
		<button type="button" id="writeBtn" class="btn btn-primary">작성</button>
		<button type="button" id="deleteBtn" class="btn btn-primary">삭제</button>
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
	</script>


</body>
</html>