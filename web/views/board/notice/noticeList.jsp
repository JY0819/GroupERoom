<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
import="java.util.*, com.semi.board.notice.model.vo.*, com.semi.admin.user.model.vo.*"%>

<%
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
	Employee loginUser = (Employee)session.getAttribute("loginUser");

	PageInfo pi = (PageInfo)request.getAttribute("pi");

	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
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
	var nodeName = "공지사항";
</script>

<section class="content">
	<div class="content-left">
		<div id="treeview"></div>
	</div>
	
	<div class="content-right container">
		<div id="title">
			<h1 align="left">| 공지사항 |</h1>
		</div>
		<% if(loginUser != null && loginUser.getEmpid()==2){ %>
		<div class="noticeListBtn">
			<button type="button" id="writeBtn" class="btn btn-primary">작성</button>
			<button type="button" id="deleteBtn" class="btn btn-warning">삭제</button>
		
		</div>
		<%} %>
		<br>
		<table class="table table-striped" id="listArea">
			
				<tr>
					<th><input type="checkbox" id="checkAll"></th>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			
	
					<% for(Notice n : list){ %>
				 <tr>
					<td><input type="checkbox" id="checkAll"></td>
					 <td><%=n.getBno() %></td> 
					<td><%=n.getbTitle() %></td>
					<td><%=n.getWriterId() %></td>
					<td><%=n.getbDate() %></td>
					<td><%=n.getbClicks() %></td>
				</tr>
					<%} %>
	
	
			
	
				
			
		</table>
		
		<div id="searchBtn" align="center">
    	<input type="search">
    	<button type="submit" class="btn btn-primary"><a href="searchViewFree.jsp" id="textBtn" >검색</a></button>
    	
	</div>	
	<br>
<div class="pagingArea" align="center">
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


	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
</section>

<script>
	$(function(){
		$("#writeBtn").click(function(){
			location.href="/semi/views/board/notice/insertNotice.jsp";
		});
	});
	
	
	$(function(){
		$("#listArea td").mouseenter(function(){
			$(this).parent().css({"color":"darkgrey", "cursor":"pointer"});
		
		
		}).mouseout(function(){
			$(this).parent().css({"color":"black"})
		
		}).click(function(){
			var num = $(this).parent().children().eq(1).text();//->글번호 가져오기
			console.log(num);
			
			location.href="<%=request.getContextPath()%>/selectOne.no?num="+num;
		});
	});
</script>
<jsp:include page="/views/layout/treeview/admin/layout-down.jsp" />