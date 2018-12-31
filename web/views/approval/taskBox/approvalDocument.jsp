<%@page import="com.semi.admin.user.model.vo.Employee"%>
<%@page import="com.semi.approval.document.vo.MyDocument"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Employee employee = (Employee)session.getAttribute("loginUser");
	String[] docNumList = (String[])session.getAttribute("docNum");
	ArrayList<MyDocument> list = (ArrayList<MyDocument>)request.getAttribute("list");
%>
<jsp:include page="/views/layout/treeview/approval/layout-up.jsp" />
<link rel="stylesheet" type="text/css" href="/semi/assets/css/approval/taskBox.css">

<script>
	var jsonData = treeviewJson.approvalJson;
	var nodeName = "결재할 문서";
</script> 

<section class="content">

	<div class="content-left">
		<div id="treeview"></div>
	</div>

	<div class="content-right container">
		<button class="success">승인</button>
		<button class="return">반려</button>
		
		<table>
			<thead>
				<tr>
					<th><input type="checkbox" name="checkAll" id="checkAll"
						onclick="checkall();"></th>
					<th>번 호</th>
					<th>작 성 자</th>
					<th>부 서</th>
					<th>문 서 번 호</th>
					<th>제 목</th>
					<th>작 성 날 짜</th>
				</tr>
			</thead>
			<tbody>
			<% for(int i=0; i<list.size(); i++) { 
				   	if(list.get(i).getWriterNum() == employee.getEmpid()) {
				   		for(int j=0; j<docNumList.length; j++) {
				   			int listNum = list.get(i).getDocNum();
				   			int num = Integer.parseInt(docNumList[j]);
				   			if(listNum == num){
				%>
				<tr>
					<td><input type="checkbox" name="checkTd"
						style="height: 17px; width: 17px;"></td>
					<td><%= list.get(i).getNum() %></td>
					<td><%= list.get(i).getWriter() %></td>
					<td><%= list.get(i).getDeptName() %></td>
					<td><%= list.get(i).getDocNum() %></td>
					<td><%= list.get(i).getTitle() %></td>
					<td><%= list.get(i).getWriteDay() %></td>
				</tr>
				<% } %>
				<% } %>
				<% } %>
				<%} %>
			</tbody>

		</table>
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

</section>


<script>
	/*체크박스 조절*/
	function checkall() {
		if ($("#checkAll").is(':checked')) {
			$("input[name=checkRow]").prop("checked", true);
		} else {
			$("input[name=checkRow]").prop("checked", false);
		}
	}
</script>

<jsp:include page="/views/layout/treeview/approval/layout-down.jsp" />