<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setAttribute("title", "사원 추가");
%>
<link rel="stylesheet" type="text/css" href="/semi/assets/css/admin/user.css">
<jsp:include page="/views/layout/treeview/admin/layout-up.jsp" />

<script type="text/javascript">
	var jsonData = treeviewJson.adminJson;
	var nodeName = "<%= request.getAttribute("title")%>";
</script>

<section class="content">
	<div class="content-left">
		<div id="treeview"></div>
	</div>

	<div class="content-right container">
		<div>
			<h2><%= request.getAttribute("title")%></h2>
		</div>
		<hr>

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
					<input type="text" class="form-control onlyNumber" id="id" name="userId" data-rule-required="true" placeholder="숫자만 입력 가능합니다." maxlength="30">
				</div>
			</div>
			
			<div class="form-group" id="div_name">
				<label for="inputName" class="col-lg-2 control-label">이름</label>
				<div class="col-lg-7">
					<input type="text" class="form-control onlyHangul" id="name" name="userName" data-rule-required="true" placeholder="한글만 입력 가능합니다." maxlength="15">
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
					<select class="form-control" id="gender" name="gender">
						<option value="M">남</option>
						<option value="F">여</option>
					</select>
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
					<input type="date" class="form-control onlyNumber" id="birth" name="birth" data-rule-required="true" placeholder="YYYY-MM-DD" maxlength="50">
				</div>
				
				<label for="inputEntryDay" class="col-lg-1 control-label">입사일</label>
				<div class="col-lg-3">
					<input  type="date" class="form-control onlyNumber" id="entryDay" name="entryDay" data-rule-required="true" placeholder="YYYY-MM-DD" maxlength="50">
				</div>
			</div>
			
			<div class="form-group" id="divDept">
				<label for="inputDept" class="col-lg-2 control-label">부서</label>
				<div class="col-lg-3">
					<select class="form-control" multiple="multiple" id="dept" name="dept">
						<option value="1">대표</option>
						<option value="2">경리</option>
						<option value="3">회계</option>
						<option value="4">마케팅</option>
						<option value="5">개발</option>
					</select>
				</div>
				
				<label for="inputDept" class="col-lg-1 control-label">직책</label>
				<div class="col-lg-3">
					<select class="form-control" multiple="multiple" id="position" name="position">
						<option value="1">대표이사</option>
						<option value="10">이사</option>
						<option value="11">부장</option>
						<option value="12">차장</option>
						<option value="13">과장</option>
						<option value="14">대리</option>
						<option value="15">사원</option>
					</select>
				</div>
			</div>
			
			<div class="form-group" id="divAdminYN">
				<label for="inputAdminYN" class="col-lg-2 control-label">관리자 여부</label>
				<div class="col-lg-7">
					<select class="form-control" id="adminYN" name="adminYN">
						<option value="Y">Y</option>
						<option value="N" selected="selected">N</option>
					</select>
				</div>
			</div>
			
			<div class="form-group" id="divApprovalPwd">
				<label for="inputApprovePassword" class="col-lg-2 control-label">결재 비밀번호</label>
				<div class="col-lg-7">
					<input type="password" class="form-control" id="approvePwd" name="approvePwd" data-rule-required="true" placeholder="결재 시 사용할 비밀번호를 입력하세요." maxlength="30">
				</div>
			</div>



			<div class="col-lg-offset-2 col-lg-7">
			<button type="button" class="btn btn-default" id="goList" onclick="goList();">목록으로</button>
				
			</div>
		</form>
		
		<div class="col-lg-offset-2 col-lg-7">
				<button type="submit" class="btn btn-default" id="enrollBtn" onclick="insertMember();">등록</button>
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
				
				
				/*
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
				
				*/
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

<jsp:include page="/views/layout/treeview/admin/layout-down.jsp" />
