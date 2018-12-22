<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<jsp:include page="/views/main/mainPage.jsp" />
<!-- <link rel="stylesheet" type="text/css" href="/semi/assets/css/admin/board.css"> -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style>
.container {
	margin-top: 60px;
}
</style>
</head>
<body>
	<!-- 
	<div id="title">
		<h1 align="center">l 공지사항</h1>
	</div>
	 -->

	<div class="container">
		<h1 align="center">사원 관리</h1>
		<hr>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>사원 번호</th>
					<th>이름</th>
					<th>성별</th>
					<th>부서</th>
					<th>직책</th>
					<th>퇴사 여부</th>
				</tr>
			</thead>

			<tbody>
				<tr>
					<td>GE00001</td>
					<td>이주영</td>
					<td>여자</td>
					<td>개발</td>
					<td>대리</td>
					<td>N</td>
				</tr>
				
				<tr>
					<td>GE00002</td>
					<td>김은택</td>
					<td>남자</td>
					<td>개발</td>
					<td>대리</td>
					<td>N</td>
				</tr>
				
				<tr>
					<td>GE00003</td>
					<td>권도윤</td>
					<td>남자</td>
					<td>개발</td>
					<td>대리</td>
					<td>N</td>
				</tr>
				
				<tr>
					<td>GE00004</td>
					<td>황원정</td>
					<td>여자</td>
					<td>개발</td>
					<td>대리</td>
					<td>N</td>
				</tr>
				
				<tr>
					<td>GE00005</td>
					<td>김미정</td>
					<td>여자</td>
					<td>개발</td>
					<td>대리</td>
					<td>N</td>
				</tr>
				
				<tr>
					<td>GE00006</td>
					<td>황우현</td>
					<td>남자</td>
					<td>개발</td>
					<td>대리</td>
					<td>N</td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="text-center">
		<ul class="pagination">
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
		</ul>
	</div>

</body>
</html>