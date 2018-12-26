<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String msg = (String)request.getAttribute("msg"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
</head>
<body>
	<h1>에러 발생!</h1>
	<h3><%= msg%></h3>
</body>
</html>