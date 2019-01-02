<%@page import="com.semi.admin.user.model.vo.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Employee loginUser = (Employee) request.getSession().getAttribute("loginUser");
	int empId = loginUser.getEmpid();
%>

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
	function openHome() {
		location.href="/semi/views/main/home.jsp";
	}
	
</script>

<nav class="navigation">
	<div class="nav-left">
		<span class="openside" onclick="openHome()"><i class="fa fa-home custom_icon_size_2_5"></i></span>
		<span class="openside" onclick="openNav()"> <i class="fas fa-bars"></i></span>
		
		<!--결재 게시판 넘어가게 a태그에 경로 입력함
		css부분 클릭시 글씨 색이나 밑줄 변경 안하게 하려고 a태그 부분 추가함-->
		<span><a href="/semi/views/approval/approvalMain.jsp">Approve</a></span>
		<span><a href="<%=request.getContextPath()%>/selectList.no">Board</a></span>
		<span><a href="<%=request.getContextPath()%>/schedule.sche">Schedule</a></span>
		<span><a href="<%=request.getContextPath()%>/myPageMain">MyPage</a></span>
		<span><a href="/semi/views/admin/user/userList.jsp">Admin</a></span>
	</div>
	
	<div class="nav-right">
		<i class="far fa-user fa-2x"></i> <i class="fas fa-chevron-down"></i>
	</div>
</nav>
<input type="hidden" value="<%= empId %>" name="empId">
<script>
	$(function() {
		var empId = $("input[name=empId]").val();
		$.ajax({
			url:"chkToDayAttend",
			data:{empId:empId},
			type:"get",
			success: function(data) {
				if (data == 1) {
					$(".nav-left").append("<span><a href='<%=request.getContextPath()%>/createQR'>퇴근</a></span>");
				} else if (data == -1) {
					$(".nav-left").append("<span><a href='<%=request.getContextPath()%>/createQR'>출근</a></span>");
				} else {
					console.log("오류");
				}
				
			},error:function(data){ // 데이터 통신에 실패한 것
				console.log("출근 데이터 서버 통신 실패");	
			}
		});
	})
</script>