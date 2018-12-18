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
	padding: 14px;
	background: #205181;
	color: #FFF;
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
	/* clear: both;
	margin-left: 150px;
	width: 125px;
	height: 31px;
	text-align: center;
	line-height: 31px;
	background-color: #000;
	color: #FFFFFF;
	font-size: 11px;
	font-weight: bold;
	font-family: tahoma; */
	
    width:100px;
    background-color: #f8585b;
    border: none;
    color:#fff;
    padding: 15px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 4px;
    cursor: pointer;

}



}
</style>

</head>

<body>
<!-- 	<div id="stylized" class="insertForm"> -->
	<div class="insertForm">
		<form id="form" action="" method="post">
			<h1>사원 등록</h1>
			<hr>	
			<label>이름</label>
				<input type="text" name="name" id="name" /> 
			<label>이메일</label>
				<input type="text" name="email" id="email" /> 
			<label>비밀번호</label>
				<input type="text" name="password" id="password" />
	
			<button type="submit">등록</button>
		</form>
	</div>
</body>