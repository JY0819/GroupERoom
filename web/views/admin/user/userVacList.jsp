<%@ page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
 	pageEncoding="UTF-8" import="java.util.*, com.semi.admin.user.model.vo.*, com.semi.common.vo.*"%>
<%
	ArrayList<LogOfVacation> list = (ArrayList<LogOfVacation>) request.getAttribute("list");
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
			
<%-- 			location.href="<%=request.getContextPath()%>/selectOne.va?num=" + num; --%>
		});
	
	$("#searchBtn").click(function() {
		var searchName = $("#searchName").val();
		
		$.ajax({
			url : "/semi/searchVacName.va", // 요청할 서블릿 매핑 주소
			type : "post",	// 방식 get, post
			data : {
					searchName : searchName	// 전달 파라미터 키 : 값 
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

		if(data.length > 0){	// 배열의 크기
			var html = "";
			 for(var i = 0; i < data.length; i++){
				 
				var empId = data[i].empId || "";
				var deptName = data[i].deptName || "";
				var empName = data[i]["empName"] || "";
				var apprEmpId = data[i].apprEmpId || "";
				var useStart = data[i].useStart || "";
				var useEnd = data[i].useEnd || "";
				var days = data[i].days || "";
				var useVacAppDay = data[i].useVacAppDay || "";
				
				html += "<tr>                               ";
				html += "	<td>" + empId + "</td>          ";
				html += "	<td>" + deptName + "</td>       ";
				html += "	<td>" + empName + "</td>      	";
				html += "	<td>" + apprEmpId + "</td>     	";
				html += "	<td>" + useStart + " ~ " + useEnd + "</td>		";
				html += "	<td>" + days + "</td>    		";
				html += "	<td>" + useVacAppDay + "</td>   ";
				html += "</tr>                              ";
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
			<h1>휴가 조회</h1>
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
				<th>승인일</th>
			</tr>
				
			<%
				String getDays = "";
				String totDays = "";
				SimpleDateFormat sdft = new SimpleDateFormat("yyyy-MM-dd");
				
				for (LogOfVacation vac : list) {
					getDays = "";
					totDays = "";
					Date sta_ymd = vac.getUseStart(); 	
					Date end_ymd = vac.getUseEnd(); 	

					if(vac.getType().equals("반차")) {
						getDays = "0.5";
					}else{
						if(sta_ymd.equals(end_ymd)){
							getDays = "1";
						}else{
							getDays = Integer.toString(vac.getDays());
						}
					}

					if (end_ymd == null) 
					{
						totDays = sdft.format(sta_ymd);	
					} else {	
						totDays = sdft.format(sta_ymd) + " ~ " + sdft.format(end_ymd);
					}
			%>
				<tr>
					<td><%=vac.getEmpId()%></td>
					<td><%=vac.getDeptName()%></td>
					<td><%=vac.getEmpName()%></td>
					<td><%=vac.getApprEmpId()%></td>
					<td><%=totDays %></td>
					<td><%=getDays%></td>
					<td><%=vac.getUseVacAppDay()%></td>
				</tr>
			<%
				}
			%>

		</table>
	</div>
	<div class="text-center">
		<ul class="pagination">
		<button onclick="location.href='<%=request.getContextPath()%>/vacList.va?currentPage=1'"><<</button>
			<%
				if (currentPage <= 1){
			%>
				<button disabled><</button>
			<%
				} else {
			%>
				<button onclick="location.href='<%=request.getContextPath()%>/vacList.va?currentPage=<%=currentPage - 1%>'"><</button>
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
					<button onclick="location.href='<%=request.getContextPath()%>/vacList.va?currentPage=<%= p %>'"><%= p %></button>
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
				<button onclick="location.href='<%=request.getContextPath()%>/vacList.va?currentPage=<%=currentPage + 1%>'">></button>
			<%
				}
			%>

			<button onclick="location.href='<%=request.getContextPath()%>/vacList.va?currentPage=<%=maxPage%>'">>></button>
			
		</ul>
	</div>
</section>

<jsp:include page="/views/layout/layout-down.jsp" />