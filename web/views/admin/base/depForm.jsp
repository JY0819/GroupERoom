<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<link rel="stylesheet" type="text/css" href="/semi/assets/css/admin/base.css">
<jsp:include page="/views/layout/treeview/admin/layout-up.jsp" />

<script type="text/javascript">
	var jsonData = treeviewJson.adminJson;
	var nodeName = "부서 관리";
</script>

<section class="content">
	<div class="content-left">
		<div id="treeview"></div>
	</div>

	<div class="content-right container">
		<div class="custom_deptForm">
			<form class="form-inline" id="addDeptForm" method="post" action="<%=request.getContextPath()%>/insertDept.dp">
				<table>
					<tr>
						<td><label for="inputDeptId">부서코드</label></td>
						<td><input type="text" class="form-control" id="deptId" name="deptId"></td>
					</tr>
	
					<tr>
						<td><label for="inputDeptName">부서명</label></td>
						<td><input type="text" class="form-control" id="deptName" name="deptName"></td>
					</tr>
	
					<tr>
						<td><label for="inputDeptHead">부서장</label></td>
						<td><input type="text" class="form-control" id="deptHead" name="deptHead"></td>
					</tr>
	
					<tr>
						<td><label for="inputDeptActive">활성화 여부</label></td>
						<td>
							<select class="form-control" id="activeYN" name="activeYN">
								<option value="Y" selected="selected">활성화</option>
								<option value="N">비활성화</option>
							</select>
						</td>
					</tr>
					
					<tr>
						<td><label for="inputDeptNote">비고</label></td>
						<td><textarea id="deptNote" name="deptNote" rows="5" cols="20" class="form-control"></textarea></td>
					</tr>
				</table>
	
	
				<div class="deptSaveBtn">
					<input type="submit" class="btn btn-default" id="saveBtn" value="저장하기">
				</div> 
			</form>
		</div>
	</div>
</section>
<jsp:include page="/views/layout/treeview/admin/layout-down.jsp" />