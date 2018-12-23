<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setAttribute("title", "부서 관리");
%>
<jsp:include page="/views/layout/treeview/admin/layout-up.jsp" />
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<script type="text/javascript">
	//참고 : https://jonmiles.github.io/bootstrap-treeview/
	var jsonData = treeviewJson.adminJson;
	var nodeName = "<%= request.getAttribute("title")%>";
</script>

<section class="content">
	<div class="content-left">
		<div id="treeview"></div>
	</div>
	
	<div class="content-right container">
		<div>
			<h1><%= request.getAttribute("title")%></h1>
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
</section>

<jsp:include page="/views/layout/treeview/admin/layout-down.jsp" />