<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setAttribute("title", "휴가 조회");
%>
<jsp:include page="/views/layout/treeview/admin/layout-up.jsp" />
<script type="text/javascript">
	var jsonData = treeviewJson.adminJson;
	var nodeName = "<%=request.getAttribute("title")%>";
</script>

<section class="content">
	<div class="content-left">
		<div id="treeview"></div>
	</div>
	
	<div class="content-right container">
		<div>
			<h1><%= request.getAttribute("title")%></h1>
		</div>
		
		<table class="table" id="listArea">
			<tr id="listHeader">
				<th>사원 번호</th>
				<th>이름</th>
				<th>직책</th>
			</tr>
			
			<tr>
<%-- 				<td><%=vac.getEmpId()%></td> --%>
			</tr>
		</table>
	</div>
	
	
</section>
<jsp:include page="/views/layout/treeview/admin/layout-down.jsp" />