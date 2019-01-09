<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
	import="java.util.*, com.semi.admin.user.model.vo.*, com.semi.common.vo.*"%>
<%
	Employee emp = (Employee) request.getAttribute("emp");
	ArrayList<Attachments> file = (ArrayList<Attachments>) request.getAttribute("file");
	Attachments userImg = file.get(0);
%>
<link rel="stylesheet" type="text/css" href="/semi/assets/css/admin/userdetail.css">
<jsp:include page="/views/layout/layout-up.jsp" />

<script type="text/javascript">
	function goList() {
		location.href="<%=request.getContextPath()%>/memberList.me";
	}
	
	function updateUser(){
		$("#userUpdateForm").attr("action", "<%=request.getContextPath()%>/admin/updateMember.me");
	}
	
	function deleteUser(){
		$("#userUpdateForm").attr("action", "<%=request.getContextPath()%>/deleteMember.me");
	}
	
	$(document).ready(function(){
		var dept = "<%=emp.getDeptId()%>";
		$("#dept").val(dept);
	
		var position = "<%=emp.getPositionId()%>";
		$("#position").val(position);

		var retireYN = "<%=emp.getWhetherOfRetire()%>";
		$("#retireYN").val(retireYN);
	});
	
	$("#userImg").hide();
	
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
	
	$("#userImg").change(function() {
		readURL(this);
	});
	
</script>

<section class="content">
	<div>
		<h2>사원 조회</h2>
	</div>
	<hr>

	<form class="form-horizontal" id="userUpdateForm" method="post">
		
		<!-- 첨부파일 ** 이미지 미리보기 -->
		<div class="form-group" id="contentImgArea" align="center">
			<img id="contentImg" width="200" height="160" onclick="uploadClick();" src="<%=request.getContextPath() %>/assets/images/upload_EmpImg/<%=userImg.getAttachName()%>">
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
				<input type="text" class="form-control" id="password" name="userPwd" value="<%=emp.getEmpPwd() %>">
			</div>
			
			<label for="inputApprovePassword" class="col-lg-2 control-label">결재 비밀번호</label>
			<div class="col-lg-3">
				<input type="text" class="form-control" id="approvePwd" name="approvePwd"  value="<%=emp.getApprovePwd() %>"readonly>
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
			<div class="col-lg-7">
				<input type="text" class="form-control" id="address" name="address" value="<%=emp.getEmpAddr() %>">
			</div>
		</div>
		
		<div class="form-group">
			<label for="inputBirth" class="col-lg-2 control-label">생년월일</label>
				<div class="col-lg-3">
					<input id="fromDate" type="date" class="form-control onlyNumber" id="birth" name="birth" value="<%=emp.getEmpBirth() %>" readonly> 
				</div>
			
			<label for="inputVacCount" class="col-lg-1 control-label">휴가</label>
			<div class="col-lg-3">
				<input type="number" class="form-control" id="vacCount" name="vacCount" value = "<%=emp.getEmpVacCount() %>" maxlength="30">
			</div>
		</div>
		
		<div class="form-group">
			<label for="inputDept" class="col-lg-2 control-label">부서</label>
			<div class="col-lg-3">
				<select class="form-control" id="dept" name="dept">
					<option value="1">대표</option>
					<option value="2">경리</option>
					<option value="3">회계</option>
					<option value="4">마케팅</option>
					<option value="5">개발</option>
				</select>
			</div>
			
			<label for="inputDept" class="col-lg-1 control-label">직책</label>
			<div class="col-lg-3">
				<select class="form-control" id="position" name="position">
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
			<label class="col-lg-2 control-label">관리자 여부</label>
			<div class="col-lg-3">
				<input type="text" class="form-control" value="<%=emp.getAdminAuthority() %>"readonly>
			</div>
			
			<label class="col-lg-1 control-label">퇴사 여부</label>
			<div class="col-lg-3">
				<select class="form-control" id="retireYN" name="retireYN">
					<option value="Y">퇴사</option>
					<option value="N">재직</option>
				</select>
			</div>
		</div>

		<div class="form-group">
			<label class="col-lg-2 control-label">입사일</label>
			<div class="col-lg-3">
				<input id="fromDate" type="date" class="form-control" value="<%=emp.getEntryDay() %>"readonly>
			</div>
			
			<label class="col-lg-1 control-label">퇴사일</label>
			<div class="col-lg-3">
				<input id="fromDate" type="date" class="form-control" id="leaveDay" name="leaveDay" value="<%=emp.getLeaveDay() %>">
			</div>
		</div>

		<div class="col-lg-offset-2 col-lg-7">
			<button class="btn btn-default" id="updateBtn" onclick="updateUser();">수정</button>
			<button class="btn btn-default" id="deleteBtn" onclick="deleteUser();">삭제</button>
			<div class="btn btn-default" id="goList" onclick="location.href='<%=request.getContextPath()%>/memberList.me'">목록으로</div>
		</div>
		
	</form>
</section>

<jsp:include page="/views/layout/layout-down.jsp" />
