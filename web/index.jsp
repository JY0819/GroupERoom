<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
	integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
	crossorigin="anonymous">
<style>
@import url(https://fonts.googleapis.com/css?family=Roboto:300);

body {
	background-color: #205181;
}

.layer {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	text-align: center
}

i {
	color: #FFF;
	vertical-align: middle;
}

a {
	font-family: "Roboto", sans-serif;
	font-weight: bold;
	display: inline-block;
	vertical-align: middle;
	color: white;
	font-size: 2.5em;
	text-decoration: none;
}

.layer .blank {
	display: inline-block;
	width: 0;
	height: 100%;
	vertical-align: middle;
}
</style>
<title>GroupERoom</title>

</head>
<body>
	<div class="layer">
		<a href="views/common/login.jsp">Welcome to GroupERoom</a>&nbsp;&nbsp;
		<i class="fas fa-chevron-right fa-2x"></i> <span class="blank"></span>
	</div>

</body>
</html>