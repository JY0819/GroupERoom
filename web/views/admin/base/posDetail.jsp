<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="com.semi.admin.base.model.vo.*"%>
<%
	Position p = (Position) request.getAttribute("p");
%>
<link rel="stylesheet" type="text/css" href="/semi/assets/css/admin/base.css">
<jsp:include page="/views/layout/treeview/admin/layout-up.jsp" />

<script type="text/javascript">
	var jsonData = treeviewJson.adminJson;
	var nodeName = "직책 관리";
	
	function updatePos(){
		$("#updateForm").attr("action", "<%=request.getContextPath()%>/updatePos.po");
	}
	function deletePos(){
		$("#updateForm").attr("action", "<%=request.getContextPath()%>/deletePos.po");
	}
	
	$(document).ready(function(){
		var posActive = "<%=p.getPositionAct()%>";
		$("#posActive").val(posActive);
	});
</script>

<section class="content">
	<div class="content-left">
		<div id="treeview"></div>
	</div>

	<div class="content-right container">
		<div class="custom_posForm">
		<form id="updateForm" method="post">
			<table>
				<tr>
					<td><label for="inputPosId">직급 코드</label></td>
					<td><input type="text" class="form-control" id="posId" name="posId" value="<%=p.getPositionId()%>" readonly></td>
				</tr>
	
				<tr>
					<td><label for="inputPosName">직급명</label></td>
					<td><input type="text" class="form-control" id="posName" name="posName" value="<%=p.getPositionName()%>" readonly></td>
				</tr>
	
				<tr>
					<td><label for="inputPosNo">직책 순위</label></td>
					<td><input type="number" class="form-control" id="posNo" name="posNo" value="<%=p.getPositionNo()%>"></td>
				</tr>
	
				<tr>
					<td><label for="inputPosActive">활성화</label></td>
					<td>
						<select class="form-control" id="posActive" name="posActive">
							<option value="Y">활성화</option>
							<option value="N">비활성화</option>
						</select>
					</td>
				</tr>
	
				<tr>
					<td><label for="inputPosNote">비고</label></td>
					<td><textarea id="posNote" name="posNote" rows="5" cols="20" class="form-control"><%=p.getPositionNote()%></textarea></td>
				</tr>
			</table>
			
			<div>
				<button class="btn btn-default" onclick="updatePos();">수정</button>
				<button class="btn btn-default" onclick="deletePos();">삭제</button>
			</div>
		
		</form>	
		
			<div>
				<button class="btn btn-default" onclick="location.href='<%=request.getContextPath()%>/posList.po'">목록으로</button>
			</div>
		</div>
	</div>
</section>
<jsp:include page="/views/layout/treeview/admin/layout-down.jsp" />