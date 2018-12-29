<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*, com.semi.admin.base.model.vo.*"%>
<%-- <%
	request.setAttribute("title", "직책 관리");
%> --%>
<%
	ArrayList<Position> list = (ArrayList<Position>) request.getAttribute("list");
%>
<jsp:include page="/views/layout/treeview/admin/layout-up.jsp" />

<script type="text/javascript">
	//참고 : https://jonmiles.github.io/bootstrap-treeview/
	var jsonData = treeviewJson.adminJson;
	var nodeName = "직책 관리";
</script>

<section class="content">
	<div class="content-left">
		<div id="treeview"></div>
	</div>

	<div class="content-right container">
		<div>
			<div>
				<h1>직책 관리</h1>
			</div>

			<div class="form-group">
				<div class="col-lg-offset-2 col-lg-10">
					<button type="button" class="btn btn-default" id="addPosBtn"
						onclick="addPos();">추가</button>
				</div>
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
					<td><%=p.getPositionId()%></td>
					<td><%=p.getPositionName()%></td>
					<td><%=p.getPositionNo()%></td>
					<td><%=p.getPositionAct()%></td>
					<td><%=p.getPositionNote()%></td>
				</tr>
				<%
					}
				%>
			</table>
		</div>

	</div>

	<script>
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
		
/* 		$(function(){
			$("#listArea td").click(function(){
				$('div.modal').modal({
					remote : 'posDetail.jsp';
				});
			});
		});
 */
	</script>
</section>

<jsp:include page="/views/layout/treeview/admin/layout-down.jsp" />