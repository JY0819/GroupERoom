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
				<img id="userImg" width="160" height="160" src = "<%=request.getContextPath() %>/semi/assets/images/upload_EmpImg/<%=userImg.getAttachName() %>>">
			</div>
			
			
			<!-- 회원 가입 사항 -->
			<div class="form-group" id="divId">
				<label for="inputId" class="col-lg-2 control-label">사원번호</label>
				<div class="col-lg-8">
					<input type="text" class="form-control" value="<%=emp.getEmpid() %>">
				</div>
			</div>
			
			<div class="form-group" id="divName">
				<label for="inputName" class="col-lg-2 control-label">이름</label>
				<div class="col-lg-8">
					<input type="text" class="form-control" value="<%=emp.getEmpName() %>">
				</div>
			</div>
			
			<div class="form-group" id="divPassword">
				<label for="inputPassword" class="col-lg-2 control-label">비밀번호</label>
				<div class="col-lg-8">
					<input type="password" class="form-control" value="<%=emp.getEmpPwd() %>">
				</div>
			</div>
			
			<div class="form-group">
				<label for="inputGender" class="col-lg-2 control-label">성별</label>
				<div class="col-lg-8">
					<select class="form-control" id="gender" name="gender" >
						<option value="M">남</option>
						<option value="F">여</option>
					</select>
				</div>
			</div>
			
			<div class="form-group" id="divPhoneNumber">
				<label for="inputPhoneNumber" class="col-lg-2 control-label">휴대폰 번호</label>
				<div class="col-lg-8">
					<input type="tel" class="form-control" value="<%=emp.getEmpPhone() %>">
				</div>
			</div>
			
			<div class="form-group" id="divAddress">
				<label for="inputAddress" class="col-lg-2 control-label">주소</label>
				<div class="col-lg-8">
					<input type="text" class="form-control" value="<%=emp.getEmpAddr() %>">
				</div>
			</div>
			
			<div class="form-group" id="divBirth">
				<label for="inputBirth" class="col-lg-2 control-label">생년월일</label>
				<div class="col-lg-8">
					<input id="fromDate" type="date" class="form-control" value="<%=emp.getEmpBirth() %>"> 
				</div>
			</div>
			
			<div class="form-group" id="divEntryDay">
				<label for="inputEntryDay" class="col-lg-2 control-label">입사일</label>
				<div class="col-lg-8">
					<input id="fromDate" type="date" class="form-control" value="<%=emp.getEntryDay() %>">
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
					<input type="password" class="form-control" value="<%=emp.getApprovePwd() %>">
				</div>
			</div>



			<div class="form-group">
				<div class="col-lg-offset-2 col-lg-8">
					<button type="button" class="btn btn-default" id="goList" onclick="goList();">목록으로</button>
				</div>
			</div>
		</form>

		<script>
			function goMain() {
				location.href="<%=request.getContextPath()%>/memberList.me.jsp";
			}
		
		</script>
	

		
	<!-- 	<script>
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
		</script> -->
		
	</div>
</section>

<jsp:include page="/views/layout/treeview/admin/layout-down.jsp" />
