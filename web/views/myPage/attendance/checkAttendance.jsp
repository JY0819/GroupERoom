<%@page import="com.semi.myPage.model.Etc.vo.PageInfo"%>
<%@page import="com.semi.myPage.model.Etc.vo.Attend"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% 
	ArrayList<Attend> list = (ArrayList<Attend>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	
	int count = 1;
	boolean exist = false;
	if(list.size() == 0){
		exist = false;
	}else{
		exist = true;
	}
%>

<jsp:include page="/views/layout/treeview/mypage/layout-up.jsp" />

<style>
.btn{
	text-align: center;
	background-color: #205181;
	padding: 5px;
	color:white;
	border-radius: 10px;
	width: 120px;
	height: 40px;
}
#btn1{
	margin-bottom: 20px;
}
#btn2{
	margin-left: 20px;
	margin-bottom: 20px;
}
.line{
	text-align: center;
}
/* .line{
	border: 2px solid skyblue;
	border-collapse: collapse;
	padding: 8px;
	text-align: center;
}
#messageList{
	width: 700px;
}
#alignDiv{
	margin-top: 80px;
} */
</style>

<script>
	var jsonData = treeviewJson.myPageJson;
	var nodeName = "근태조회";
</script>

<section class="content">

	<div class="content-left">
		<div id="treeview"></div>
	</div>

	<div class="content-right container">
		<div id="title">
			<h1 align="left">근태 조회</h1>
		</div>
		<hr>
	
		<form action="" method="post" id="formId">
		<div align="center" id="alignDiv">
		<table style="width: 100%"><tr><td>
			<table class="table table-striped" id="listArea" align="center">
				<% if(exist) { %>
				<tr>
					<th class="line"></th>
					<th class="line">이름</th>
					<th class="line" style="width: 250px;">출근 시간</th>
					<th class="line" style="width: 250px;">퇴근 시간</th>
				</tr>
				<% 	for(Attend at : list) { %>
					<% if(at.getGetOff() != null) { %>
				<tr>
					<td class="line"><%= listCount - at.getRnum() + 1 %></td>
					<td class="line"><%= at.getEmpName() %></td>
					<td class="line"><%= at.getAttendance() %> <%= at.getAttendanceT() %></td>
					<td class="line"><%= at.getGetOff() %> <%= at.getGetOffT() %></td>
				</tr>
					<% } else { %>
				<tr>
					<td class="line"><%= listCount - at.getRnum() + 1 %></td>
					<td class="line"><%= at.getEmpName() %></td>
					<td class="line"><%= at.getAttendance() %> <%= at.getAttendanceT() %></td>
					<td class="line"></td>
				</tr>
				<% 		count++; %>
				<% 	   } %>
				<% } %>
				<% } else { %>
				<tr>
					<th class="line" colspan="4"><p align="center">출근 내역이 없습니다!</p></th>
				</tr>
				<% } %>
			</table>
		</td></tr></table>
			<div class="paging" align="center">
				<ul class="pagination">
					
					<% for(int p = startPage; p <= endPage; p++) {
							if(p == currentPage) {
					%>
							<li><a href="#"><%= p %></a></li>
					<%		} else { %>
							<li><a href="<%=request.getContextPath()%>/chkAttend?currentPage=<%= p %>"><%= p %></a></li>
					<%		} %>
					
					<% } %>

				</ul>
			</div>
		</div>
		</form>
	</div>
</section>

<script type="text/javascript">
	// 전체선택 쿼리
	$(document).ready(function() {
		$("#all").click(function() {
			if ($("#all").prop("checked")) {
				$("input[name=chkList]").prop("checked", true);
			} else {
				$("input[name=chkList]").prop("checked", false);
			}
		});
	});
</script>
<jsp:include page="/views/layout/treeview/mypage/layout-down.jsp" />