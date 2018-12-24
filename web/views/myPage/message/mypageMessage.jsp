<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/views/layout/treeview/mypage/layout-up.jsp" />
<link rel="stylesheet" type="text/css" href="/semi/assets/css/myPage/message.css">

<script>
	var jsonData = treeviewJson.myPageJson;
	var nodeName = "받은 쪽지함";
</script>

<section class="content">

	<div class="content-left">
		<div id="treeview"></div>
	</div>

	<div class="content-right container">

		<div align="center" id="alignDiv">
			<table>
				<tr>
					<td>
						<div class="alignBox">
							<input class="btn" id="btn1" type="button" value="선택 쪽지 삭제">
						</div>
						<div class="alignBox">
							<input class="btn" id="btn2" type="button" value="선택 쪽지 보관">
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<table id="messageList" class="line">
							<tr>
								<th class="line"><input id="all" type="checkbox"
									name="chkList" value="all"></th>
								<th class="line"><p>보낸 날짜</p></th>
								<th class="line"><p>보낸 사람</p></th>
								<th class="line"><p>받는 사람</p></th>
								<th class="line"><p>내용</p></th>
								<th class="line"><p>읽은 날짜</p></th>
							</tr>
							<tr>
								<td class="line"><input type="checkbox" name="chkList"
									value="1"></td>
								<td class="line"><p>2018-01-01</p></td>
								<td class="line"><p>김둘리 (SI팀장)</p></td>
								<td class="line"><p>개발팀 전체</p></td>
								<td class="line"><p>결재에 덧붙인 내용 체크</p></td>
								<td class="line"><p>2018-01-10</p></td>
							</tr>
							<tr>
								<td class="line"><input type="checkbox" name="chkList"
									value="2"></td>
								<td class="line"><p>2018-01-01</p></td>
								<td class="line"><p>김둘리 (SI팀장)</p></td>
								<td class="line"><p>개발팀 전체</p></td>
								<td class="line"><p>결재에 덧붙인 내용 체크</p></td>
								<td class="line"><p>2018-01-10</p></td>
							</tr>
							<tr>
								<td class="line"><input type="checkbox" name="chkList"
									value="3"></td>
								<td class="line"><p>2018-01-01</p></td>
								<td class="line"><p>김둘리 (SI팀장)</p></td>
								<td class="line"><p>개발팀 전체</p></td>
								<td class="line"><p>결재에 덧붙인 내용 체크</p></td>
								<td class="line"><p>2018-01-10</p></td>
							</tr>
							<tr>
								<td class="line"><input type="checkbox" name="chkList"
									value="4"></td>
								<td class="line"><p>2018-01-01</p></td>
								<td class="line"><p>김둘리 (SI팀장)</p></td>
								<td class="line"><p>개발팀 전체</p></td>
								<td class="line"><p>결재에 덧붙인 내용 체크</p></td>
								<td class="line"><p>2018-01-10</p></td>
							</tr>
							<tr>
								<td class="line"><input type="checkbox" name="chkList"
									value="5"></td>
								<td class="line"><p>2018-01-01</p></td>
								<td class="line"><p>김둘리 (SI팀장)</p></td>
								<td class="line"><p>개발팀 전체</p></td>
								<td class="line"><p>결재에 덧붙인 내용 체크</p></td>
								<td class="line"><p>2018-01-10</p></td>
							</tr>
						</table>
					</td>
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

<script type="text/javascript">
	// 전체선택 쿼리
	$(document).ready(function() {
		$("#all").click(function() {
			if ($("#all").prop("checked")) {
				$("input[name=chkList]").prop("checked", true);
			} else {
				$("input[name=chkList]").prop("checked", false);
			}
		});
	});
</script>
<jsp:include page="/views/layout/treeview/mypage/layout-down.jsp" />