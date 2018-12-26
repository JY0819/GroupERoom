<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, com.semi.board.Free.model.vo.*"%>
<%
	ArrayList<Free> list = (ArrayList<Free>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<link rel="stylesheet" type="text/css" href="/semi/assets/css/admin/board.css">
<jsp:include page="/views/layout/treeview/board/layout-up.jsp" />

<script>
	
	var jsonData = treeviewJson.boardJson;
	var nodeName = "자유게시판";
</script>

<section class="content">
	<div class="content-left">
		<div id="treeview"></div>
	</div>
	
	<div class="content-right container">
		<div id="title">
			<h1 align="left"> | 자유게시판 |</h1>
		</div>
		<hr>
		
		<div class="noticeListBtn">
			<button type="button" id="writeBtn" class="btn btn-primary">작성</button>
			<button type="button" id="deleteBtn" class="btn btn-warning">삭제</button>
		</div>
		<table class="table table-striped">
			<thead>
				<tr>
					
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
	<!-- 으아d아 asdfdkddkdkk-->
			<tbody>
				<tr>
					<% for(Free f : list) {%>
					<td><%= f.getBno() %></td>
					<td><%= f.getbTitle() %></td>
					<td><%= f.getWriterId() %></td>
					<td><%= f.getbDate() %></td>
					<td><%= f.getbClicks() %></td>
				</tr>
					<% } %>
	
			</tbody>
		</table>
		
		<div id="searchBtn" align="center">
    	<input type="search">
    	<button type="submit" class="btn btn-primary"><a href="searchViewFree.jsp" id="textBtn" >검색</a></button>
    	
	</div>	
		
		<div class="pagingArea" align="center">
			<button onclick="location.href='<%=request.getContextPath()%>/selectList.fr?currentPage=1'"><<<</button>
			
			<% if(currentPage <= 1) {%>
			<button disabled><</button>
			<% }else{ %>
			<button onclick="location.href='<%=request.getContextPath() %>/selectList.fr?currentPage=<%=currentPage -1 %>'"><</button>
			<% } %>
			
			<% for(int p = startPage; p <= endPage; p++) {
				if(p == currentPage){
			%>
				<button disabled><%= p %></button>
			<% }else{ %>
				<button onclick="location.href='<%=request.getContextPath() %>/selectList.fr?currentPage=<%= p %>'"><%= p %></button>	
			<% 	} %>
			<% } %>
			
			<% if(currentPage >= maxPage){ %>
			<button disabled>></button>
			<% }else{ %>
			<button onclick="location.href='<%=request.getContextPath() %>/selectList.fr?currentPage=<%= currentPage +1 %>'">></button>
			<% } %>
			<button onclick="location.href='<%=request.getContextPath() %>/selectList.fr?currentPage=<%=maxPage %>'">>></button>
			
			
			
			
			
			<ul class="pagination">
				<li><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
			</ul>
		</div>
	</div>
</section>
<script>
	$(function(){
		$("#writeBtn").click(function(){
			location.href="/semi/views/board/free/writeFree.jsp";
		});
	});
</script>
<jsp:include page="/views/layout/treeview/board/layout-down.jsp" />