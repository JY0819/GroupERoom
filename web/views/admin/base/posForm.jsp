<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="/semi/assets/css/admin/base.css">
<link rel="stylesheet" type="text/css" href="/semi/assets/css/admin/base.css">
<jsp:include page="/views/layout/treeview/admin/layout-up.jsp" />

<script type="text/javascript">
	var jsonData = treeviewJson.adminJson;
	var nodeName = "직책 관리";
</script>

<section class="content">
	<div class="content-left">
		<div id="treeview"></div>
	</div>

	<div class="content-right container">
		<div class="custom_posForm">

			<form class="form-inline" id="addPosForm" method="post" action="<%=request.getContextPath()%>/insertPos.po">
				<table>
					<tr>
						<td><label for="inputPosId">직급 코드</label></td>
						<td><input type="text" class="form-control" id="posId" name="posId"></td>
					</tr>

					<tr>
						<td><label for="inputPosName">직급명</label></td>
						<td><input type="text" class="form-control" id="posName" name="posName"></td>
					</tr>

					<tr>
						<td><label for="inputPosNo">직책 순위</label></td>
						<td><input type="number" class="form-control" id="posNo" name="posNo"></td>
					</tr>

					<tr>
						<td><label for="inputPosActive">활성화</label></td>
						<td>
							<select class="form-control" id="posActive" name="posActive">
								<option value="Y" selected="selected">활성화</option>
								<option value="N">비활성화</option>
							</select>
						</td>
					</tr>

					<tr>
						<td><label for="inputPosNote">비고</label></td>
						<td><textarea id="posNote" name="posNote" rows="5" cols="20" class="form-control"></textarea></td>
					</tr>
				</table>


				<div class="posSaveBtn">
					<input type="submit" class="btn btn-default" id="saveBtn" value="저장" onclick="insertPos();">
				</div>
			</form>
		</div>
	</div>
	
	<script>
		function insertPos(){
			$("#addPosForm").submit();
		}
	</script>
</section>
<jsp:include page="/views/layout/treeview/admin/layout-down.jsp" />