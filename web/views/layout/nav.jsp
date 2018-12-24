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
		
		<!--결재 게시판 넘어가게 a태그에 경로 입력함
		css부분 클릭시 글씨 색이나 밑줄 변경 안하게 하려고 a태그 부분 추가함-->
		<span><a href="views/approval/approvalMain.jsp">Approve</a></span>
		<span><a>Board</a></span>
		<span><a>Schedule</a></span>
		<span><a>MyPage</a></span>
		<span><a href="/semi/admin/management/user/addUser">Admin</a></span>
		
		
	</div>
	
	<div class="nav-right">
		<i class="far fa-user fa-2x"></i> <i class="fas fa-chevron-down"></i>
	</div>
</nav>