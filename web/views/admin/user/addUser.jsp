<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="/semi/assets/css/admin/user.css">
<jsp:include page="/views/layout/treeview/admin/layout-up.jsp" />

<script type="text/javascript">
	var jsonData = treeviewJson.adminJson;
	var nodeName = "사원 추가";
</script>

<section class="content">
	<div class="content-left">
		<div id="treeview"></div>
	</div>

	<div class="content-right container">
		<h2 align="left">사원 등록</h2>
		<hr>

		<form class="form-horizontal" id="addUserForm" method="post" action="<%=request.getContextPath()%>/insertMember.me">
			<!-- 
			사진 첨부 ㅠㅠ
			<div class="form-group" id="divUserImg">
				<label for="inputImg" class="col-lg-2 control-label">사진</label>
				<div class="col-lg-10 bootstrap-filestyle input-group">
					<input type="fileInput" type="file" data-class-button="btn btn-default" data-class-input="form-control" data-button-text="" data-icon-name="fa fa-upload" class="form-control" tabindex="-1" style="position: absolute; clip: rect(0px 0px 0px 0px); width: 800px">
					<span class="group-span-filestyle input-group-btn" tabindex="0">
					<label for="fileInput" class="btn btn-default ">
						<span><i class="fas fa-file-upload"></i></span>
					</label>
					</span>
				</div>
			</div> -->
			
			<div class="form-group" id="divUserImg" align="center">
				<label for="file">
					<img id="">
				</label>
				<input type="file" id="file">
			</div>
			
			<div class="form-group" id="divId">
				<label for="inputId" class="col-lg-2 control-label">사원번호</label>
				<div class="col-lg-10">
					<input type="text" class="form-control onlyAlphabetAndNumber"
						id="id" data-rule-required="true"
						placeholder="30자이내의 알파벳, 언더스코어(_), 숫자만 입력 가능합니다." maxlength="30">
				</div>
			</div>
			
			<div class="form-group" id="divName">
				<label for="inputName" class="col-lg-2 control-label">이름</label>
				<div class="col-lg-10">
					<input type="text" class="form-control onlyHangul" id="name"
						data-rule-required="true" placeholder="한글만 입력 가능합니다."
						maxlength="15">
				</div>
			</div>
			
			<div class="form-group" id="divPassword">
				<label for="inputPassword" class="col-lg-2 control-label">비밀번호</label>
				<div class="col-lg-10">
					<input type="password" class="form-control" id="password"
						name="excludeHangul" data-rule-required="true" placeholder="패스워드"
						maxlength="30">
				</div>
			</div>
			
			<div class="form-group" id="divPasswordCheck">
				<label for="inputPasswordCheck" class="col-lg-2 control-label">비밀번호
					확인</label>
				<div class="col-lg-10">
					<input type="password" class="form-control" id="passwordCheck"
						data-rule-required="true" placeholder="패스워드 확인" maxlength="30">
				</div>
			</div>
			
			
			<div class="form-group">
				<label for="inputPhoneNumber" class="col-lg-2 control-label">성별</label>
				<div class="col-lg-10">
					<select class="form-control" id="gender">
						<option value="M">남</option>
						<option value="F">여</option>
					</select>
				</div>
			</div>
			
			<div class="form-group" id="divEmail">
				<label for="inputEmail" class="col-lg-2 control-label">이메일</label>
				<div class="col-lg-10">
					<input type="email" class="form-control" id="email"
						data-rule-required="true" placeholder="이메일" maxlength="40">
				</div>
			</div>
			
			<div class="form-group" id="divPhoneNumber">
				<label for="inputPhoneNumber" class="col-lg-2 control-label">휴대폰 번호</label>
				<div class="col-lg-10">
					<input type="tel" class="form-control onlyNumber" id="phoneNumber"
						data-rule-required="true" placeholder="-를 제외하고 숫자만 입력하세요."
						maxlength="11">
				</div>
			</div>
			
			<div class="form-group" id="divAddress">
				<label for="inputAddress" class="col-lg-2 control-label">거주지</label>
				<div class="col-lg-10">
					<input type="text" class="form-control" id="address"
						data-rule-required="true" placeholder="주소를 입력하세요." maxlength="50">
				</div>
			</div>
			
			<div class="form-group" id="divBirth">
				<label for="inputBirth" class="col-lg-2 control-label">생년월일</label>
				<div class="col-lg-10">
					<input id="fromDate" type="text" class="form-control onlyNumber" 
					id="birth" data-rule-required="true" placeholder="YYYY-MM-DD" maxlength="50">
				</div>
			</div>
			
			<div class="form-group" id="divApprovalPW">
				<label for="inputPassword" class="col-lg-2 control-label">결재 비밀번호</label>
				<div class="col-lg-10">
					<input type="password" class="form-control" id="password"
						name="excludeHangul" data-rule-required="true" placeholder="결재 시 사용할 비밀번호를 입력하세요."
						maxlength="30">
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
				/* //모달을 전역변수로 선언
				var modalContents = $(".modal-contents");
				var modal = $("#defaultModal");

				$('.onlyAlphabetAndNumber').keyup(function(event) {
					if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
						var inputVal = $(this).val();
						$(this).val($(this).val().replace(/[^_a-z0-9]/gi, '')); //_(underscore), 영어, 숫자만 가능
					}
				});

				$(".onlyHangul").keyup(function(event) {
					if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
						var inputVal = $(this).val();
						$(this).val(inputVal.replace(/[a-z0-9]/gi, ''));
					}
				});

				$(".onlyNumber").keyup(function(event) {
					if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
						var inputVal = $(this).val();
						$(this).val(inputVal.replace(/[^0-9]/gi, ''));
					}
				}); */

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

				$('#email').keyup(function(event) {

					var divEmail = $('#divEmail');

					if ($.trim($('#email').val()) == "") {
						divEmail.removeClass("has-success");
						divEmail.addClass("has-error");
					} else {
						divEmail.removeClass("has-error");
						divEmail.addClass("has-success");
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

				//-------------- validation 검사 -------------------
				$("form").submit(
						function(event) {

							var provision = $('#provision');
							var memberInfo = $('#memberInfo');
							var divId = $('#divId');
							var divPassword = $('#divPassword');
							var divPasswordCheck = $('#divPasswordCheck');
							var divName = $('#divName');
							var divNickname = $('#divNickname');
							var divEmail = $('#divEmail');
							var divPhoneNumber = $('#divPhoneNumber');

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

							//이메일
							if ($('#email').val() == "") {
								modalContents.text("이메일을 입력하여 주시기 바랍니다.");
								modal.modal('show');

								divEmail.removeClass("has-success");
								divEmail.addClass("has-error");
								$('#email').focus();
								return false;
							} else {
								divEmail.removeClass("has-error");
								divEmail.addClass("has-success");
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
		
		<!-- 
		<script>
		$(function(){
			$("#fileInput").on('change', function(){  // 값이 변경되면
				if (window.FileReader) {  // modern browser
					var filename = $(this)[0].files[0].name;
				} else {  // old IE
					var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
				}
				// 추출한 파일명 삽입
				$("#userfile").val(filename);
			});
		});
		</script>
		 -->
	</div>
</section>

<jsp:include page="/views/layout/treeview/admin/layout-down.jsp" />
