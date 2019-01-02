<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="com.semi.admin.user.model.vo.Employee"%>
<%
Employee employee = (Employee)session.getAttribute("loginUser");
%>
<jsp:include page="/views/layout/treeview/approval/layout-up.jsp" />
<link rel="stylesheet" type="text/css"
	href="/semi/assets/css/approval/taskBox.css">

<script>
	var jsonData = treeviewJson.approvalJson;
	var nodeName = "기본 설정";
</script>


<section class="content">

	<div class="content-left">
		<div id="treeview"></div>
	</div>

	<div class="content-right container">


		<div class="titleArea">
			<h1 class="title">기본설정</h1>
			<hr class="line">

			<table class="settingTable">
				<tr>
					<td><h3>아이디</h3></td>
					<td>
					<input type="text" size="30px" id ="userId" name="userId"
						placeholder="아이디를 입력하세요." value="<%= employee.getEmpid()%>" disabled="disabled">
						</td>
					
					
				</tr>
				<tr>
					<td><h3>비밀번호</h3></td>
					<td>
					<input type="password" size="30px" id ="nowpwd" name="nowpwd"
						placeholder="현재 전자결재 비밀번호를 입력하세요.">&nbsp;&nbsp;&nbsp;&nbsp;
						<button class="confrim"><div id="pwdCheck">비밀번호확인</div></button>
						</td>
				</tr>
				<tr>
					<td><h3>새 비밀번호</h3></td>
					<td><input type="password" size="32px" id ="newpwd" name="newpwd"
						placeholder="변경할 전자결재 비밀번호를 입력하세요." disabled="disabled"></td>
				</tr>
				<tr>
					<td><h3>확인</h3></td>
					<td><input type="password" size="32px" id ="newpwd2" name="newpwd2"
						placeholder="변경할 전자결재 비밀번호를 입력하세요." disabled="disabled"></td>
				</tr>
				
				<tr>
					<td colspan="10"><button class="saveBtn"><div id="pwdSave">저장</div></button></td>
				</tr>
			</table>
		</div>
	</div>
	<script>
	var newpwd2 = "";
	var userId = "";
	$("#pwdCheck").click(function() {
		var nowpwd = $("#nowpwd").val();
		userId = $("#userId").val();
		
		$.ajax({
			url:"/semi/pwdCheck.pc",
			type:"post",
			data:{nowpwd:nowpwd,
				  userId:userId},
			success: function(data) {
				if(data === "success"){
					alert("아이디에 해당하는 결재비밀번호가 일치합니다. 새로운 결재비밀번호를 입력하세요.");
					
					$('#newpwd').prop('disabled', false); 
					$('#newpwd2').prop('disabled', false); 
				}else {
					alert("아이디에 해당하는 결재비밀번호가 일치하지 않습니다. 현재 결재 비밀번호를 다시 입력하세요.");
				}
			},
			error: function(data) {
				console.log("실패");
			}
		});
	});
	
	$("#pwdSave").click(function() {
		
		var newpwd = $("#newpwd").val();
		newpwd2 = $("#newpwd2").val();
		userId = $("#userId").val();
		if(newpwd == newpwd2){
			alert("새 비밀번호로 변경 되었습니다.")
			location.href="<%=request.getContextPath()%>/updatesetting.up?userId="+userId+","+newpwd2+"";
		}
		else{
			
			alert("새비밀번호와 확인이 일치하지 않습니다. 다시 입력하세요.");
		} 
	});
	
	
	</script>
</section>


<jsp:include page="/views/layout/treeview/approval/layout-down.jsp" />