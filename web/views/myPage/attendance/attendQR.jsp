<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String name = (String)request.getAttribute("fileName");
%>

<jsp:include page="/views/layout/treeview/mypage/layout-up.jsp" />

<style>
.btn{
	text-align: center;
	background-color: #205181;
	padding: 5px;
	color:white;
	border-radius: 10px;
	width: 120px;
	height: 40px;
}
</style>

<div align="center">
	<br> <br> <br> <br> <br>
	<h3>해당 QR코드를 휴대폰으로 스캔하여 출근 버튼을 눌러주세요!</h1>
	<img src="/semi/QRThumbnail/<%= name %>.png" width="200px" height="200px">
	<br>
	<input type="button" class="btn" onclick="location.href='<%=request.getContextPath()%>/chkAttend'" value="확인하기 !" size="5">
</div>

<jsp:include page="/views/layout/treeview/mypage/layout-down.jsp" />