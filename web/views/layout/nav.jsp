<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style type="text/css">
	.custom_icon_size_2_5{font-size: 2.5rem;}
</style>

<script>
	function openNav() {
		document.getElementById('sidemenu').style.width = '300px';
	}
	function closeNav() {
		document.getElementById('sidemenu').style.width = '0';
	}
</script>

<nav class="navigation">
	<div class="nav-left">
		<i class="fa fa-home custom_icon_size_2_5"></i>
		<span class="openside" onclick="openNav()"> <i class="fas fa-bars"></i></span>
		
		<span><a>Approve</a></span>
		<span><a>Board</a></span>
		<span><a>Schedule</a></span>
		<span><a>MyPage</a></span>
		<span><a>Admin</a></span>
		
		
	</div>
	
	<div class="nav-right">
		<i class="far fa-user fa-2x"></i> <i class="fas fa-chevron-down"></i>
	</div>
</nav>