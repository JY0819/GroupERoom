<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String msg = (String) session.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Success</title>
<style>
a {
	text-decoration: none;
}
</style>
</head>
<body>
	<h1><%=msg%></h1>
	<a href="/semi/index.jsp">메인으로 이동</a>
</body>
</html>