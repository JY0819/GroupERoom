<%@page import="com.semi.approval.approve.model.vo.ApprLine"%>
<%@page import="com.semi.admin.user.model.vo.Employee"%>
<%@page import="com.semi.approval.approve.model.vo.Approval"%>
<%@page import="java.util.ArrayList"%>	
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	ArrayList<Approval> list = (ArrayList<Approval>)request.getAttribute("list");
	ArrayList<ApprLine> line = (ArrayList<ApprLine>)request.getAttribute("line");
	Employee employee = (Employee)session.getAttribute("loginUser");
	
	
%>



<jsp:include page="/views/layout/treeview/approval/layout-up.jsp" />
<link rel="stylesheet" type="text/css"
	href="/semi/assets/css/approval/taskBox.css">

<script>
	var jsonData = treeviewJson.approvalJson;
	var nodeName = "휴지통";
</script>
<section class="content">

	<div class="content-left">
		<div id="treeview"></div>
	</div>

	<div class="content-right container">
		

		<button class="move">이동</button>
		<button class="delete">삭제</button>
		<div class="tableArea">
		<%-- <form action="<%=request.getContextPath() %>/selecttrash.tr" method="get"> --%>
		<table>
			<thead>
				<tr>
					<th><input type="checkbox" name="checkAll" id="checkAll"
						onclick="checkAll();" style="height: 17px; width: 17px;"></th>
					<th>작 성 자</th>
					<th>처 리 자</th>
					<th>문 서 번 호</th>
					<th>결 과</th>
					
				</tr>
			</thead>
			
			<tbody>
					
					<% for(Approval a : list) {%>
						<%if(employee.getEmpName().equals(a.getApprWriter()) ){ %>
						<tr>
						<td><input type="checkbox" name="checkTd"
							style="height: 17px; width: 17px;" ></td>
						<td><%= a.getApprWriter() %></td>
						<%for(ApprLine l : line){ %>
						<%if(a.getApprNo()==l.getApprNo()) {%>
						<td><%=l.getApprEmpId() %></td>
						<%}else{ %>
						<td></td>
						<%} %>
						<td><%= a.getApprNo() %></td>
						<% if(a.getApprYn().equals("N")) {%>
						<td><%= a.getApprYn().replaceAll("N", "승인대기중") %></td>
						<%}else{ %>
						<td><%= a.getApprYn().replaceAll("Y", "승인") %>
						<%} %>
						</tr>
						<%} %>
					<%} %>
					<%} %>

			</tbody>

		</table>
		<!-- </form> -->
		</div>
		<div class="btnArea">
			<div class="paging" align="center">
				<ul class="pagination">
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
				</ul>
			</div>
		</div>
	</div>

	<script>
		
		function checkAll() {
			if ($("#checkAll").is(':checked')) {
				$("input[name=checkTd]").prop("checked", true);
			} else {
				$("input[name=checkTd]").prop("checked", false);
			}
		}
		
	

		

		
	</script>
</section>
<jsp:include page="/views/layout/treeview/approval/layout-down.jsp" />
