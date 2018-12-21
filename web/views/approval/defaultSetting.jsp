<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
<style>
	.titleArea {
		position: relative;
		top: 30px;
	}
	.titleArea .title {
		position: relative;
		left: 120px;
	}
	.titleArea .line {
		width: 70em;
	}
	.titleArea tbody tr:eq(0) td:eq(0) {
		position: relative;
		left: 50px;
	}
	.settingTable {
		position: relative;
		left: 130px;
	}
	.saveBtn {
		text-align: center;
		background-color: #205181;
		color:white;
		border-radius: 10px;
		width: 100px;
		height: 40px;
	    font-size: 16px;
   	    border: 0;
	    outline: 0;
	    margin-left: auto;
	    margin-right: auto;
	}
	/* top:100px; left:50px; position; relative; */
</style>
</head>
<body>
	<jsp:include page ="/views/main/mainPage.jsp"/>
	<div class="titleArea">
		<h1 class="title">기본설정</h1>
		<hr class="line">
	
		<table class="settingTable">
			<tr>
				<td><h3>현재 비밀번호</h3></td>
				<td><input type="text" size="30px" placeholder="현재 전자결재 비밀번호를 입력하세요."></td>
			</tr>
			<tr>
				<td><h3>새 비밀번호</h3></td>
				<td><input type="text" size="32px" placeholder="변경할 전자결재 비밀번호를 입력하세요."></td>
			</tr>
			<tr>
				<td><h3>확인</h3></td>
				<td><input type="text" size="32px" placeholder="변경할 전자결재 비밀번호를 입력하세요."></td>
			</tr>
			<tr>
				<td><h3>사용여부</h3></td>
				<td><input type="radio" name="choice"><label>사용함</label>&nbsp;&nbsp;<input type="radio" name="choice"><label>사용함</label></td>
			</tr>
			<tr>
				<td colspan="2"><button class="saveBtn">저장</button></td>
			</tr>
		</table>
	</div>
</body>
</html>