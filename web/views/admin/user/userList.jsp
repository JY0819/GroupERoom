<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*, com.semi.admin.user.model.vo.*"	%>
<%
	ArrayList<Employee> list = (ArrayList<Employee>) request.getAttribute("list");
%>
<jsp:include page="/views/layout/treeview/admin/layout-up.jsp" />

<script type="text/javascript">
	var jsonData = treeviewJson.adminJson;
	var nodeName = "사원 관리";
	
	$(function(){
		$("#listArea td").mouseenter(function(){
			$(this).parent().css({"background" : "#F2F2F2", "cursor" : "pointer"});
		}).mouseout(function(){
			$(this).parent().css({"background" : "white"})
		}).click(function(){
			var num = $(this).parent().children().eq(0).text();
			
			console.log(num);
			
			location.href="<%=request.getContextPath()%>/selectOne.me?num=" + num;
			
		});
	});
</script>

<section class="content">
	<div class="content-left">
		<div id="treeview"></div>
	</div>
	
	<div class="content-right container">
		<div>
			<div>
				<h1>사원 관리</h1>
			</div>
			
			<table class="table" id= "listArea">
				<tr>
					<th>사원 번호</th>
					<th>이름</th>
					<th>부서</th>
					<th>직책</th>
					<th>성별</th>
					<th>연락처</th>
					<th>퇴사여부</th>
				</tr>
				
				<%
					for (Employee emp : list) {
				%>
				
				<tr>
					<td><%=emp.getEmpid()%></td>
					<td><%=emp.getEmpName()%></td>
					<td><%=emp.getDeptName()%></td>
					<td><%=emp.getPositionName()%></td>
					<td><%=emp.getEmpGender()%></td>
					<td><%=emp.getEmpPhone()%></td>
					<td><%=emp.getWhetherOfRetire()%></td>
				</tr>
				
				<%
					}
				%>
			</table>
		</div>
	</div>
	
	<div class="text-center">
		<ul class="pagination">
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
		</ul>
	</div>
</section>

<jsp:include page="/views/layout/treeview/admin/layout-down.jsp" />