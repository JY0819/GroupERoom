<%@page import="com.semi.admin.user.model.vo.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Employee loginUser = (Employee) request.getSession().getAttribute("loginUser");
	int empid = loginUser.getEmpid();
	String adminAuthority = loginUser.getAdminAuthority();
	String socketLink = "ws://" + request.getLocalAddr() +":" + request.getLocalPort() + request.getContextPath() + "/alarmStart";
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
		location.href="/semi/main";
	}
</script>

<nav class="navigation">
	<div class="nav-left">
		<span class="openside" onclick="openHome()"><i class="fa fa-home custom_icon_size_2_5"></i></span>
		<span class="openside" onclick="openNav()"> <i onclick='openMemo()' class="fas fa-bars"></i></span>
		
		<!--결재 게시판 넘어가게 a태그에 경로 입력함
		css부분 클릭시 글씨 색이나 밑줄 변경 안하게 하려고 a태그 부분 추가함-->

		<span><a href="<%=request.getContextPath()%>/selectMainServlet.sm">Approve</a></span>
		<span><a href="<%=request.getContextPath()%>/selectList.no">Board</a></span>
		<span><a href="<%=request.getContextPath()%>/schedule.sche">Schedule</a></span>
		<span><a href="<%=request.getContextPath()%>/myPageMain">My Page</a></span>
    
    <%--
    	<span><a href="<%=request.getContextPath()%>/selectMainServlet.sm">결재</a></span>
		<span><a href="<%=request.getContextPath()%>/selectList.no">게시판</a></span>
		<span><a href="<%=request.getContextPath()%>/schedule.sche">일정</a></span>
		<span><a href="<%=request.getContextPath()%>/myPageMain">마이페이지</a></span>
	--%>

		<%
			if(adminAuthority.equals("Y")) {
		%>
		
		<span><a href="<%=request.getContextPath()%>/memberList.me">Admin</a></span>
		
		<%
			}
		%>
	</div>
	
	<div class="nav-right">
		<!-- 일단 임시로 로그아웃 a태그 -->
		<span><a href="<%=request.getContextPath()%>/logout.me">LogOut</a></span>
		<i class="far fa-user fa-2x"></i>
		<i class="fas fa-chevron-down"></i>
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
					$.ajax({
						url:"/semi/chkToGetOff",
						data:{empId:empId},
						type:"get",
						success: function(data) {
							if (data == 1) {
								
							}else {
								$(".nav-left").append("<span><a href='<%=request.getContextPath()%>/getOffQR?empid=" + empId + "'>Leave Work</a></span>");
							}
						},error:function(data){ // 데이터 통신에 실패한 것
							console.log("출근 데이터 서버 통신 실패");	
						}
					});
				} else if (data == -1) {
					$(".nav-left").append("<span><a href='<%=request.getContextPath()%>/createQR?empid=" + empId + "'>Attend</a></span>");
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

<script>
	// alarm
	$(function(){
			getConnection();
	})
	function getConnection(){	
		ws = new WebSocket("<%= socketLink %>");
		//서버 시작할 때 동작		
		ws.onopen = function(event){
			
		}
		//서버로부터 메세지를 전달 받을 때 동작하는 메소드
		ws.onmessage = function(event){
			onMessage(event);
		}
		
		//서버에서 에러가 발생할 경우 동작할 메소드
		ws.onerror = function(event){
			onError(event);
		}
			
		//서버와의 연결이 종료될 경우 동작하는 메소드
		ws.onclose = function(event){
			onClose(event);
		}
		
	}
		
	function sendAlarm(msg){
		ws.send(msg);
	}
		
	function onMessage(event){
		var serverMessage = event.data.split(",");
		console.log(event.data);
		// serverMessage[0] 알람 갯수, serverMessage[1] 알람 분류, serverMessage[2] 알람 받을 empid
		if (serverMessage[1] == "msg" && serverMessage[2] == <%=empid%>) {
			$(".nav-left").append("<span><a href='<%=request.getContextPath()%>/chkAlarm?empid=<%=empid%>'>" + serverMessage[0] +"개의 쪽지 알람</a></span>");

		} else if (serverMessage[1] == "board") {
			var countBoard = serverMessage[0].split("|");
			var data = null;
			var count = countBoard.length;
			console.log(countBoard.length);
			for (var i = 0; i < countBoard.length; i++) {
				data = countBoard[1].split("-");
				console.log(data);
				for (var j = 0; j < data.length; j++) {
					if (data[j] == <%=empid%>) {
						count--;
					}
				}
				data = null;
			}
			if (count > 0) {
				$(".nav-left").append("<span><a href='<%=request.getContextPath()%>/chkNotice?empid=<%=empid%>'>" + count +"개의 공지 알람</a></span>");
			}
			
		} else if (serverMessage[1] == "apprEnd") {
			var empInfo = serverMessage[0].split("|");
			var count = 0;
			for (var i = 0; i < empInfo.length; i++) {
				if (empInfo[i] == <%=empid%>) {
					count++
				}
			}
			if (count > 0) {
				$(".nav-left").append("<span><a href='<%=request.getContextPath()%>/chkApprEnd?empid=<%=empid%>'>" + count +"개의 결재선 승인</a></span>");
			}
			
		} else if (serverMessage[1] == "apprIn") {
			var empInfo = serverMessage[0].split("|");
			var count = 0;
			for (var i = 0; i < empInfo.length; i++) {
				if (empInfo[i] == <%=empid%>) {
					count++
				}
			}
			if (count > 0) {
				$(".nav-left").append("<span><a href='<%=request.getContextPath()%>/chkApprLine?empid=<%=empid%>'>" + count +"개의 결재 요청</a></span>");
			}
		} else {
			console.log("해당 알람 없음");
		}
		
	}
	
	function onError(event){
		
	}
	
	function onClose(event){
		
	}
	
	
	$(function(){ // 자기 알람 불러오는 코드
		setTimeout(function() {
			sendAlarm(<%=empid%> + ",msg");
			sendAlarm("0" + ",board");
			sendAlarm("0,apprIn");
			sendAlarm("0,apprEnd");
		}, 3000);
	})
	function isNull(obj) {
		return (typeof obj != "undefined" && obj != null && obj != "null" && obj != "")?true:false;
	}
</script>