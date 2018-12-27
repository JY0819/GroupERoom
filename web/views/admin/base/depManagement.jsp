<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setAttribute("title", "부서 관리");
%>
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
			<div>
				<h1><%= request.getAttribute("title")%></h1>
			</div>
			
			<div class="form-group">
				<div class="col-lg-offset-2 col-lg-10">
					<button type="button" class="btn btn-default" id="addDeptBtn" onclick="addDept();">추가</button>
				</div>
			</div>
		</div>
		
		<div>
			<table class="table">
				<thead>
					<tr>
						<th>번호</th>
						<th>부서코드</th>
						<th>부서명</th>
						<th>활성화 여부</th>
						<th>비고</th>
					</tr>
				</thead>
			</table>
		</div>
		
	</div>
	
	<script>
		function addDept(){
			location.href="/semi/views/admin/base/depForm.jsp";
		}
	</script>
</section>

<jsp:include page="/views/layout/treeview/admin/layout-down.jsp" />