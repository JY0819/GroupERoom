<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/views/main/mainPage.jsp" />

<style>
#mainTable{
	position: relative; 
	left: 10%;
	top: 50px;
}
#announce{
	width: 500px;
	position: relative;
	left: 55%;
}
div.alignleft{
	float: left;
	width: 120px;
}
div.alignleftText{
	float: left;
	width: 100px;
}
p.imgText{
	font-weight: bold;
	font-size: 15px;
	line-height: 100px;
	text-align: center;
}
</style>
<div>
	<table id="mainTable">
		<tr><!-- 결재 게시판 마이페이지 관리자 -->
			<td class="tdPadding">
				<div class="alignleft"><img src="views/main/img.JPG" alt="게시판 이미지" width="120" height="120"/></div>
				<div class="alignleftText"><p class="imgText">결재</p></div>
			</td>
			<td class="tdPadding">
				<div class="alignleft"><img src="views/main/img.JPG" alt="게시판 이미지" width="120" height="120"/></div>
				<div class="alignleftText"><p class="imgText">게시판</p></div>
			</td>
			<td class="tdPadding">
				<div onclick="move();">
				<div class="alignleft"><img src="views/main/img.JPG" alt="마이페이지 이미지" width="120" height="120"/></div>
				<div class="alignleftText"><p class="imgText">마이페이지</p></div>
				</div>
				<script type="text/javascript">
					function move() {
						location.href="views/myPage/1mypageMain.jsp";
					}
				</script>
			</td>
			<td class="tdPadding">
				<div class="alignleft"><img src="views/main/img.JPG" alt="관리자 이미지" width="120" height="120"/></div>
				<div class="alignleftText"><p class="imgText">관리자</p></div>
			</td>
			
		</tr>
	</table>
	<!-- 이미지 버튼 밑의 공백 -->
	<br><br><br><br><br>
	<table>
		<tr><!-- 공지사항 -->
			<td>
				<table id="announce">
					<tr>
						<th style="text-align: left;">공지사항</th>
					</tr>
					<tr><td colspan="3"><hr></td></tr>
					<tr>
						<td>
							<img src="views/main/img.JPG" alt="New 이미지" width="40" height="10"/>
						</td>
						<td>
							<p style="text-align: left;">문서 결재 관련 공지사항입니다.</p>
						</td>
						<td>
							<p style="text-align: right;">2018.11.30</p>
						</td>
					</tr>
					<tr><td colspan="3"><hr></td></tr>
					<tr>
						<td>
							<img src="views/main/img.JPG" alt="New 이미지" width="40" height="10"/>
						</td>
						<td>
							<p style="text-align: left;">문서 결재 관련 공지사항입니다.</p>
						</td>
						<td>
							<p style="text-align: right;">2018.11.30</p>
						</td>
					</tr>
					<tr><td colspan="3"><hr></td></tr>
					<tr>
						<td colspan="2">
							<p style="text-align: left;">문서 결재 관련 공지사항입니다.</p>
						</td>
						<td>
							<p style="text-align: right;">2018.11.30</p>
						</td>
					</tr>
					<tr><td colspan="3"><hr></td></tr>
					<tr>
						<td colspan="2">
							<p style="text-align: left;">문서 결재 관련 공지사항입니다.</p>
						</td>
						<td>
							<p style="text-align: right;">2018.11.30</p>
						</td>
					</tr>
					<tr><td colspan="3"><hr></td></tr>
					
				</table>
				
				
			</td>
		</tr>
	</table>
	<table style="margin-bottom: 100px;">
		<tr><!-- 달력 -->
			<td>
			</td>
		</tr>
	</table>
</div>