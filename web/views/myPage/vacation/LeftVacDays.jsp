<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/views/layout/treeview/mypage/layout-up.jsp" />
<link rel="stylesheet" type="text/css"
	href="/semi/assets/css/myPage/mypage.css">

<script>
	var jsonData = treeviewJson.myPageJson;
	var nodeName = "휴가 관리";
</script>

<section class="content">

	<div class="content-left">
		<div id="treeview"></div>
	</div>

	<div class="content-right container">

		<div align="center" id="alignDiv">
			<table id="useVacList" class="line">
				<tr>
					<th class="line"><p></p></th>
					<th class="line"><p>휴가 구분</p></th>
					<th class="line"><p>휴가 기간</p></th>
					<th class="line"><p>사유</p></th>
					<th class="line"><p>차감 일자</p></th>
				</tr>
				<tr>
					<td class="line"><p>1</p></td>
					<td class="line"><p>연차</p></td>
					<td class="line"><p>2018-01-01 ~ 2018-01-03</p></td>
					<td class="line"><p>나는 쉰다.</p></td>
					<td class="line"><p>3</p></td>
				</tr>
				<tr>
					<td class="line"><p>2</p></td>
					<td class="line"><p>반차</p></td>
					<td class="line"><p>2018-01-04</p></td>
					<td class="line"><p>안녕히계세요! 여러분</p></td>
					<td class="line"><p>0.5</p></td>
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