<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.semi.admin.user.model.vo.Employee"%>
<%
	Employee loginUser = (Employee) session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="bootstrap-msg-0.4.0.min.css">
<script src="bootstrap-msg-0.4.0.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />

<style>
/* @import url(https://fonts.googleapis.com/css?family=Roboto:300); */
.login-page {
	width: 400px;
	padding: 12% 0 0;
	margin: auto;
}

.form {
	position: relative;
	z-index: 1;
	background: #FFFFFF;
	max-width: 360px;
	margin: 0 auto 100px;
	padding: 45px;
	text-align: center;
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0
		rgba(0, 0, 0, 0.24);
}

.form input {
	/*    font-family: "Roboto", sans-serif; */
	outline: 0;
	background: #f2f2f2;
	width: 100%;
	border: 0;
	margin: 0 0 15px;
	padding: 15px;
	box-sizing: border-box;
	font-size: 15px;
}

.form #login {
	/*    font-family: "Roboto", sans-serif; */
	background: #205181;
	width: 100%;
	border: 0;
	padding: 15px;
	color: #FFFFFF;
	font-size: 15px;
	cursor: pointer;
}

.form #login:hover, .form #login:active, .form #login:focus {
	background: #FFFFFF;
	border: 1px solid #205181;
	color: #205181;
}

body {
	background-color: #205181;
}
</style>
<title>GroupERoom</title>
</head>

<body>

	<div class="login-page">
		<div class="form">
			<form class="loginForm"
				action="<%=request.getContextPath()%>/login.me" method="post">
				<input type="text" name="userId" placeholder="userId">
				<input type="password" class="form-control" name="userPwd" placeholder="password" onkeypress="caps_lock(event)">
				<input type="submit" id="login" value="LOGIN" onclick="login();">
			</form>
		</div>
	</div>





	<script>
		function login() {
			$("#loginForm").submit();
		}
	</script>
</body>
</html>