<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/semi/assets/css/admin/base.css">
<jsp:include page="/views/layout/layout-up.jsp" />

<section class="content">

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
					<td><label for="inputDeptActive">활성화 여부</label></td>
					<td>
						<select class="form-control" id="deptActive" name="deptActive">
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
				<input type="submit" class="btn btn-default" id="saveDeptBtn" value="저장" onclick="insertDept();">
			</div> 
			
		</form>
	</div>

	<script>
		function insertDept(){
			$("#addDeptForm").submit();
		}
	</script>
</section>
<jsp:include page="/views/layout/layout-down.jsp" />