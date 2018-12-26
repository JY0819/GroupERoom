<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/views/main/mainPage.jsp" />

<link rel="stylesheet" type="text/css" href="/semi/assets/css/mainPage.css">
<div class="top">
	<h1>　</h1>
</div>
<div class="main_container">
	<table id="mainTable" style="z-index:-1;">
		<tr>
			<!-- 결재 게시판 마이페이지 관리자 -->
			<td class="tdPadding">
				<div class="alignleft">
					<img src="/semi/assets/images/img.JPG" alt="게시판 이미지" width="120"
						height="120" />
				</div>
				<div class="alignleftText">
					<p class="imgText">결재</p>
				</div>
			</td>
			<td class="tdPadding">
				<div class="alignleft">
					<img src="/semi/assets/images/img.JPG" alt="게시판 이미지" width="120"
						height="120" />
				</div>
				<div class="alignleftText">
					<p class="imgText">게시판</p>
				</div>
				
			</td>
			<td class="tdPadding">
				<div onclick="move();">
					<div class="alignleft">
						<img src="/semi/assets/images/img.JPG" alt="마이페이지 이미지" width="120"
							height="120" />
					</div>
					<div class="alignleftText">
						<p class="imgText">마이페이지</p>
					</div>
				</div> <script type="text/javascript">
					function move() {
						location.href = "views/myPage/1mypageMain.jsp";
					}
				</script>
			</td>
			<td class="tdPadding">
				<div class="alignleft">
					<img src="/semi/assets/images/img.JPG" alt="관리자 이미지" width="120"
						height="120" />
				</div>
				<div class="alignleftText">
					<p class="imgText">관리자</p>
				</div>
			</td>

		</tr>
	</table>
	<!-- 이미지 버튼 밑의 공백 -->
	<br> <br> <br> <br> <br>
	<table>
		<tr>
			<!-- 공지사항 -->
			<td>
				<table id="announce" style="z-index:-1;">
					<tr>
						<th style="text-align: left;">공지사항</th>
					</tr>
					<tr>
						<td colspan="3"><hr></td>
					</tr>
					<tr>
						<td><img src="/semi/assets/images/exclamation-mark.png"
							alt="New 이미지" width="40" height="10" /></td>
						<td>
							<p style="text-align: left;">문서 결재 관련 공지사항입니다.</p>
						</td>
						<td>
							<p style="text-align: right;">2018.11.30</p>
						</td>
					</tr>
					<tr>
						<td colspan="3"><hr></td>
					</tr>
					<tr>
						<td><img src="/semi/assets/images/exclamation-mark.png"
							alt="New 이미지" width="40" height="10" /></td>
						<td>
							<p style="text-align: left;">문서 결재 관련 공지사항입니다.</p>
						</td>
						<td>
							<p style="text-align: right;">2018.11.30</p>
						</td>
					</tr>
					<tr>
						<td colspan="3"><hr></td>
					</tr>
					<tr>
						<td colspan="2">
							<p style="text-align: left;">문서 결재 관련 공지사항입니다.</p>
						</td>
						<td>
							<p style="text-align: right;">2018.11.30</p>
						</td>
					</tr>
					<tr>
						<td colspan="3"><hr></td>
					</tr>
					<tr>
						<td colspan="2">
							<p style="text-align: left;">문서 결재 관련 공지사항입니다.</p>
						</td>
						<td>
							<p style="text-align: right;">2018.11.30</p>
						</td>
					</tr>
					<tr>
						<td colspan="3"><hr></td>
					</tr>

				</table>

			</td>
		</tr>
	</table>
	<table style="margin-bottom: 100px;" style="z-index:-1;">
		<tr>
			<!-- 달력 -->
			<td></td>
		</tr>
	</table>
</div>