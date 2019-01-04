<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
import="java.util.*, com.semi.board.team.model.vo.*, com.semi.admin.user.model.vo.*"%>

<%
	ArrayList<Team> list = (ArrayList<Team>)request.getAttribute("list");
	Employee loginUser = (Employee)session.getAttribute("loginUser");
	String searchValue = (String)request.getAttribute("searchValue");

	/* PageInfo pi = (PageInfo)request.getAttribute("pi");

	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage(); */
%>
<link rel="stylesheet" type="text/css" href="/semi/assets/css/admin/board.css">
<jsp:include page="/views/layout/treeview/admin/layout-up.jsp" />

<script>
	$(function(){
		$("#checkAll").click(function(){
			if($("#checkAll").prop("checked")){
				$("input[name=chk]").prop("checked", true);
			} else{
				$("input[name=chk]").prop("checked", false);
			}
		});
	});
	
	var jsonData = treeviewJson.boardJson;
	var nodeName = "부서게시판";
</script>

<section class="content">
	<div class="content-left">
		<div id="treeview"></div>
	</div>
	
	<div class="content-right container">
		<div id="title">
			<h1 align="left">| 부서게시판 |</h1>
				<h3>[<%=searchValue %>] 부서</h3>
		</div>
		
		<div class="noticeListBtn">
			<button type="button" id="writeBtn" class="btn btn-primary">작성</button>
		
		</div>
		
		<br>
		<table class="table table-striped" id="listArea">
			
				<tr>
					<!-- <th>부서</th>	 -->			
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			
	
					<% for(Team t : list){ %>
				 <tr>
					<%-- <td><%=t.getDeptId() %></td> --%>
					 <td><%=t.getBno() %></td> 
					<td><%=t.getbTitle() %></td>
					<td><%=t.getWriterId() %></td>
					<td><%=t.getbDate() %></td>
					<td><%=t.getbClicks() %></td>
				</tr>
					<%} %>
	
	
			
	
				
			
		</table>
		<form action="<%=request.getContextPath() %>/search.tm" method="get" >
		
		<div id="searchBtn" align="center">
    	<input type="search" name="searchValue">
    	<button type="submit" class="btn btn-primary">검색</button>
    	
	</div>	
	</form>
	<br>
<%-- <div class="pagingArea" align="center">
<ul class="pagination">

<li><a href="<%=request.getContextPath()%>/selectList.no?currentPage=1"><<</a></li>
​<% if(currentPage <= 1){ %>
<script>console.log(<%=currentPage%>);</script>

<li><a><</a></li>
<% }else{ %>


 <li><a href="<%=request.getContextPath()%>/selectList.no?currentPage=<%=currentPage - 1%>"><</a></li>
<% } %>

​

<% for(int p = startPage; p <= endPage; p++){ 

if(p == currentPage){

%>


<li><a><%= p %></a></li>
<% }else{ %>


<li><a href="<%=request.getContextPath()%>/selectList.no?currentPage=<%= p %>"><%= p %></a></li>
<% } %>

​

<% } %>

​

​

<% if(currentPage >= maxPage){ %>


<li><a>></a></li>
<% }else{ %>


 <li><a href="<%=request.getContextPath()%>/selectList.no?currentPage=<%=currentPage + 1%>">></a></li>
<% } %>

​


<li><a href="<%=request.getContextPath()%>/selectList.no?currentPage=<%=maxPage%>">>></a></li>
</ul>
​


	</div> --%>
	<br>
	<br>
	<br>
	<br>
	<br>
</section>

<script>
	$(function(){
		$("#writeBtn").click(function(){
			location.href="/semi/views/board/team/insertTeam.jsp";
		});
	});
	
	
	$(function(){
		$("#listArea td").mouseenter(function(){
			$(this).parent().css({"color":"darkgrey", "cursor":"pointer"});
		
		
		}).mouseout(function(){
			$(this).parent().css({"color":"black"})
		
		}).click(function(){
			var num = $(this).parent().children().eq(0).text();//->글번호 가져오기
			console.log(num);
			
			location.href="<%=request.getContextPath()%>/selectOne.tm?num="+num;
		});
	});
</script>
<jsp:include page="/views/layout/treeview/admin/layout-down.jsp" />