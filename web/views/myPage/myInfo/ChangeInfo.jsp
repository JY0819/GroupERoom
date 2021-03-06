<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
	import="java.util.*, com.semi.admin.user.model.vo.*, com.semi.common.vo.*"%>
<%
	Employee emp = (Employee) request.getSession().getAttribute("loginUser");
	String file = (String) request.getAttribute("file");
%>

<link rel="stylesheet" type="text/css" href="/semi/assets/css/admin/userdetail.css">
<jsp:include page="/views/layout/treeview/admin/layout-up.jsp" />

<script>
	var jsonData = treeviewJson.myPageJson;
	var nodeName = "정보 수정";
</script>
<script>
20190109110909202559
	$(function() {
		var fileNameMypage = "<%= file %>";
		if (isNull(fileNameMypage)) {
			$("#contentImg").attr("src", "<%=request.getContextPath() %>/assets/images/upload_EmpImg/" + fileNameMypage);
		}
	});

	function updateUser(){
		if (isNull($("#password").val())) {
			
		} else {
			alert("비밀번호를 입력해주세요!");
			return false;
		}
		
		if ($("#chkPassword").val() == $("#password").val()) {
					
			$("#userUpdateForm").attr("action", "<%=request.getContextPath()%>/updateMyPageInfo");
			$("#userUpdateForm").submit();
			
		} else {
			alert("비밀번호를 확인해주세요!");
			return false;
		}
	}
	
	function uploadClick() {
		$("#userImg").click();
	}
	
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#contentImg').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	$(function() {
		console.log("asd")
		$("#userImg").change(function() {
			readURL(this);
		});
	})
</script>

<section class="content">
	<div class="content-left">
		<div id="treeview"></div>
	</div>

	<div class="content-right container">
		<div>
			<h2>정보 수정</h2>
		</div>
		<hr>

		<form class="form-horizontal" id="userUpdateForm" method="post" encType="multipart/form-data">
			
			<!-- 첨부파일 ** 이미지 미리보기 -->
			<div class="form-group" id="contentImgArea" align="center">
				<img id="contentImg" width="180" height="180" style="border-radius: 100%" onclick="uploadClick();" src="<%=request.getContextPath() %>/assets/images/upload_EmpImg/ProfileImg-None.png">
			</div>
			
			<div class="form-group" id="inputFileArea" align="center">
				<input type="file" id="userImg" name="userImg" style="display: none;"/>
			</div>
			
			<!-- 회원 가입 사항 -->
			<div class="form-group">
				<label for="inputId" class="col-lg-2 control-label">사원번호</label>
				<div class="col-lg-3">
					<input type="text" class="form-control" id="id" name="userId" value="<%=emp.getEmpid() %>" readonly>
				</div>
				
				<label for="inputName" class="col-lg-1 control-label">이름</label>
				<div class="col-lg-3">
					<input type="text" class="form-control" id="name" name="userName" value="<%=emp.getEmpName() %>" readonly>
				</div>
			</div>
			
			<div class="form-group">
				<label for="inputPassword" class="col-lg-2 control-label">비밀번호</label>
				<div class="col-lg-2">
					<input type="password" class="form-control" id="password" name="userPwd" value="">
				</div>
				
				<label for="inputApprovePassword" class="col-lg-2 control-label">비밀번호 확인</label>
				<div class="col-lg-3">
					<input type="password" class="form-control" id="chkPassword" name="chkUserPwd"  value="">
				</div>
			</div>
			
			<div class="form-group">
				<label for="inputGender" class="col-lg-2 control-label">성별</label>
				<div class="col-lg-2">
					<input type="text" class="form-control" id="gender" name="gender" value="<%=emp.getEmpGender() %>" readonly>
				</div>
				
				<label for="inputPhoneNumber" class="col-lg-2 control-label">휴대폰 번호</label>
				<div class="col-lg-3">
					<input type="tel" class="form-control onlyNumber" id="phoneNumber" name="phone" value="<%=emp.getEmpPhone() %>">
				</div>
			</div>
			
			<div class="form-group">
				<label for="inputAddress" class="col-lg-2 control-label">주소</label>
				<div class="col-lg-3">
					<input type="text" class="form-control" id="address" name="address" value="<%=emp.getEmpAddr() %>">
				</div>
				
				<label for="inputBirth" class="col-lg-2 control-label">생년월일</label>
				<div class="col-lg-2">
					<input id="fromDate" type="date" class="form-control onlyNumber" id="birth" name="birth" value="<%=emp.getEmpBirth() %>" readonly> 
				</div>
			</div>
			
			<div class="form-group">
				<label for="inputDept" class="col-lg-2 control-label">부서</label>
				<div class="col-lg-3">
					<input type="text" class="form-control" id="dept" name="dept" value="<%=emp.getDeptName() %>" readonly>
				</div>
				
				<label for="inputDept" class="col-lg-1 control-label">직책</label>
				<div class="col-lg-3">
					<input type="text" class="form-control" id="position" name="position" value="<%=emp.getPositionName() %>" readonly>
				</div> 
			</div>
			
			<div class="form-group" id="divAdminYN">
				<label class="col-lg-2 control-label">관리자 여부</label>
				<div class="col-lg-3">
					<input type="text" class="form-control" value="<%=emp.getAdminAuthority() %>"readonly>
				</div>
				
				<label class="col-lg-1 control-label">입사일</label>
				<div class="col-lg-3">
					<input id="fromDate" type="date" class="form-control" value="<%=emp.getEntryDay() %>"readonly>
				</div>
			</div>

			<div class="col-lg-offset-2 col-lg-7" align="center">
				<button class="btn btn-default" onclick="updateUser();">수정</button>
			</div>
			
		</form>
	</div>
</section>

<jsp:include page="/views/layout/treeview/admin/layout-down.jsp" />
