<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.semi.admin.user.model.vo.*"%>

<%
	Employee loginUser = (Employee) request.getSession().getAttribute("loginUser");
	int empid = loginUser.getEmpid();
	String adminAuthority = loginUser.getAdminAuthority();
	String socketLink = "ws://" + request.getLocalAddr() +":" + request.getLocalPort() + request.getContextPath() + "/alarmStart";
%>

<html>
<head>
<meta charset="UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

	<!-- icon -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
	
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<!-- Bootstrap Core CSS -->
    <link href="/semi/resources/static/thema/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/semi/resources/static/thema/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/semi/resources/static/thema/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/semi/resources/static/thema/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
	<title>GroupERoom</title>
</head>

<script type="text/javascript">
	var loginUserInfo = {
				emp_id 	    : "<%=loginUser.getEmpid()%>" == "null" ? "" : "<%=loginUser.getEmpid()%>"
			   ,emp_name 	: "<%=loginUser.getEmpName()%>" == "null" ? "" : "<%=loginUser.getEmpName()%>"
			   ,dept_name	: "<%=loginUser.getDeptName()%>" == "null" ? "" : "<%=loginUser.getDeptName()%>"
			   ,position_name : "<%=loginUser.getPositionName()%>" == "null" ? "" : "<%=loginUser.getPositionName()%>"
			   ,photo_id	: "<%=loginUser.getPhotoId()%>" == "null" ? "" : "<%=loginUser.getPhotoId()%>"
			   ,socket_link : "<%=socketLink%>" == "null" ? "" : "<%=socketLink%>"
	};
	
	$(function(){
		var adminAuthority = "<%=adminAuthority%>" || "";
		
		if(adminAuthority !== "Y"){
			$(".adminYNClass").remove();
		}
		
	})
</script>

<body>
	<div id="wrapper">
		<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
			<jsp:include page="/views/layout/nav.jsp" />
			<jsp:include page="/views/layout/sidebar.jsp" />
		</nav>

		<div id="page-wrapper">
	