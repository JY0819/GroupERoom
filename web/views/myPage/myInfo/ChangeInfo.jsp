<%@page import="com.semi.admin.user.model.vo.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Employee loginUser = (Employee) request.getSession().getAttribute("loginUser");
	String gender = "";
	if(loginUser.getEmpGender().equals("M")) {
		gender = "남";
	} else {
		gender = "여";
	}
%>

<link rel="stylesheet" type="text/css" href="/semi/assets/css/admin/user.css">
<jsp:include page="/views/layout/treeview/mypage/layout-up.jsp" />

<script>
	var jsonData = treeviewJson.myPageJson;
	var nodeName = "정보 수정";
</script>

<section class="content">

	<div class="content-left">
		<div id="treeview"></div>
	</div>

	<div class="content-right container">
	
	
	<form class="form-horizontal" id="addUserForm" method="post" action="<%=request.getContextPath()%>/insertMember.me" encType="multipart/form-data">
			
		<!-- 첨부파일 ** 이미지 미리보기 -->
		<div class="form-group" id="contentImgArea" align="center">
			<img id="contentImg" width="200" height="160">
		</div>
		
		<div class="form-group" id="inputFileArea" align="center">
			<input type="file" id="userImg" name="userImg" onchange="loadImg(this)"/>
		</div>
		
		
		<!-- 회원 가입 사항 -->
		<div class="form-group" id="div_id">
			<label for="inputId" class="col-lg-2 control-label">사원번호</label>
			<div class="col-lg-7">
				<input type="text" class="form-control onlyNumber" id="id" name="userId" data-rule-required="true" value="<%= loginUser.getEmpid() %>" maxlength="30" readonly>
			</div>
		</div>
		
		<div class="form-group" id="div_name">
			<label for="inputName" class="col-lg-2 control-label">이름</label>
			<div class="col-lg-7">
				<input type="text" class="form-control onlyHangul" id="name" name="userName" data-rule-required="true" value="<%= loginUser.getEmpName() %>" maxlength="15" readonly>
			</div>
		</div>
		
		<div class="form-group" id="div_password">
			<label for="inputPassword" class="col-lg-2 control-label">비밀번호</label>
			<div class="col-lg-7">
				<input type="password" class="form-control" id="password" name="userPwd" data-rule-required="true" placeholder="패스워드" maxlength="30">
			</div>
		</div>
		
		<div class="form-group" id="div_passwordCheck">
			<label for="inputPasswordCheck" class="col-lg-2 control-label">비밀번호 확인</label>
			<div class="col-lg-7">
				<input type="password" class="form-control" id="passwordCheck" name="userPwd2" data-rule-required="true" placeholder="패스워드 확인" maxlength="30">
			</div>
		</div>
		
		
		<div class="form-group">
			<label for="inputGender" class="col-lg-2 control-label">성별</label>
			<div class="col-lg-7">
				<input type="text" class="form-control onlyHangul" id="gender" name="gender" value="<%= gender %>" data-rule-required="true" maxlength="15" readonly>
			</div>
		</div>
		
		<div class="form-group" id="div_phoneNumber">
			<label for="inputPhoneNumber" class="col-lg-2 control-label">휴대폰 번호</label>
			<div class="col-lg-7">
				<input type="tel" class="form-control onlyNumber" id="phoneNumber" name="phone" data-rule-required="true" placeholder="-를 제외하고 숫자만 입력하세요." maxlength="11">
			</div>
		</div>
		
		<div class="form-group" id="div_address">
			<label for="inputAddress" class="col-lg-2 control-label">주소</label>
			<div class="col-lg-7">
				<input type="text" class="form-control" id="address" name="address" data-rule-required="true" placeholder="주소를 입력하세요." maxlength="50">
		</div>
		</div>
		
		<div class="form-group">
			<label for="inputBirth" class="col-lg-2 control-label">생년월일</label>
			<div class="col-lg-3">
				<input type="date" class="form-control onlyNumber" id="birth" name="birth" data-rule-required="true" value="<%= loginUser.getEmpBirth() %>" maxlength="50" readonly>
			</div>
			
			<label for="inputEntryDay" class="col-lg-1 control-label">입사일</label>
			<div class="col-lg-3">
				<input  type="date" class="form-control onlyNumber" id="entryDay" name="entryDay" data-rule-required="true" value="<%= loginUser.getEntryDay() %>" maxlength="50" readonly="readonly">
			</div>
		</div>
		
		<div class="form-group" id="divApprovalPwd">
			<label for="inputApprovePassword" class="col-lg-2 control-label">결재 비밀번호</label>
			<div class="col-lg-7">
				<input type="password" class="form-control" id="approvePwd" name="approvePwd" data-rule-required="true" placeholder="결재 시 사용할 비밀번호를 입력하세요." maxlength="30">
			</div>
		</div>
			<div class="col-lg-offset-2 col-lg-7">
			<button type="submit" class="btn btn-default" id="enrollBtn" onclick="insertMember();">수정</button>
		</div>
	</form>
	
	
	</div>
	<script>
		function goList() {
			location.href="<%=request.getContextPath()%>/memberList.me";
		}

		function insertMember() {
			$("#addUserForm").submit();
		}
	</script>

	<script>
		$(function() {
			//------- 검사하여 상태를 class에 적용
	
			$('#addUserForm input, #addUserForm select').keyup(function(event) {
				var cThis = $(this);
				var cId	= cThis[0].id || "";
				var divId = $("#div_" + cId);
				if ($.trim(cThis.val()) == "") {
					divId.removeClass("has-success");
					divId.addClass("has-error");
				} else {
					divId.removeClass("has-error");
					divId.addClass("has-success");
				}
			});
		//-------------- validation 검사 -------------------
			$("#addUserForm").submit(
				function(event) {
	
					var divPassword = $('#divPassword');
					var divPasswordCheck = $('#divPasswordCheck');
					var divPhoneNumber = $('#divPhoneNumber');
					var divAddress = $('#divAddress');
					var divApprovalPwd = $('#divApprovalPwd');
	
					//패스워드 확인
					if ($('#passwordCheck').val() == "") {
						modalContents.text("패스워드 확인을 입력하여 주시기 바랍니다.");
						modal.modal('show');
	
						divPasswordCheck.removeClass("has-success");
						divPasswordCheck.addClass("has-error");
						$('#passwordCheck').focus();
						return false;
					} else {
						divPasswordCheck.removeClass("has-error");
						divPasswordCheck.addClass("has-success");
					}
	
					//패스워드 비교
					if ($('#password').val() != $('#passwordCheck').val() || $('#passwordCheck').val() == "") {
						modalContents.text("패스워드가 일치하지 않습니다.");
						modal.modal('show');
							
						divPasswordCheck.removeClass("has-success");
						divPasswordCheck.addClass("has-error");
						$('#passwordCheck').focus();
						return false;
					} else {
						divPasswordCheck.removeClass("has-error");
						divPasswordCheck.addClass("has-success");
					}
					
					alert(divPassword.val().length == 0)
			});
		});
			
	</script>
		
	<script>
		$("#inputFileArea").hide();
		
		$("#contentImg").click(function(){
			$("#userImg").click();
		});
			
		function loadImg(value){
			if(value.files && value.files[0]){
				var reader = new FileReader();
					
				reader.onload = function(e){
					$("#contentImg").attr('src', e.target.result);
				}
				reader.readAsDataURL(event.target.files[0]);
			}
		};
	</script>
</section>

<jsp:include page="/views/layout/treeview/admin/layout-down.jsp" />