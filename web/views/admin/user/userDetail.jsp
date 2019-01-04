<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
	import="java.util.*, com.semi.admin.user.model.vo.*, com.semi.common.vo.*"%>
<%
	request.setAttribute("title", "사원 관리");
%>
<%
	Employee emp = (Employee) request.getAttribute("emp");
	ArrayList<Attachments> file = (ArrayList<Attachments>) request.getAttribute("file");
	Attachments userImg = file.get(0);
%>
<link rel="stylesheet" type="text/css" href="/semi/assets/css/admin/userdetail.css">
<jsp:include page="/views/layout/treeview/admin/layout-up.jsp" />

<script type="text/javascript">
	var jsonData = treeviewJson.adminJson;
	var nodeName = "<%= request.getAttribute("title")%>";
	
	$("#inputFileArea").hide();
	
	$("#contentImgArea").click(function(){
		$("#userImg").click();
	});
	
	function goList() {
		location.href="<%=request.getContextPath()%>/memberList.me";
	}
	
	function updateUser(){
<%-- 		$("#updateForm").attr("action", "<%=request.getContextPath()%>/updateDept.dp"); --%>
	}
	
	function deleteUser(){
		$("#userUpdateForm").attr("action", "<%=request.getContextPath()%>/deleteMember.me");
	}
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

		<form class="form-horizontal" id="userUpdateForm" method="post">
			
			<!-- 첨부파일 ** 이미지 미리보기 -->
			<div class="form-group" id="contentImgArea" align="center">
				<img id="userImg" width="200" height="160" src="<%=request.getContextPath() %>/assets/images/upload_EmpImg/<%=userImg.getAttachName()%>">
			</div>

			
			<!-- 회원 가입 사항 -->
			<div class="form-group">
				<label for="inputId" class="col-lg-2 control-label">사원번호</label>
				<div class="col-lg-3">
					<input type="text" class="form-control" name="userId" value="<%=emp.getEmpid() %>" readonly>
				</div>
				
				<label for="inputName" class="col-lg-1 control-label">이름</label>
				<div class="col-lg-3">
					<input type="text" class="form-control" value="<%=emp.getEmpName() %>" readonly>
				</div>
			</div>
			
			<div class="form-group">
				<label for="inputPassword" class="col-lg-2 control-label">비밀번호</label>
				<div class="col-lg-2">
					<input type="text" class="form-control" value="<%=emp.getEmpPwd() %>"readonly>
				</div>
				
				<label for="inputApprovePassword" class="col-lg-2 control-label">결재 비밀번호</label>
				<div class="col-lg-3">
					<input type="text" class="form-control" value="<%=emp.getApprovePwd() %>"readonly>
				</div>
			</div>
			
			<div class="form-group">
				<label for="inputGender" class="col-lg-2 control-label">성별</label>
				<div class="col-lg-2">
					<input type="text" class="form-control" value="<%=emp.getEmpGender() %>"readonly>
				</div>
				
				<label for="inputPhoneNumber" class="col-lg-2 control-label">휴대폰 번호</label>
				<div class="col-lg-3">
					<input type="tel" class="form-control" value="<%=emp.getEmpPhone() %>"readonly>
				</div>
			</div>
			
			<div class="form-group">
				<label for="inputAddress" class="col-lg-2 control-label">주소</label>
				<div class="col-lg-4">
					<input type="text" class="form-control" value="<%=emp.getEmpAddr() %>"readonly>
				</div>
				
				<label for="inputBirth" class="col-lg-1 control-label">생년월일</label>
				<div class="col-lg-2">
					<input id="fromDate" type="date" class="form-control" value="<%=emp.getEmpBirth() %>"readonly> 
				</div>
			</div>
			
			<div class="form-group">
				<label for="inputDept" class="col-lg-2 control-label">부서</label>
				<div class="col-lg-3">
					<input type="text" class="form-control" value="<%=emp.getDeptName() %>"readonly>
				</div>
				
				<label for="inputDept" class="col-lg-1 control-label">직책</label>
				<div class="col-lg-3">
					<input type="text" class="form-control" value="<%=emp.getPositionName() %>"readonly>
				</div>
			</div>
			
			<div class="form-group" id="divAdminYN">
				<label class="col-lg-2 control-label">관리자 여부</label>
				<div class="col-lg-3">
					<input type="text" class="form-control" value="<%=emp.getAdminAuthority() %>"readonly>
				</div>
				
				<label class="col-lg-1 control-label">퇴사 여부</label>
				<div class="col-lg-3">
					<input type="text" class="form-control" value="<%=emp.getWhetherOfRetire() %>"readonly>
				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-2 control-label">입사일</label>
				<div class="col-lg-3">
					<input id="fromDate" type="date" class="form-control" value="<%=emp.getEntryDay() %>"readonly>
				</div>
				
				<label class="col-lg-1 control-label">퇴사일</label>
				<div class="col-lg-3">
					<input id="fromDate" type="date" class="form-control" value="<%=emp.getLeaveDay() %>" readonly>
				</div>
			</div>

			<div class="form-group">
				<div class="col-lg-offset-2 col-lg-7">
					<button type="button" class="btn btn-default" id="updateUser" onclick="updateUser();">수정</button>
					<button type="button" class="btn btn-default" id="deleteUser" onclick="deleteUser();">삭제</button>
				</div>
			</div>
		</form>
			<div>
				<button class="btn btn-default" onclick="location.href='<%=request.getContextPath()%>/memberList.me'">목록으로</button>
			</div> 
		
	</div>
</section>

<jsp:include page="/views/layout/treeview/admin/layout-down.jsp" />
