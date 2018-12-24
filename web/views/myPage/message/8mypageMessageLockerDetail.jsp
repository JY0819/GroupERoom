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
	width: 100%;
	height: 300px;
	text-align: left;
	vertical-align: top;
}
</style>

<div align="center" id="alignDiv">
	<table>
		<tr>
			<td colspan="4">
				<input id="btn1" type="button" value="답장">
				<input id="btn1" type="button" value="삭제">
			</td>
			<td>
				<input id="btn2" type="button" value="돌아가기">
			</td>
		</tr>
		<tr>
			<td>보낸 사람</td>
			<td>가나다(개발 팀장)</td>
			<td>보낸 날짜</td>
			<td>2018/01/01 17:20</td>
		</tr>
		<tr>
			<td>받는 사람</td>
			<td>개발팀</td>
			<td>읽은 날짜</td>
			<td>2018/01/01 17:25</td>
		</tr>
		<tr>
			<td colspan="5">
<textarea id="txtArea" readonly>개발팀 대리로 직원정보가
수정되었습니다.
감사합니다.</textarea>
			</td>
		</tr>
	</table>
</div>