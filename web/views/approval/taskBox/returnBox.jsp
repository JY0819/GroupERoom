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
	var nodeName = "반려함";
</script>
<section class="content">

	<div class="content-left">
		<div id="treeview"></div>
	</div>

	<div class="content-right container">

		<button class="moveBtn" >이동</button> 
		<button class="garbageBtn" onclick="sendTrash()">삭제</button>
		<table class="commonTable">
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
						<td><%= listCount - list.get(i).getNum() + 1%></td>
						<td><%= list.get(i).getWriter() %></td>
						<td><%= list.get(i).getDeptName() %></td>
						<td name="mouseent"><%= list.get(i).getDocNum() %></td>
						<td><%= list.get(i).getWriteDay() %></td>
						<% if(list.get(i).getResult().equals("N")) { %>
						<% String result = "반려"; %>
						<td><%= result %></td>
						<% } %> 
					</tr>
					<%
					} %>
					<% } %>
					<% }else { %>
					<tr>
						<td><input type="checkbox" name="checkTd"
							style="height: 17px; width: 17px;"></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					<% } %>
			</tbody>
		</table>
		<div class="btnArea">
		<div class="paging" align="center">
			
				<ul class="pagination">			
					<% for(int p = startPage; p <= endPage; p++){
					if(p == currentPage){
					
			
				
					%>
					<li ><a style="background-color: rgb(128, 181, 240) " ><%= p %></a></li>
					<%  }else{ %>
					<li><a onclick="location.href='<%=request.getContextPath()%>/returnBox.rb?currentPage=<%= p %>'"><%= p %></a></li>
			 
			
					<%         } %>
					<%} %>							
				</ul>
				
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
function sendTrash() {
	var sendArr = new Array();
	var checkbox = $("input[name=checkTd]:checked");
 	checkbox.each(function(i){
 		var tr = checkbox.parent().parent().eq(i);
 		var td = tr.children();
        var docNum = td.eq(4).text();
        sendArr.push(docNum);
        location.href="<%= request.getContextPath()%>/sendTrash.st?docNum=" + sendArr + ",";
	});
}
 $("td[name=mouseent]").mouseenter(function() {
	$(this).css({"cursor":"pointer"});
}).mouseout(function() {
	/* $(this).parent().css({"background":"white"}); */
}).click(function() {
	var docno = $(this).parent().children().eq(4).text();
	var check = "N";
	location.href="<%= request.getContextPath()%>/selectOne.so?docno=" + docno + "&check=" + check;
}); 
</script>
<jsp:include page="/views/layout/treeview/approval/layout-down.jsp" />