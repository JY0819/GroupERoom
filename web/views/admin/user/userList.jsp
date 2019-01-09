<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*, com.semi.admin.user.model.vo.*, com.semi.common.vo.*"	%>
<%
	ArrayList<Employee> list = (ArrayList<Employee>) request.getAttribute("list");
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<jsp:include page="/views/layout/layout-up.jsp" />
<link rel="stylesheet" type="text/css" href="/semi/assets/css/admin/userdetail.css">
<script type="text/javascript">
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
		
		$("#searchBtn").click(function() {
			var searchName = $("#searchName").val();
			
			$.ajax({
				url : "/semi/searchName.me",
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
					var empid = data[i].empid || "";
					var empName = data[i]["empName"] || "";
					var deptName = data[i].deptName || "";
					var positionName = data[i].positionName || "";
					var empGender = data[i]["empGender"] || "";
					var empPhone = data[i]["empPhone"] || "";
					var whetherOfRetire = data[i]["whetherOfRetire"] || "";
					
				 	html += "<tr>                                    ";
					html += "	<td>" + empid + "</td>               ";
					html += "	<td>" + empName + "</td>             ";
					html += "	<td>" + deptName + "</td>            ";
					html += "	<td>" + positionName + "</td>        ";
					html += "	<td>" + empGender + "</td>           ";
					html += "	<td>" + empPhone + "</td>            ";
					html += "	<td>" + whetherOfRetire + "</td>     ";
					html += "</tr>                                   ";
				
				 }
				 var header = $("#listArea").html();
				 var totalhtml = header + html;
				 $("#listArea").not("#listHeader").html(totalhtml);
			}	 
				 
		}
	});
</script>

<section class="content">
	<div>
		<div>
			<h1>사원 조회</h1>
		</div>

		<div class="form-inline">
			<input class="form-control mr-sm-2" type="search" placeholder="사원 이름을 입력하세요" aria-label="Search" id="searchName"> 
			<button class="btn btn-outline-success my-2 my-sm-0" id="searchBtn">Search</button>
		</div>

		<hr>
		<table class="table" id= "listArea">
			<tr id="listHeader">
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
	
	<div class="text-center">
		<ul class="pagination">
			<button onclick="location.href='<%=request.getContextPath()%>/memberList.me?currentPage=1'"><<</button>
			<%
				if (currentPage <= 1){
			%>
				<button disabled><</button>
			<%
				} else {
			%>
				<button onclick="location.href='<%=request.getContextPath()%>/memberList.me?currentPage=<%=currentPage - 1%>'"><</button>
			<%
				}
			%>
			
			<%
			for (int p = startPage; p <= endPage; p++) {

					if (p == currentPage) {
			%>
			
					<button disabled><%= p %></button>
			<%
					} else {
			%>
					<button onclick="location.href='<%=request.getContextPath()%>/memberList.me?currentPage=<%= p %>'"><%= p %></button>
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
				<button onclick="location.href='<%=request.getContextPath()%>/memberList.me?currentPage=<%=currentPage + 1%>'">></button>
			<%
				}
			%>

			<button onclick="location.href='<%=request.getContextPath()%>/memberList.me?currentPage=<%=maxPage%>'">>></button>
			
			
			<!-- 
			<li><a href="#"><<</a></li>
			<li><a href="#"><</a></li>
			<li><a href="#"></a></li>
			<li><a href="#">></a></li>
			<li><a href="#">>></a></li> -->
		</ul>
	</div>
	
</section>

<jsp:include page="/views/layout/layout-down.jsp" />