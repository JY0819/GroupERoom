<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/views/layout/treeview/mypage/layout-up.jsp" />
<link rel="stylesheet" type="text/css"
	href="/semi/assets/css/myPage/mypage.css">

<script>
	var jsonData = treeviewJson.myPageJson;
	var nodeName = "주소록";
</script>
<section class="content">

	<div class="content-left">
		<div id="treeview"></div>
	</div>

	<div class="content-right container">
		<div align="center" style="margin-top: 50px; margin-bottom: 100px;">
			<div class="diary">
				<table style="margin-top: 30px;">
					<tr>
						<td>즐겨찾기</td>
						<td rowspan="99" style="width: 250px;">
							<table id="sendMessagePop">
								<tr>
									<td><input type="text" id="sendObject" value="받는 사람"
										readonly></td>
								</tr>
								<tr>
									<td><textarea id="messageArea">보낼 내용</textarea></td>
								</tr>
								<tr>
									<td style="text-align: center;">
										<button class="btn">전송</button>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<button class="btn">취소</button>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td class="sub">관리자</td>
					</tr>
					<tr>
						<td class="sub">가나다(팀장)</td>
					</tr>
					<tr>
						<td>인사회계팀</td>
					</tr>
					<tr>
						<td>마케팅팀</td>
					</tr>
					<tr>
						<td>개발팀</td>
					</tr>
					<tr>
						<td class="sub">가나다</td>
					</tr>
					<tr>
						<td class="sub">카카오(팀장)</td>
					</tr>
					<tr>
						<td class="sub">관리자</td>
					</tr>
					<tr>
						<td class="sub">가나다(팀장)</td>
					</tr>
					<tr>
						<td>디자인팀</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</section>
<jsp:include page="/views/layout/treeview/mypage/layout-down.jsp" />