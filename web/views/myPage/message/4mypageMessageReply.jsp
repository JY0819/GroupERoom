<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/views/main/mainPage.jsp" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

<style>
#alignDiv{
	margin-top: 80px;
	margin-bottom: 100px;
}
#alignDiv > table > tbody > tr > td{
	padding: 10px;
}
#btn1{
	text-align: center;
	background-color: #205181;
	padding: 5px;
	color:white;
	border-radius: 10px;
	width: 60px;
	height: 40px;
	margin-left: 5px;
	margin-right: 5px;
	float: left;
}
#btn2{
	text-align: center;
	background-color: #205181;
	padding: 5px;
	color:white;
	border-radius: 10px;
	width: 100px;
	height: 40px;
	margin-left: 5px;
	margin-right: 5px;
	float: right
}
#txtArea{
	width: 565px;
	height: 300px;
	text-align: left;
	vertical-align: top;
}
</style>

<div align="center" id="alignDiv">
	<table>
		<tr>
			<td colspan="4">
				<input id="btn1" type="button" value="발송">
			</td>

			<td colspan="4">
				<input id="btn2" type="button" value="돌아가기">
			</td>
		</tr>
		<tr>
			<td>받는 사람</td>
			<td>홍길동(마케팅팀 대리)&nbsp;&nbsp;&nbsp;<a href="diary.html" onclick="window.open(this.href, '주소록','width=300, height=400, menubar=no, status=no, toolbar=no, location=no, scrollbars=no, resizable=no, fullscreen=no');return false;" target="_blank" style="color: blue;"><i class="far fa-plus-square"></i></a></td>
		</tr>
		<tr>
			<td colspan="8">
<textarea id="txtArea" readonly>답장 페이지
내용을 입력해주세요.</textarea>
			</td>
		</tr>
	</table>
</div>