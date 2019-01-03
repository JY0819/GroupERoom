<%@page import="com.semi.admin.user.model.vo.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Employee loginUser = (Employee) request.getSession().getAttribute("loginUser");
	int empid = loginUser.getEmpid();
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
		<span class="openside" onclick="openNav()"> <i onclick='openMemo()' class="fas fa-bars"></i></span>
		
		<!--결재 게시판 넘어가게 a태그에 경로 입력함
		css부분 클릭시 글씨 색이나 밑줄 변경 안하게 하려고 a태그 부분 추가함-->
		<span><a href="/semi/views/approval/approvalMain.jsp">Approve</a></span>
		<span><a href="<%=request.getContextPath()%>/selectList.no">Board</a></span>
		<span><a href="<%=request.getContextPath()%>/schedule.sche">Schedule</a></span>
		<span><a href="<%=request.getContextPath()%>/myPageMain">MyPage</a></span>
		<span><a href="<%=request.getContextPath()%>/memberList.me">Admin</a></span>
		
	</div>
	
	<div class="nav-right">
		<i class="far fa-user fa-2x"></i> <i class="fas fa-chevron-down"></i>
	</div>
</nav>
<input type="hidden" value="<%= empid %>" name="empId">
<script>
	$(function() {
		var empId = $("input[name=empId]").val();
		console.log(empId);
		$.ajax({
			url:"/semi/chkToDayAttend",
			data:{empId:empId},
			type:"get",
			success: function(data) {
				console.log("성공");
				if (data == 1) {
					$(".nav-left").append("<span><a href='<%=request.getContextPath()%>/createQR'>퇴근</a></span>");
				} else if (data == -1) {
					$(".nav-left").append("<span><a href='<%=request.getContextPath()%>/createQR?empid=" + empId + "'>출근</a></span>");
				} else {
					console.log("오류");
				}
				
			},error:function(data){ // 데이터 통신에 실패한 것
				console.log("출근 데이터 서버 통신 실패");	
			}
		});
	});
	</script>
	
	<script> //메모 불러오기
	function openMemo(){
		var memoEmpId=<%=loginUser.getEmpid()%>;
		console.log("empid:"+memoEmpId)
		console.log("메모");
		$.ajax({
			url:"/semi/select.memo",
			type:"post",
			data:{empId:memoEmpId},
			success:function(data){
				console.log("메모 ajax 전송 성공");
				console.log("result:"+data);
				
				var $memoDiv=$("#memoDiv");
				var $memoArea=$("#memoArea");
				$memoArea.html(data.memoContents);
				
			},
			error:function(data){
				console.log("메모 ajax 전송 실패");
			},
			complete:function(data){
				console.log("메모 ajax");
			}
		});
	}
	$(function(){
	$("#memoArea").focusout(function(){
		var memoContents=$("#memoArea").val();
		var empId=<%=empid%>;
		console.log(memoContents);
		$.ajax({
			url:"/semi/insert.memo",
			type:"post",
			data:{memoContents:memoContents, empId:empId},
			success:function(data){
				console.log("메모 저장 ajax 통신 성공");
			},
			error:function(data){
				console.log("메모 저장 ajax 통신 실패");
			},
			complete:function(data){
				console.log("메모 저장 ajax");
			}
		});
	});
	});
	
	
</script>