<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/views/main/mainPage.jsp" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

<style>
#btn{
	text-align: center;
	background-color: #205181;
	padding: 5px;
	color:white;
	border-radius: 10px;
	width: 120px;
	height: 40px;
	margin-top: 15px;
}
.infoName{
	padding-left: 10px;
	padding-right: 15px;
	padding-top: 15px;
}
.setInfo{
	padding-left: 15px;
	padding-right: 5px;
	padding-top: 15px;
}
</style>

<div align="center" style="margin-top: 20px; margin-bottom: 100px;">
<div class="myInfo">
	<table style="margin-top: 10px;">
		<tr>
			<td colspan="2" style="text-align: center;">
				<div>
					<img src="../img.JPG" alt="게시판 이미지" width="120" height="120"/>
				</div>
			</td>
		</tr>
		<tr>
			<td class="infoName">
				<a>사원번호</a>
			</td>
			<td class="setInfo">
				<a>1234567</a>
			</td>
		</tr>
		<tr>
			<td class="infoName">
				<a>이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</a>
			</td>
			<td class="setInfo">
				<a>kim</a>
			</td>
		</tr>
		<tr>
			<td class="infoName">
				<a>성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;별</a>
			</td>
			<td class="setInfo">
				<a>남</a>
			</td>
		</tr>
		<tr>
			<td class="infoName">
				<a>생년월일</a>
			</td>
			<td class="setInfo">
				<a>1990.01.01</a>
			</td>
		</tr>
		<tr>
			<td class="infoName">
				<a>비밀번호</a>
			</td>
			<td class="setInfo">
				<input type="password" placeholder="비밀번호" style="width: 200px;">
			</td>
		</tr>
		<tr>
			<td class="infoName">
				<a>비밀번호 확인</a>
			</td>
			<td class="setInfo">
				<input type="password" placeholder="비밀번호 확인" style="width: 200px;">
			</td>
		</tr>
		<tr>
			<td class="infoName">
				<a>연&nbsp;&nbsp;락&nbsp;&nbsp;처</a>
			</td>
			<td class="setInfo">
				<input type="text" value="010-0000-0000" style="width: 200px;">
			</td>
		</tr>
		<tr>
			<td class="infoName">
				<a>주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</a>
			</td>
			<td class="setInfo">
				<input type="text" value="1234567" style="width: 200px;">
			</td>
		</tr>
		<tr>
			<td class="infoName">
				<a>소&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;속</a>
			</td>
			<td class="setInfo">
				<a>개발팀</a>
			</td>
		</tr>
		<tr>
			<td class="infoName">
				<a>직&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;책</a>
			</td>
			<td class="setInfo">
				<a>대리</a>
			</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: center;">
				<input id="btn" type="button" value="저장하기">
			</td>
		</tr>
	</table>
</div>
</div>
