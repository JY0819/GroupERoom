<%@page import="com.semi.approval.approve.model.vo.Approval"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	ArrayList<Approval> list = (ArrayList<Approval>)request.getAttribute("list");
	//Approval a = new Approval();
	
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
				
				<tr>
					<td><input type="checkbox" name="checkTd"
						style="height: 17px; width: 17px;"></td>
					
					
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					

				</tr>
				
				<tr>
					<td><input type="checkbox" name="checkTd"
						style="height: 17px; width: 17px;"></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>

				</tr>
				<tr>
					<td><input type="checkbox" name="checkTd"
						style="height: 17px; width: 17px;"></td>
					<td></td>
					<td></td>
					<td></td>

					<td></td>


				</tr>


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
