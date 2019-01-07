<%@ page language="java" contentType="text/html; charset=UTF-8"
 	pageEncoding="UTF-8" import="java.util.*, com.semi.admin.user.model.vo.*, com.semi.common.vo.*"%>
<%
	request.setAttribute("title", "휴가 조회");
%>
<%
	ArrayList<LogOfVacation> list = (ArrayList<LogOfVacation>) request.getAttribute("list");
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	
	
%>
<jsp:include page="/views/layout/treeview/admin/layout-up.jsp" />
<link rel="stylesheet" type="text/css" href="/semi/assets/css/admin/userdetail.css">
<script type="text/javascript">
	var jsonData = treeviewJson.adminJson;
	var nodeName = "<%= request.getAttribute("title")%>";
	
	$(function(){
		$("#listArea td").mouseenter(function(){
			$(this).parent().css({"background" : "#F2F2F2", "cursor" : "pointer"});
		}).mouseout(function(){
			$(this).parent().css({"background" : "white"})
		}).click(function(){
			var num = $(this).parent().children().eq(0).text();
			
			console.log(num);
			
<%-- 			location.href="<%=request.getContextPath()%>/selectOne.me?num=" + num; --%>
		});
	
	$("#searchBtn").click(function() {
		var searchName = $("#searchName").val();
		
		$.ajax({
			url : "/semi/searchVacName.me",
			type : "post",
			data : {
					searchName : searchName
					},
			success : function(data) {
				console.log(data);
				resetTable(data);
				
			},
			error : function() {
				console.log("실패!");
			}
		});
	});
	
	function resetTable(data){
		console.log($("#listArea").not("#listHeader"))
		$("#listArea tr").not("#listHeader").remove(); // 초기화
		
		// html 그려주기
		if(data.length > 0){	// 배열의 크기
			var html = "";
			 for(var i = 0; i < data.length; i++){
				var empId = data[i].empId || "";
				var empName = data[i]["empName"] || "";
				var deptName = data[i].deptName || "";
				var totalDay = data[i].totalDay || "";
				var useStart = data[i].useStart || "";
				var useEnd = data[i].useEnd || "";
				
			 	html += "<tr>                             ";
				html += "	<td>" + empId + "</td>        ";
				html += "	<td>" + empName + "</td>      ";
				html += "	<td>" + deptName + "</td>     ";
				html += "	<td>" + totalDay + "</td>     ";
				html += "	<td>" + useStart + "</td>     ";
				html += "	<td>" + useEnd + "</td>       ";
				html += "</tr>                            ";
			
			 }
			 var header = $("#listArea").html();
			 var totalhtml = header + html;
			 $("#listArea").not("#listHeader").html(totalhtml);
		}	 
			 
	}
});
</script>

<section class="content">
	<div class="content-left">
		<div id="treeview"></div>
	</div>
	
	<div class="content-right container">
		<div>
			<div>
				<h1><%= request.getAttribute("title")%></h1>
			</div>
			
			<div class="form-inline">
				<input class="form-control mr-sm-2" type="search" placeholder="사원 이름을 입력하세요" aria-label="Search" id="searchName"> 
				<button class="btn btn-outline-success my-2 my-sm-0" id="searchBtn">Search</button>
			</div>
			<hr>
			
			<table class="table" id="listArea">
				<tr id="listHeader">
					<th>사원 번호</th>
					<th>부서</th>
					<th>이름</th>
					<th>승인자</th>
					<th>휴가 기간</th>
					<th>사용일</th>
					<th>잔여일</th>
					<th>승인일</th>
				</tr>
				
				<%
					for (LogOfVacation vac : list) {
				%>
				
				<tr>
					<td><%=vac.getEmpId()%></td>
					<td><%=vac.getDeptName()%></td>
					<td><%=vac.getEmpName()%></td>
					<td><%=vac.getApprEmpId()%></td>
					<td><%=vac.getUseStart()%> ~ <%=vac.getUseEnd() == null ? "" : vac.getUseEnd()%></td>
					<td><%=vac.getDays()%></td>
					<td></td>
					<td><%=vac.getUseVacAppDay()%></td>
					
					
				</tr>
				
				<%
					}
				%>
			</table>
		</div>
		<div class="text-center">
			<ul class="pagination">
			<button onclick="location.href='<%=request.getContextPath()%>/vacList.me?currentPage=1'"><<</button>
				<%
					if (currentPage <= 1){
				%>
					<button disabled><</button>
				<%
					} else {
				%>
					<button onclick="location.href='<%=request.getContextPath()%>/vacList.me?currentPage=<%=currentPage - 1%>'"><</button>
				<%
					}
				%>
				
				<%
				for (int p = startPage; p <= endPage; p++) {

						if (p == currentPage) {
				%>
				
						<li disabled><%= p %></li>
				<%
						} else {
				%>
						<button onclick="location.href='<%=request.getContextPath()%>/vacList.me?currentPage=<%= p %>'"><%= p %></button>
				<%
						}
				%>
				<%
					}
				%>
				
				
				<%
					if (currentPage >= maxPage) {
				%>
					<button disabled>></button>
				<%
					} else {
				%>
					<button onclick="location.href='<%=request.getContextPath()%>/vacList.me?currentPage=<%=currentPage + 1%>'">></button>
				<%
					}
				%>

				<button onclick="location.href='<%=request.getContextPath()%>/vacList.me?currentPage=<%=maxPage%>'">>></button>
				
			</ul>
		</div>
	</div>
	
	
</section>

<jsp:include page="/views/layout/treeview/admin/layout-down.jsp" />