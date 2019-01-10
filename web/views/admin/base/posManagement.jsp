<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*, com.semi.admin.base.model.vo.*"%>
<%-- <%
	request.setAttribute("title", "직책 관리");
%> --%>
<%
	ArrayList<Position> list = (ArrayList<Position>) request.getAttribute("list");
%>
<jsp:include page="/views/layout/treeview/admin/layout-up.jsp" />
<link rel="stylesheet" type="text/css" href="/semi/assets/css/admin/base.css">

<script type="text/javascript">
	function addPos() {
		location.href = "/semi/views/admin/base/posForm.jsp";
	}
	
	$(function(){
		$("#listArea td").mouseenter(function(){
			$(this).parent().css({"background" : "#F2F2F2", "cursor" : "pointer"});
		}).mouseout(function(){
			$(this).parent().css({"background" : "white"})
		}).click(function(){
			var num = $(this).parent().children().eq(0).text();
			
			console.log(num);
			
			location.href="<%=request.getContextPath()%>/selectOne.po?num=" + num;
			
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
				<h1>직책 관리</h1>
				<hr>
				<button type="button" class="btn btn-default" id="addPosBtn" onclick="addPos();">추가</button>
			</div>
			
			<div class="form-group">
			</div>
		</div>

		<div>
			<table class="table" id="listArea">
				<tr>
					<th>직책코드</th>
					<th>직책명</th>
					<th>직책 순위</th>
					<th>활성화 여부</th>
					<th>비고</th>
				</tr>

				<%
					for (Position p : list) {
				%>
				<tr>
					<td align="center"><%=p.getPositionId()%></td>
					<td align="center"><%=p.getPositionName()%></td>
					<td align="center"><%=p.getPositionNo()%></td>
					<td align="center"><%=p.getPositionAct()%></td>
					<td align="center"><%=p.getPositionNote()%></td>
				</tr>
				<%
					}
				%>
			</table>
		</div>

	</div>
</section>

<jsp:include page="/views/layout/treeview/admin/layout-down.jsp" />