<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/views/main/mainPage.jsp" />

<style>
#mainTable {
	position: relative;
	top: 100px;
}

#announce {
	width: 450px;
	position: relative;
}

div.alignleft {
	float: left;
	width: 120px;
	margin-left: 30px;
	margin-top: 20px;
}

div.alignleftText {
	float: left;
	width: 100px;
}

p.imgText {
	font-weight: bold;
	font-size: 15px;
	line-height: 100px;
	text-align: center;
}

.cursor:hover {
	cursor: pointer;
}

.tdPadding {
	border: 2px solid #205181;
}
</style>

<script type="text/javascript">
	function move(e) {
		if (e.id == 'app') {
			location.href="/semi/views/approval/approvalMain.jsp";
		} else if (e.id == 'board') {
			location.href="<%=request.getContextPath()%>/selectList.fr";
		} else if (e.id == 'myP') {
			location.href="<%=request.getContextPath()%>/myPageMain";
		} else if (e.id == 'admin') {
			location.href = "/semi/views/admin/user/userList.jsp";
		}

	}
</script>

<div align="center">
	<table id="mainTable" align="center">
		<tr>
			<!-- 결재 게시판 마이페이지 관리자 -->
			<td class="tdPadding">
				<div onclick="move(this);" id="app" class="cursor">
					<div class="alignleft">
						<i class="far fa-file-alt fa-4x"></i>
					</div>
					<div class="alignleftText">
						<p class="imgText">결재</p>
					</div>
				</div>
			</td>
			<td class="tdPadding">
				<div onclick="move(this);" id="board" class="cursor">
					<div class="alignleft">
						<i class="fas fa-chalkboard fa-4x"></i>
					</div>
					<div class="alignleftText">
						<p class="imgText">게시판</p>
					</div>
				</div>
			</td>
			<td class="tdPadding">
				<div onclick="move(this);" id="myP" class="cursor">
					<div class="alignleft">
						<i class="far fa-user-circle fa-5x"></i>
					</div>
					<div class="alignleftText">
						<p class="imgText">마이페이지</p>
					</div>
				</div>
			</td>
			<td class="tdPadding">
				<div onclick="move(this);" id="admin" class="cursor">
					<div class="alignleft">
						<i class="fas fa-unlock fa-4x"></i>
					</div>
					<div class="alignleftText">
						<p class="imgText">관리자</p>
					</div>
				</div>
			</td>

		</tr>
	</table>
	<!-- 이미지 버튼 밑의 공백 -->
	<br> <br> <br> <br> <br> <br> <br> <br>
	<table>
		<tr>
			<!-- 공지사항 -->
			<td>
				<table id="announce">
					<tr>
						<th style="text-align: left;">공지사항</th>
					</tr>
					<tr>
						<td colspan="3"><hr></td>
					</tr>
					<tr>
						<td><img src="/semi/assets/images/exclamation-mark.png"
							alt="New 이미지" width="20" height="5" /></td>
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
							alt="New 이미지" width="20" height="5" /></td>
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
	<table>
		<tr>
			<!-- 달력 -->
			<td></td>
		</tr>
	</table>
	<div style="height: 80px;"></div>
</div>