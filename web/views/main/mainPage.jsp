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

	<div id="sidemenu" class="sidebar">
		<a href="#" class="closebtn" onclick='closeNav()'> <i
			class="fa fa-angle-double-left fa-5" aria-hidden="true"></i>
		</a> <a href="#">회원정보</a> <a href="#">메모</a>
	</div>

	<nav>
		<div class="fixedmenu">
			<ul>
				<span class="openside" onclick="openNav()"> <i
					class="fas fa-bars"></i></span>
				<li>Approve</li>
				<li>Board</li>
				<li>Schedule</li>
				<li>MyPage</li>
			</ul>
		</div>
	</nav>

	<div class="mainwrapper"></div>
</body>

<script>
	function openNav() {
		document.getElementById('sidemenu').style.width = '300px';
	}
	function closeNav() {
		document.getElementById('sidemenu').style.width = '0';
	}
	
	
	$(document).ready(function(){
		 
	    var topBar = $(".fixedmenu").offset();
	 
	    $(window).scroll(function(){
	        
	        var docScrollY = $(document).scrollTop()
	        var barThis = $(".fixedmenu")
	        var fixNext = $(".mainwrapper")
	 
	        if( docScrollY > topBar.top ) {
	            barThis.addClass("nav_fix");
	            fixNext.addClass("pd_top_80");
	        }else{
	            barThis.removeClass("nav_fix");
	            fixNext.removeClass("pd_top_80");
	        }
	 
	    });
	 
	})


</script>



</html>