<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.semi.admin.user.model.vo.*"%>
<%
	request.setAttribute("title", "사원 관리");
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
				<img id="contentImg" width="160" height="160">
			</div>
			
			<div class="form-group" id="inputFileArea" align="center">
				<input type="file" id="userImg" name="userImg" onchange="loadImg(this)"/>
			</div>
			
			
			<!-- 회원 가입 사항 -->
			<div class="form-group" id="divId">
				<label for="inputId" class="col-lg-2 control-label">사원번호</label>
				<div class="col-lg-8">
					<input type="text" class="form-control onlyNumber" id="id" name="userId" value="<%emp.getEmpId()%>" readonly>
				</div>
			</div>
			
			<div class="form-group" id="divName">
				<label for="inputName" class="col-lg-2 control-label">이름</label>
				<div class="col-lg-8">
					<input type="text" class="form-control onlyHangul" id="name" name="userName" data-rule-required="true" placeholder="한글만 입력 가능합니다." maxlength="15">
				</div>
			</div>
			
			<div class="form-group" id="divPassword">
				<label for="inputPassword" class="col-lg-2 control-label">비밀번호</label>
				<div class="col-lg-8">
					<input type="password" class="form-control" id="password" name="userPwd" data-rule-required="true" placeholder="패스워드" maxlength="30">
				</div>
			</div>
			
			<div class="form-group" id="divPasswordCheck">
				<label for="inputPasswordCheck" class="col-lg-2 control-label">비밀번호 확인</label>
				<div class="col-lg-8">
					<input type="password" class="form-control" id="passwordCheck" name="userPwd2" data-rule-required="true" placeholder="패스워드 확인" maxlength="30">
				</div>
			</div>
			
			
			<div class="form-group">
				<label for="inputGender" class="col-lg-2 control-label">성별</label>
				<div class="col-lg-8">
					<select class="form-control" id="gender" name="gender">
						<option value="M">남</option>
						<option value="F">여</option>
					</select>
				</div>
			</div>
			
			<div class="form-group" id="divPhoneNumber">
				<label for="inputPhoneNumber" class="col-lg-2 control-label">휴대폰 번호</label>
				<div class="col-lg-8">
					<input type="tel" class="form-control onlyNumber" id="phoneNumber" name="phone" data-rule-required="true" placeholder="-를 제외하고 숫자만 입력하세요." maxlength="11">
				</div>
			</div>
			
			<div class="form-group" id="divAddress">
				<label for="inputAddress" class="col-lg-2 control-label">주소</label>
				<div class="col-lg-8">
					<input type="text" class="form-control" id="address" name="address" data-rule-required="true" placeholder="주소를 입력하세요." maxlength="50">
				</div>
			</div>
			
			<div class="form-group" id="divBirth">
				<label for="inputBirth" class="col-lg-2 control-label">생년월일</label>
				<div class="col-lg-8">
					<input id="fromDate" type="date" class="form-control onlyNumber" id="birth" name="birth" data-rule-required="true" placeholder="YYYY-MM-DD" maxlength="50">
				</div>
			</div>
			
			<div class="form-group" id="divEntryDay">
				<label for="inputEntryDay" class="col-lg-2 control-label">입사일</label>
				<div class="col-lg-8">
					<input id="fromDate" type="date" class="form-control onlyNumber" id="entryDay" name="entryDay" data-rule-required="true" placeholder="YYYY-MM-DD" maxlength="50">
				</div>
			</div>
		 	
			<div class="form-group" id="divAdminYN">
				<label for="inputAdminYN" class="col-lg-2 control-label">관리자 여부</label>
				<div class="col-lg-8">
					<select class="form-control" id="adminYN" name="adminYN">
						<option value="Y">Y</option>
						<option value="N" selected="selected">N</option>
					</select>
				</div>
			</div>
			
			<div class="form-group" id="divApprovalPwd">
				<label for="inputApprovePassword" class="col-lg-2 control-label">결재 비밀번호</label>
				<div class="col-lg-8">
					<input type="password" class="form-control" id="approvePwd" name="approvePwd" data-rule-required="true" placeholder="결재 시 사용할 비밀번호를 입력하세요." maxlength="30">
				</div>
			</div>



			<div class="form-group">
				<div class="col-lg-offset-2 col-lg-8">
					<button type="button" class="btn btn-default" id="goList" onclick="goList();">목록으로</button>
					<button type="submit" class="btn btn-default" id="enrollBtn" onclick="insertMember();">등록</button>
				</div>
			</div>
		</form>

		<script>
			function goMain() {
				location.href="<%=request.getContextPath()%>/memberList.me.jsp";
			}
		
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
