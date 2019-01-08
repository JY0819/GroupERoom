<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
 import="java.util.*, com.semi.board.Free.model.vo.*, com.semi.admin.user.model.vo.*"%>
<%
	ArrayList<Free> list = (ArrayList<Free>)request.getAttribute("list");
	Employee loginUser = (Employee)session.getAttribute("loginUser");

	PageInfo pi = (PageInfo)request.getAttribute("pi");

	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

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
			<button type="button" id="writeBtn" class="btn btn-primary">작성하기</button>
			<!-- <button type="button" id="deleteBtn" class="btn btn-warning">삭제</button> -->
		</div>
		<br>
		<table class="table table-striped" id="listArea">
				<tr>
					
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			
	
		
			<% for(Free f : list){ %>
				 <tr>
					
					 <td><%=f.getBno() %><input type="hidden" name="fileName" value="<%=f.getFile02()%>"></td> 
					<td><%=f.getbTitle() %></td>
					<td><%=f.getWriterId() %></td>
					<td><%=f.getbDate() %></td>
					<td><%=f.getbClicks() %></td>
					 
					
				</tr>
 				<%System.out.println(f.getFile02());%>
					<%} %>
	
			<% %>
		</table>
		
		<form action="<%=request.getContextPath() %>/search.fr" method="get" >
		<div id="searchBtn" align="center">
    	<select name="searchCondition" >
			<option value="findName" selected>작성자</option>  
			<option value="findTitle" >글제목</option>  	
		    <option value="findContent" >글내용</option>  	
			
    	</select>
    	<input type="search" name="searchValue">
    	<button type="submit" class="btn btn-primary">검색</button>
    	
	</div>	
	</form>
	<br>
<div class="pagingArea" align="center">
<ul class="pagination">
<%-- <button onclick="location.href='<%=request.getContextPath()%>/selectList.fr?currentPage=1'"><<</button> --%>
<li><a href="<%=request.getContextPath()%>/selectList.fr?currentPage=1"><<</a></li>
​

<% if(currentPage <= 1){ %>
<script>console.log(<%=currentPage%>);</script>

<li><a><</a></li>
<% }else{ %>


 <li><a href="<%=request.getContextPath()%>/selectList.fr?currentPage=<%=currentPage - 1%>"><</a></li>
<% } %>

​

<% for(int p = startPage; p <= endPage; p++){ 

if(p == currentPage){

%>


<li><a><%= p %></a></li>
<% }else{ %>


<li><a href="<%=request.getContextPath()%>/selectList.fr?currentPage=<%= p %>"><%= p %></a></li>
<% } %>

​

<% } %>

​

​

<% if(currentPage >= maxPage){ %>


<li><a>></a></li>
<% }else{ %>


 <li><a href="<%=request.getContextPath()%>/selectList.fr?currentPage=<%=currentPage + 1%>">></a></li>
<% } %>

​


<li><a href="<%=request.getContextPath()%>/selectList.fr?currentPage=<%=maxPage%>">>></a></li>
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
			location.href="/semi/views/board/free/writeFree2.jsp";
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
			var fileName = $("input[name='fileName']").val();
			console.log(fileName);
			
			location.href="<%=request.getContextPath()%>/selectOne.fr?num="+num+"&fileName="+fileName;
		});
	});
</script>
<jsp:include page="/views/layout/treeview/board/layout-down.jsp" />