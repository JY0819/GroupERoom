<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/views/layout/treeview/approval/layout-up.jsp" />
<link rel="stylesheet" type="text/css"
	href="/semi/assets/css/approval/taskBox.css">

<script>
	var jsonData = treeviewJson.approvalJson;
	var nodeName = "문서 진행 현황";
</script>
<section class="content">
	<div class="content-left">
		<div id="treeview"></div>
	</div>
	<div class="content-right container">
		<div>
			<table>
				<thead>
					<tr>
						<th>번 호</th>
						<th>작 성 자</th>
						<th>부 서</th>
						<th>문 서 번 호</th>
						<th>의 견</th>
						<th>작 성 날 짜</th>
						<th>처 리 현 황</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
			</table>
			<div class="btnArea">
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
	</div>
</section>

<jsp:include page="/views/layout/treeview/approval/layout-down.jsp" />