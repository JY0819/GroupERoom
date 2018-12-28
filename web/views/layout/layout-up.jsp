<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.semi.admin.user.model.vo.*"%>
<%-- <%Employee loginUser=(Employee)session.getAttribute("loginUser"); %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
<link rel="stylesheet" type="text/css" href="/semi/resources/static/treeview/bootstrap.css">
<link rel="stylesheet" type="text/css" href="/semi/assets/css/mainPage.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style type="text/css">
	header {
		height: 70px;
		width: 100%;
		position: absolute;
		top: 0;
	}
	
	table {
		position: relative;
	}
</style>
	<title>GroupERoom</title>
</head>

<body>
	<header>
		<jsp:include page="/views/layout/nav.jsp" />
	</header>
	
	<jsp:include page="/views/layout/sidebar.jsp" />
