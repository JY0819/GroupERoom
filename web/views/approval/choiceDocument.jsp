<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
<style>
	.vacationBtn{
	position: absolute;
	top: 50px;
	text-align: center;
	background-color: #205181;
	color:white;
	border-radius: 10px;
	width: 100px;
	height: 40px;
	top: 100px;
    left: 140px;
    position: absolute;
    font-size: 16px;
	}
	.proofBtn {
	text-align: center;
	background-color: #205181;
	color:white;
	border-radius: 10px;
	width: 100px;
	height: 40px;
	top: 100px;
    left: 260px;
    position: absolute;
    font-size: 16px;
	}
	.workBtn {
	text-align: center;
	background-color: #205181;
	color:white;
	border-radius: 10px;
	width: 100px;
	height: 40px;
	top: 100px;
    left: 380px;
    position: absolute;
    font-size: 16px;
	}
	.btnArea {
		position: relative;
		top: 150px;
		left: 380px;
	}
</style>
</head>
<body>
	<jsp:include page="/views/main/mainPage.jsp"/>
	<div class="btnArea">
		<a href="vacationDocument.jsp"><button class="vacationBtn">휴가신청서</button></a>
		<button class="proofBtn">재직증명서</button>
		<button class="workBtn">업무계획서</button>
	</div>
</body>
</html>