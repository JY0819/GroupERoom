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
		<form class="form-horizontal" id="addUserForm" method="post" action="<%=request.getContextPath()%>/updateMember.me" encType="multipart/form-data">
			
			<!-- 첨부파일 ** 이미지 미리보기 -->
			<div class="form-group" id="contentImgArea" align="center" style="margin-top: 30px;">
				<img id="contentImg" width="160" height="160">
			</div>
			
			<div class="form-group" id="inputFileArea" align="center">
				<input type="file" id="userImg" name="userImg" onchange="loadImg(this)"/>
			</div>
			
			
			<!-- 회원 가입 사항 -->
			<div class="form-group" id="divId">
				<label for="inputId" class="col-lg-2 control-label">사원번호</label>
				<div class="col-lg-10">
					<input type="text" class="form-control onlyNumber" id="id" name="userId" data-rule-required="true" value="<%= loginUser.getEmpid() %>" maxlength="30" readonly>
				</div>
			</div>
			
			<div class="form-group" id="divName">
				<label for="inputName" class="col-lg-2 control-label">이름</label>
				<div class="col-lg-10">
					<input type="text" class="form-control onlyHangul" id="name" name="userName" data-rule-required="true" value="<%= loginUser.getEmpName() %>" maxlength="15" readonly>
				</div>
			</div>
			
			<div class="form-group" id="divPassword">
				<label for="inputPassword" class="col-lg-2 control-label">비밀번호</label>
				<div class="col-lg-10">
					<input type="password" class="form-control" id="password" name="userPwd" data-rule-required="true" placeholder="패스워드" maxlength="30">
				</div>
			</div>
			
			<div class="form-group" id="divPasswordCheck">
				<label for="inputPasswordCheck" class="col-lg-2 control-label">비밀번호 확인</label>
				<div class="col-lg-10">
					<input type="password" class="form-control" id="passwordCheck" name="userPwd2" data-rule-required="true" placeholder="패스워드 확인" maxlength="30">
				</div>
			</div>
			
			
			<div class="form-group">
				<label for="inputGender" class="col-lg-2 control-label">성별</label>
				<div class="col-lg-10">
					<input type="text" class="form-control onlyHangul" id="gender" name="gender" value="<%= gender %>" data-rule-required="true" maxlength="15" readonly>
				</div>
			</div>
			
			<div class="form-group" id="divPhoneNumber">
				<label for="inputPhoneNumber" class="col-lg-2 control-label">휴대폰 번호</label>
				<div class="col-lg-10">
					<input type="tel" class="form-control onlyNumber" id="phoneNumber" name="phone" data-rule-required="true" placeholder="-를 제외하고 숫자만 입력하세요." maxlength="11">
				</div>
			</div>
			
			<div class="form-group" id="divAddress">
				<label for="inputAddress" class="col-lg-2 control-label">주소</label>
				<div class="col-lg-10">
					<input type="text" class="form-control" id="address" name="address" data-rule-required="true" placeholder="주소를 입력하세요." maxlength="50">
				</div>
			</div>
			
			<div class="form-group" id="divBirth">
				<label for="inputBirth" class="col-lg-2 control-label">생년월일</label>
				<div class="col-lg-10">
					<input id="fromDate" type="date" class="form-control onlyNumber" id="birth" name="birth" data-rule-required="true" value="<%= loginUser.getEmpBirth() %>" maxlength="50" readonly>
				</div>
			</div>
			
			<div class="form-group" id="divEntryDay">
				<label for="inputEntryDay" class="col-lg-2 control-label">입사일</label>
				<div class="col-lg-10">
					<input id="fromDate" type="date" class="form-control onlyNumber" id="entryDay" name="entryDay" data-rule-required="true" value="<%= loginUser.getEntryDay() %>" maxlength="50" readonly>
				</div>
			</div>
			
			<div class="form-group" id="divApprovalPwd">
				<label for="inputApprovePassword" class="col-lg-2 control-label">결재 비밀번호</label>
				<div class="col-lg-10">
					<input type="password" class="form-control" id="approvePwd" name="approvePwd" data-rule-required="true" placeholder="결재 시 사용할 비밀번호를 입력하세요." maxlength="30">
				</div>
			</div>



			<div class="form-group">
				<div class="col-lg-offset-2 col-lg-10">
					<button type="button" class="btn btn-default" id="goList" onclick="goList();">목록으로</button>
					<button type="submit" class="btn btn-default" id="enrollBtn" onclick="insertMember();">등록</button>
				</div>
			</div>
		</form>

		<script>
			function goMain() {
<%-- 				location.href="<%=request.getContextPath()%>/index.jsp"; --%>
			}
	
			function insertMember() {
				$("#addUserForm").submit();
			}
		
		</script>
	

		<script>
			$(function() {

				//------- 검사하여 상태를 class에 적용
				$('#id').keyup(function(event) {

					var divId = $('#divId');

					if ($('#id').val() == "") {
						divId.removeClass("has-success");
						divId.addClass("has-error");
					} else {
						divId.removeClass("has-error");
						divId.addClass("has-success");
					}
				});

				$('#password').keyup(function(event) {

					var divPassword = $('#divPassword');

					if ($('#password').val() == "") {
						divPassword.removeClass("has-success");
						divPassword.addClass("has-error");
					} else {
						divPassword.removeClass("has-error");
						divPassword.addClass("has-success");
					}
				});

				$('#passwordCheck').keyup(function(event) {

					var passwordCheck = $('#passwordCheck').val();
					var password = $('#password').val();
					var divPasswordCheck = $('#divPasswordCheck');

					if ((passwordCheck == "") || (password != passwordCheck)) {
						divPasswordCheck.removeClass("has-success");
						divPasswordCheck.addClass("has-error");
					} else {
						divPasswordCheck.removeClass("has-error");
						divPasswordCheck.addClass("has-success");
					}
				});

				$('#name').keyup(function(event) {

					var divName = $('#divName');

					if ($.trim($('#name').val()) == "") {
						divName.removeClass("has-success");
						divName.addClass("has-error");
					} else {
						divName.removeClass("has-error");
						divName.addClass("has-success");
					}
				});

				$('#phoneNumber').keyup(function(event) {

					var divPhoneNumber = $('#divPhoneNumber');

					if ($.trim($('#phoneNumber').val()) == "") {
						divPhoneNumber.removeClass("has-success");
						divPhoneNumber.addClass("has-error");
					} else {
						divPhoneNumber.removeClass("has-error");
						divPhoneNumber.addClass("has-success");
					}
				});
				
				$('#address').keyup(function(event) {

					var divAddress = $('#divAddress');

					if ($.trim($('#address').val()) == "") {
						divAddress.removeClass("has-success");
						divAddress.addClass("has-error");
					} else {
						divAddress.removeClass("has-error");
						divAddress.addClass("has-success");
					}
				});
				
				$('#birth').keyup(function(event) {

					var divBirth = $('#divBirth');

					if ($.trim($('#address').val()) == "") {
						divBirth.removeClass("has-success");
						divBirth.addClass("has-error");
					} else {
						divBirth.removeClass("has-error");
						divBirth.addClass("has-success");
					}
					
				});
				
				$('#entryDay').keyup(function(event) {

					var divEntryDay = $('#divEntryDay');

					if ($.trim($('#entryDay').val()) == "") {
						divEntryDay.removeClass("has-success");
						divEntryDay.addClass("has-error");
					} else {
						divEntryDay.removeClass("has-error");
						divEntryDay.addClass("has-success");
					}
				});
				
				$('#adminYN').keyup(function(event) {

					var divEntryDay = $('#divAdminYN');
	
					if ($.trim($('#adminYN').val()) == "") {
						divAdminYN.removeClass("has-success");
						divAdminYN.addClass("has-error");
					} else {
						divAdminYN.removeClass("has-error");
						divAdminYN.addClass("has-success");
					}
				});
				
				$('#approvePwd').keyup(function(event) {

					var divApprovalPwd = $('#divApprovalPwd');

					if ($.trim($('#approvePwd').val()) == "") {
						divApprovalPwd.removeClass("has-success");
						divApprovalPwd.addClass("has-error");
					} else {
						divApprovalPwd.removeClass("has-error");
						divApprovalPwd.addClass("has-success");
					}
				});
				

				//-------------- validation 검사 -------------------
				$("form").submit(
						function(event) {

// 							var provision = $('#provision');
// 							var memberInfo = $('#memberInfo');
							var divId = $('#divId');
							var divPassword = $('#divPassword');
							var divPasswordCheck = $('#divPasswordCheck');
							var divName = $('#divName');
							var divPhoneNumber = $('#divPhoneNumber');
							var divGender = $('#divGender')
							var divAddress = $('#divAddress');
							var divBirth = $('#divBirth');
							var divEntryDay = $('#divEntryDay');
							var divAdminYN = $('#divAdminYN');
							var divApprovalPwd = $('#divApprovalPwd');

							//아이디 검사
							if ($('#id').val() == "") {
								modalContents.text("아이디를 입력하여 주시기 바랍니다.");
								modal.modal('show');

								divId.removeClass("has-success");
								divId.addClass("has-error");
								$('#id').focus();
								return false;
							} else {
								divId.removeClass("has-error");
								divId.addClass("has-success");
							}

							//패스워드 검사
							if ($('#password').val() == "") {
								modalContents.text("패스워드를 입력하여 주시기 바랍니다.");
								modal.modal('show');

								divPassword.removeClass("has-success");
								divPassword.addClass("has-error");
								$('#password').focus();
								return false;
							} else {
								divPassword.removeClass("has-error");
								divPassword.addClass("has-success");
							}

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
							if ($('#password').val() != $('#passwordCheck')
									.val()
									|| $('#passwordCheck').val() == "") {
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

							//이름
							if ($('#name').val() == "") {
								modalContents.text("이름을 입력하여 주시기 바랍니다.");
								modal.modal('show');

								divName.removeClass("has-success");
								divName.addClass("has-error");
								$('#name').focus();
								return false;
							} else {
								divName.removeClass("has-error");
								divName.addClass("has-success");
							}

							//휴대폰 번호
							if ($('#phoneNumber').val() == "") {
								modalContents.text("휴대폰 번호를 입력하여 주시기 바랍니다.");
								modal.modal('show');

								divPhoneNumber.removeClass("has-success");
								divPhoneNumber.addClass("has-error");
								$('#phoneNumber').focus();
								return false;
							} else {
								divPhoneNumber.removeClass("has-error");
								divPhoneNumber.addClass("has-success");
							}

						});

			});
			
		</script>
		
		<script>
			$("#inputFileArea").hide();
			
			$("#contentImgArea").click(function(){
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
	</div>
</section>

<jsp:include page="/views/layout/treeview/mypage/layout-down.jsp" />