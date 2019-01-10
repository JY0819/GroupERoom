<%@page import="com.semi.admin.user.model.vo.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<style type="text/css">
	.custom_icon_size_2_5{font-size: 2.5rem;}
</style>

<script>
	function logOut(){
		location.href="<%=request.getContextPath()%>/logout.me";
	}
</script>

<div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
    </button>
    <img alt="logo" src="/semi/assets/images/logo.png" height="50px;" style="float:left; margin-left: 15px;">
    <a class="navbar-brand" href="/semi/main" style="padding: 15px 15px 15px 0;">groupERoom</a>
</div>
            
<!-- /.navbar-header -->
<ul class="nav navbar-top-links navbar-right">
    <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
            <i class="fa fa-bell fa-fw"></i> <i class="fa fa-caret-down"></i>
        </a>
        <ul class="dropdown-menu dropdown-alerts">
            <li>
                <a href="<%=request.getContextPath()%>/selectList.no">
                    <div>
                        <i class="fa fa-comment fa-fw"></i> 0
                        <span class="pull-right text-muted small">New Notice</span>
                    </div>
                </a>
            </li>
            <li class="divider"></li>
            <li>
                <a href="<%=request.getContextPath()%>/myPageMessage">
                    <div>
                        <i class="fa fa-twitter fa-fw"></i> 0
                        <span class="pull-right text-muted small">New Message</span>
                    </div>
                </a>
            </li>
            <li class="divider"></li>
            <li>
                <a href="<%=request.getContextPath()%>/selectSubmitDocumentServlet.sds">
                    <div>
                        <i class="fa fa-envelope fa-fw"></i> 0
                        <span class="pull-right text-muted small">New Approval</span>
                    </div>
                </a>
            </li>
            <li class="divider"></li>
            <li>
                <a href="<%=request.getContextPath()%>/selectStatusServlet.sss">
                    <div>
                        <i class="fa fa-tasks fa-fw"></i> 0
                        <span class="pull-right text-muted small">New Approval End</span>
                    </div>
                </a>
            </li>
           <!--  
           <li class="divider"></li>
            <li>
                <a href="#">
                    <div>
                        <i class="fa fa-upload fa-fw"></i> Server Rebooted
                        <span class="pull-right text-muted small">4 minutes ago</span>
                    </div>
                </a>
            </li> 
            <li class="divider"></li>
            <li>
                <a class="text-center" href="#">
                    <strong>See All Alerts</strong>
                    <i class="fa fa-angle-right"></i>
                </a>
            </li>
            -->
        </ul>
        <!-- /.dropdown-alerts -->
    </li>
    <!-- /.dropdown -->
    <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
            <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
        </a>
        <ul class="dropdown-menu dropdown-user">
            <li><a href="<%=request.getContextPath()%>/myPageMain"><i class="fa fa-user fa-fw"></i> User Profile</a>
            </li>
            <li class="adminYNClass"><a href="<%=request.getContextPath()%>/memberList.me"><i class="fa fa-gear fa-fw"></i> Admin</a>
            </li>
            <li class="divider"></li>
            <li><a href="javascript:void(0);" onclick="logOut()"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
            </li>
        </ul>
        <!-- /.dropdown-user -->
    </li>
    <!-- /.dropdown -->
</ul>
<!-- /.navbar-top-links -->

<script>
	$(function() {
		var empId = loginUserInfo.emp_id;
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
		var memoEmpId=loginUserInfo.emp_id;
		var photoId=loginUserInfo.photo_id;
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
				if(loginUserInfo.photo_id==0){
					$empPhoto.css("background-image","url('assets/images/upload_EmpImg/ProfileImg-None.png')");
				}else{
					$empPhoto.css("background-image","url('assets/images/upload_EmpImg/"+data.imgPath+"')");
				}
				var $empName=$("#sideEmpName");
				var $empDept=$("#sideEmpDept");
				var $empPosition=$("#sideEmpPosition");
				$empName.html(loginUserInfo.emp_name);
				$empDept.html(loginUserInfo.dept_name+"팀");
				$empPosition.html(loginUserInfo.position_name);
				//부서/직책 정보 없으면 비우기
				if(loginUserInfo.dept_name==""){$empDept.html("");} 
				if(loginUserInfo.position_name==""){$empPosition.html("")}
				
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
			var empId=loginUserInfo.emp_id;
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
		ws = new WebSocket(loginUserInfo.socket_link);
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
		if (serverMessage[1] == "msg" && serverMessage[2] == loginUserInfo.emp_id) {
			$("#MsgAlarm").text(serverMessage[0] + " of New Message");
			alarmCount += parseInt(serverMessage[0]);
			$("#MsgAlarm").attr("href", "<%=request.getContextPath()%>/chkAlarm?empid=" + loginUserInfo.emp_id);
		} else if (serverMessage[1] == "board") {
			var countBoard = serverMessage[0].split("|");
			var data = null;
			var count = countBoard.length;
			console.log(countBoard.length);
			for (var i = 0; i < countBoard.length; i++) {
				data = countBoard[1].split("-");
				console.log(data);
				for (var j = 0; j < data.length; j++) {
					if (data[j] == loginUserInfo.emp_id) {
						count--;
					}
				}
				data = null;
			}
			if (count > 0) {
				$("#NoticeAlarm").text(count + " of New Notice");
				alarmCount += count;
				$("#NoticeAlarm").attr("href", "<%=request.getContextPath()%>/chkNotice?empid=" + loginUserInfo.emp_id);
			}
			
		} else if (serverMessage[1] == "apprEnd") {
			var empInfo = serverMessage[0].split("|");
			var count = 0;
			for (var i = 0; i < empInfo.length; i++) {
				if (empInfo[i] == loginUserInfo.emp_id) {
					count++
				}
			}
			if (count > 0) {
				$("#ApprEndAlarm").text(count + " of New Approval End");
				alarmCount += count;
				$("#ApprEndAlarm").attr("href", "<%=request.getContextPath()%>/chkApprEnd?empid=" + loginUserInfo.emp_id);
			}
			
		} else if (serverMessage[1] == "apprIn") {
			var empInfo = serverMessage[0].split("|");
			var count = 0;
			for (var i = 0; i < empInfo.length; i++) {
				if (empInfo[i] == loginUserInfo.emp_id) {
					count++
				}
			}
			if (count > 0) {
				$("#ApprAlarm").append(count + " of New Approval");
				alarmCount += count;
				$("#ApprEndAlarm").attr("href", "<%=request.getContextPath()%>/chkApprLine?empid=" + loginUserInfo.emp_id);
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
			sendAlarm(loginUserInfo.emp_id + ",msg");
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