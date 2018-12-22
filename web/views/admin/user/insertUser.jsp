<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1.0">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<jsp:include page="/views/main/mainPage.jsp" />
<title>Insert User Form</title>

<style>
/* p, h1, form, button {
	border: 0;
	margin: 0;
	padding: 0;
} */
.insertForm {
	width: 500px;
	height: 500px;
	padding: 14px;
	background: lightblue;
	color: #205181;
	margin-left: auto;
	margin-right: auto;
	margin-top: 50px;
}

.insertForm h1 {
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 8px;
	font-family: nanumgothic, dotum;
	text-align: center;
}

.insertForm label {
	display: block;
	font-weight: bold;
	text-align: right;
	width: 140px;
	float: left;
	font-family: tahoma;
	padding-top: 7px;
}

.insertForm input {
	float: left;
	font-size: 12px;
	padding: 4px 2px;
	border: solid 1px #aacfe4;
	width: 200px;
	margin: 2px 0 20px 10px;
}

.insertForm button {
	width: 100px;
	height: 45px;
	background-color: #205181;
	border: none;
	color: #FFFFFF;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	margin: 5px;
	cursor: pointer;
	font-family: tahoma;
	font-weight: bold;
	line-height: 10px;
	clear: both;
}
</style>

</head>

<body>
	<div class="insertForm">
		<form id="form" action="" method="post">
			<h1>사원 등록</h1>
			<hr>
			<label>사원번호</label> <input type="text" name="userId" id="userId" />
			<label>이름</label> <input type="text" name="name" id="name" />
			<label>이메일</label> <input type="text" name="email" id="email" /> 
			<label>비밀번호</label> <input type="text" name="password" id="password" />
			<label>비밀번호 확인</label> <input type="text" name="password" id="password" />

			<button type="submit">등록</button>
		</form>
	</div>
</body>