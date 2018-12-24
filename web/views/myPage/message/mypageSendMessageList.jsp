<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/views/layout/treeview/mypage/layout-up.jsp" />
<link rel="stylesheet" type="text/css"
	href="/semi/assets/css/myPage/message.css">

<script>
	var jsonData = treeviewJson.myPageJson;
	var nodeName = "보낸쪽지함";
</script>

<section class="content">

	<div class="content-left">
		<div id="treeview"></div>
	</div>

	<div class="content-right container">

		<div align="center" id="alignDiv">
			<table id="messageList" class="line">
				<tr>
					<th class="line"><p></p></th>
					<th class="line"><p>보낸 날짜</p></th>
					<th class="line"><p>받는 사람</p></th>
					<th class="line"><p>내용</p></th>
					<th class="line"><p>읽은 날짜</p></th>
				</tr>
				<tr>
					<td class="line"><p>1</p></td>
					<td class="line"><p>2018-01-01</p></td>
					<td class="line"><p>개발팀 전체</p></td>
					<td class="line"><p>결재에 덧붙인 내용 체크</p></td>
					<td class="line"><p>2018-01-10</p></td>
				</tr>
				<tr>
					<td class="line"><p>2</p></td>
					<td class="line"><p>2018-01-01</p></td>
					<td class="line"><p>개발팀 전체</p></td>
					<td class="line"><p>결재에 덧붙인 내용 체크</p></td>
					<td class="line"><p>2018-01-10</p></td>
				</tr>
				<tr>
					<td class="line"><p>3</p></td>
					<td class="line"><p>2018-01-01</p></td>
					<td class="line"><p>개발팀 전체</p></td>
					<td class="line"><p>결재에 덧붙인 내용 체크</p></td>
					<td class="line"><p>2018-01-10</p></td>
				</tr>
				<tr>
					<td class="line"><p>4</p></td>
					<td class="line"><p>2018-01-01</p></td>
					<td class="line"><p>개발팀 전체</p></td>
					<td class="line"><p>결재에 덧붙인 내용 체크</p></td>
					<td class="line"><p>2018-01-10</p></td>
				</tr>
				<tr>
					<td class="line"><p>5</p></td>
					<td class="line"><p>2018-01-01</p></td>
					<td class="line"><p>개발팀 전체</p></td>
					<td class="line"><p>결재에 덧붙인 내용 체크</p></td>
					<td class="line"><p>2018-01-10</p></td>
				</tr>
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
	</div>
</section>
<jsp:include page="/views/layout/treeview/mypage/layout-down.jsp" />