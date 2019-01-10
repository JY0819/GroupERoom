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
	function logOut(){
		location.href="<%=request.getContextPath()%>/logout.me";
	}
</script>

<style>
.dropdown-menu > li > a:hover, .dropdown-menu > li > a:focus {
    color: rgb(0, 154, 200) !important;
    text-decoration: none !important;
    transition: 0.5s ease-in-out !important;
    background: rgb(32, 81, 129) !important;
}
.dropdown-menu > li > div > a:hover, .dropdown-menu > li > div > a:focus {
    color: rgb(0, 154, 200) !important;
    text-decoration: none !important;
    transition: 0.5s ease-in-out !important;
    background: rgb(32, 81, 129) !important;
}
.dropdown-menu > li {
    margin-left: 0;
    margin-right: 0;
}
.dropdown-menu > li > div > a {
    display: block;
    padding: auto;
    white-space: nowrap;
    line-height: 1.42857143;
    border-top: 1px solid #ddd;
    width: 50%;
   	padding-bottom: 5px;
   	padding-top: 5px;
	text-decoration: none;
	text-align: center;
}
.fontStyle{
	text-align: right;
	font-size: 17px !important;
   	color: white !important;
   	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif !important;
}
#alarmCountAtagDiv{
	border-radius: 100%;
	background: red;
	position: absolute;
	left: auto;
	right: 70px;
	top: 10px;
	width: 19px;
	height: 19px;
}
#alarmCountAtag{
	width: 100% !important;
	height: 100% !important;
	font-size: 8.5px !important;
	font-weight: bold;
	color: white !important;
	line-height: 20px;
}
</style>

<nav class="navigation">
	<div class="nav-left">
		<span class="openside" onclick="openHome()"><i class="fa fa-home custom_icon_size_2_5"></i></span>
		<span class="openside" onclick="openNav()"> <i onclick='openMemo()' class="fas fa-bars"></i></span>
		
		<!--결재 게시판 넘어가게 a태그에 경로 입력함
		css부분 클릭시 글씨 색이나 밑줄 변경 안하게 하려고 a태그 부분 추가함-->

		<span><a href="<%=request.getContextPath()%>/selectMainServlet.sm">Approve</a></span>
		<span><a href="<%=request.getContextPath()%>/selectList.no">Board</a></span>
		<span><a href="<%=request.getContextPath()%>/schedule.sche">Schedule</a></span>
		<span><a href="<%=request.getContextPath()%>/myPageMain">MyPage</a></span>
    
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
		
		<div id="alarmCountAtagDiv" data-toggle="dropdown" style="cursor: pointer; display: none;" align="center"><a id="alarmCountAtag">1</a></div>
		
		<i data-toggle="dropdown" class="far fa-user fa-2x" style="cursor: pointer;"></i>
		
		<a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="true" style="color: white;"><i class="fas fa-chevron-down"></i></a>
		<ul class="dropdown-menu" style="margin-bottom: 0px; padding-bottom: 0px; position: absolute; width: 250px; left: auto; right: 5px; top: 65px; float: right; background: rgb(32, 81, 129); padding-left: 0;, padding-right: 0; box-shadow: 5px 5px 5px #606060">
			<li><a href="<%=request.getContextPath()%>/selectList.no" class="fontStyle" id="NoticeAlarm">0 of New Notice</a></li>
			<li><a href="<%=request.getContextPath()%>/myPageMessage" class="fontStyle" id="MsgAlarm">0 of New Message</a></li>
			<li><a href="<%=request.getContextPath()%>/selectSubmitDocumentServlet.sds" class="fontStyle" id="ApprAlarm">0 of New Approval</a></li>
			<li><a href="<%=request.getContextPath()%>/selectStatusServlet.sss" class="fontStyle" id="ApprEndAlarm">0 of New Approval End</a></li>
			<li style="margin-bottom: 0px; padding-bottom: 0px;">
				<div>
					<a class="fontStyle" href="<%=request.getContextPath()%>/myPageMain" style="border-right: 1px solid #ddd; float: left;">MyPage</a>
					<a class="fontStyle"  onclick="logOut()" style="float: right;">LogOut</a>
				</div>
			</li>
		</ul>

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
		var photoId=<%=loginUser.getPhotoId()%>;
		<%-- 
		var empName=<%=loginUser.getEmpName()%>;
		var empDept=<%=loginUser.getDeptName()%>;
		var empPosition=<%=loginUser.getPositionName()%>; --%>
		console.log("empid:"+memoEmpId)
		console.log("메모");
		$.ajax({
			url:"/semi/select.memo",
			type:"post",
			data:{empId:memoEmpId,photoId:photoId},
			success:function(data){
				console.log("메모 ajax 전송 성공");
				
				//메모area 
				var $memoDiv=$("#memoDiv");
				var $memoArea=$("#memoArea");
				$memoArea.html(data.memoContents);
				
				//사원정보 area
				var $empPhoto=$("#sideuserPhoto");
				//사원 이미지 없으면 기본 이미지로
				if(<%=loginUser.getPhotoId()%>==0){
					$empPhoto.css("background-image","url('assets/images/upload_EmpImg/ProfileImg-None.png')");
				}else{
					$empPhoto.css("background-image","url('assets/images/upload_EmpImg/"+data.imgPath+"')");
				}
				var $empName=$("#sideEmpName");
				var $empDept=$("#sideEmpDept");
				var $empPosition=$("#sideEmpPosition");
				$empName.html("<%=loginUser.getEmpName()%>");
				$empDept.html("<%=loginUser.getDeptName()%>"+"팀");
				$empPosition.html("<%=loginUser.getPositionName()%>");
				//부서/직책 정보 없으면 비우기
				if("<%=loginUser.getDeptName()%>"=="null"){$empDept.html("");} 
				if("<%=loginUser.getPositionName()%>"=="null"){$empPosition.html("")}
				
			},
			error:function(data){
				console.log("메모 ajax 전송 실패");
			},
		});
		/* $("#sideEmpName").html(empName);
		$("#sideEmpDept").html(empDept);
		$("#sideEmpPositon").val(empPosition); */
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
	var alarmCount = 0;
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
			$("#MsgAlarm").text(serverMessage[0] + " of New Message");
			alarmCount += parseInt(serverMessage[0]);
			$("#MsgAlarm").attr("href", "<%=request.getContextPath()%>/chkAlarm?empid=<%=empid%>");
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
				$("#NoticeAlarm").text(count + " of New Notice");
				alarmCount += count;
				$("#NoticeAlarm").attr("href", "<%=request.getContextPath()%>/chkNotice?empid=<%=empid%>");
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
				$("#ApprEndAlarm").text(count + " of New Approval End");
				alarmCount += count;
				$("#ApprEndAlarm").attr("href", "<%=request.getContextPath()%>/chkApprEnd?empid=<%=empid%>");
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
				$("#ApprAlarm").append(count + " of New Approval");
				alarmCount += count;
				$("#ApprEndAlarm").attr("href", "<%=request.getContextPath()%>/chkApprLine?empid=<%=empid%>");
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
			
			setTimeout(function() {
				console.log(alarmCount + "개의 알람들이 존재");
				
				$("#alarmCountAtag").text(alarmCount);
				if (alarmCount > 0) {
					$("#alarmCountAtagDiv").css("display", "block");
				}
			}, 2000);
		}, 3000);
	})
	function isNull(obj) {
		return (typeof obj != "undefined" && obj != null && obj != "null" && obj != "")?true:false;
	}
</script>