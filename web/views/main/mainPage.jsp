<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
	integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="/semi/assets/css/mainPage.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"
	integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	crossorigin="anonymous"></script>
<title>GroupERoom</title>
</head>
<body>
	<header>
		<nav class="navigation">
			<div>
				<ul>
					<i class="fa fa-home"></i>
					<span class="openside" onclick="openNav()"> <i
						class="fas fa-bars"></i></span>
					<li>Approve</li>
					<li>Board</li>
					<li>Schedule</li>
					<li>MyPage</li>
				</ul>
				<div class="icon_main">
					<i class="far fa-user fa-2x"></i> <i class="fas fa-chevron-down"></i>
				</div>
			</div>
		</nav>
	</header>

	<div id="sidemenu" class="sidebar">
		<a href="#" class="closebtn" onclick='closeNav()'> <i
			class="fa fa-angle-double-left fa-5" aria-hidden="true"></i>
		</a> <a href="#">회원정보</a> <a href="#">메모</a>
	</div>


	<div class="mainwrapper"></div>

	<footer>
		<div>
			<p>Copyright 2018.GroupERoom All Rights Reserved</p>
		</div>
	</footer>

</body>

<script>
	function openNav() {
		document.getElementById('sidemenu').style.width = '300px';
// 		document.getElementById('sidemenu').style.display = "block";
	}
	function closeNav() {
		document.getElementById('sidemenu').style.width = '0';
// 		document.getElementById('sidemenu').style.display = "none";
	}
</script>



</html>