<%@page import="com.semi.approval.approve.model.vo.PageInfo"%>
<%@page import="com.semi.admin.user.model.vo.Employee"%>
<%@page import="com.semi.approval.document.vo.MyDocument"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Employee employee = (Employee)session.getAttribute("loginUser");
	ArrayList<MyDocument> list = (ArrayList<MyDocument>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>

<jsp:include page="/views/layout/treeview/approval/layout-up.jsp" />
<link rel="stylesheet" type="text/css"
	href="/semi/assets/css/approval/taskBox.css">

<script>
	var jsonData = treeviewJson.approvalJson;
	var nodeName = "문서 진행 현황";
</script>
<section class="content">
	<div class="content-left">
		<div id="treeview"></div>
	</div>
	<div class="content-right container">
		<div>
			<table>
				<thead>
				<tr>
					<th><input type="checkbox" name="checkAll" id="checkAlltr"
						onclick="checkAll();" style="height: 17px; width: 17px;"></th>
						<th>번 호</th>
						<th>작 성 자</th>
						<th>부 서</th>
						<th>문 서 번 호</th>
						<th>작 성 날 짜</th>
						<th>처 리 현 황</th>
					</tr>
				</thead>
				<tbody>
			<% if(list != null) { %>
			<% for(int i=0; i<list.size(); i++) { 
				   	if(list.get(i).getWriterNum() == employee.getEmpid()) {
				%>
				<tr>
					<td><input type="checkbox" name="checkTd"
						style="height: 17px; width: 17px;"></td>
					<td><%= list.get(i).getNum() %></td>
					<td><%= list.get(i).getWriter() %></td>
					<td><%= list.get(i).getDeptName() %></td>
					<td><%= list.get(i).getDocNum() %></td>
					<td><%= list.get(i).getWriteDay() %></td>
					<% if(list.get(i).getResult().equals("Y")) { %>
					<td>결재완료</td>
					<% }else { %>
					<td>결재대기중</td>
					<% } %>
				</tr>
				<% } %>
				<% } %>
				<% }else { %>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				<% } %>
				</tbody>
			</table>
			<div class="btnArea">
				<div class="paging" align="center">
			
				<ul class="pagination">
					<li><a onclick="location.href='<%=request.getContextPath()%>/selectStatusServlet.sss?currentPage=1'"><<</a></li> 
					<% if(currentPage <=1){ %>
					<li><a><</a></li> <!-- 비활성화 -->
					<%}else{%>
					<li><a onclick="location.href='<%=request.getContextPath()%>/selectStatusServlet.sss?currentPage=<%=currentPage - 1%>'"><</a></li> <!-- 하나 이전페이지로 이동 -->
					<%} %>
					<% for(int p = startPage; p <= endPage; p++){
					if(p == currentPage){
					
			
				
					%>
					<li ><a style="background-color: rgb(128, 181, 240) " ><%= p %></a></li>
					<%  }else{ %>
					<li><a onclick="location.href='<%=request.getContextPath()%>/selectStatusServlet.sss?currentPage=<%= p %>'"><%= p %></a></li>
			 
			
					<%         } %>
					<%} %>
					
					<%if(currentPage >= maxPage){ %>
					<li><a >></a></li> <!-- 비활성화 -->
					<%}else{%>
					<li><a onclick="location.href='<%=request.getContextPath()%>/selectStatusServlet.sss?currentPage=<%=currentPage + 1%>'">></a></li> <!-- 하나 다음페이지로 이동 -->
					<%} %>
					<li><a onclick="location.href='<%=request.getContextPath()%>/selectStatusServlet.sss?currentPage=<%=maxPage%>'">>></a></li>
				</ul>
				
			</div>
				<!-- <div class="paging" align="center">
					<ul class="pagination">
						<li><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
					</ul>
				</div> -->
			</div>
		</div>
	</div>
</section>
	<script>
	/*체크박스 조절*/
		function checkAll() {
			if ($("#checkAlltr").is(':checked')) {
				$("input[name=checkTd]").prop("checked", true);
				$("input[name=checkTd]").parent().parent().addClass("selected");
				
			} else {
				$("input[name=checkTd]").prop("checked", false);
				$("input[name=checkTd]").parent().parent().removeClass("selected");
			}
		}
		
		//체크시 색 바뀜
		 $("input:checkbox").on('click', function() { 
			if ( $(this).prop('checked') ) { 
			$(this).parent().parent().addClass("selected"); 
			} 
			else { 
			$(this).parent().parent().removeClass("selected"); 
			} 
		 }); 
	 </script>
<jsp:include page="/views/layout/treeview/approval/layout-down.jsp" />