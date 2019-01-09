<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="com.semi.admin.base.model.vo.*"%>
<%
	Department dept = (Department) request.getAttribute("dept");
%>
<link rel="stylesheet" type="text/css" href="/semi/assets/css/admin/base.css">
<jsp:include page="/views/layout/layout-up.jsp" />

<script type="text/javascript">
	function updateDept(){
		$("#updateForm").attr("action", "<%=request.getContextPath()%>/updateDept.dp");
	}
	function deleteDept(){
		$("#updateForm").attr("action", "<%=request.getContextPath()%>/deleteDept.dp");
	}
	
	$(document).ready(function(){
		var deptActive = "<%=dept.getDeptAct()%>";
		$("#deptActive").val(deptActive);
	});
</script>

<section class="content">
	<div class="custom_deptForm">
		<form id="updateForm" method="post">
			<table>
				<tr>
					<td><label for="inputDeptId" class="control-label">부서코드</label></td>
					<td><input type="text" class="form-control" id="deptId" name="deptId" value="<%=dept.getDeptId()%>" readonly></td>
				</tr>
	
				<tr>
					<td><label for="inputDeptName">부서명</label></td>
					<td><input type="text" class="form-control" id="deptName" name="deptName" value="<%=dept.getDeptName()%>" readonly></td>
				</tr>
	
				<tr>
					<td><label for="inputDeptActive">활성화</label></td>
					<td>
						<select class="form-control" id="deptActive" name="deptActive" >
							<option value="Y">활성화</option>
							<option value="N">비활성화</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td><label for="inputDeptNote">비고</label></td>
					<td><textarea id="deptNote" name="deptNote" rows="5" cols="20" class="form-control" ><%=dept.getDeptNote()%></textarea></td>
				</tr>
			</table>
	
			<div class="detailBtns">
				<button class="btn btn-default" id="updateBtn" onclick="updateDept();">수정</button>
				<button class="btn btn-default" id="deleteBtn" onclick="deleteDept();">삭제</button>
				<div class="btn btn-default" id="goList" onclick="location.href='<%=request.getContextPath()%>/depList.dp'">목록으로</div>
			</div>
			
		</form>
		
	</div>
</section>
<jsp:include page="/views/layout/layout-down.jsp" />