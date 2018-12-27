<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
 import="java.util.*, com.semi.board.Free.model.vo.*, com.semi.admin.user.model.vo.*"%>
<%
	ArrayList<Free> list = (ArrayList<Free>)request.getAttribute("list");
	Employee loginUser = (Employee)session.getAttribute("loginUser");

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
					
					 <td><%=f.getBno() %></td> 
					<td><%=f.getbTitle() %></td>
					<td><%=f.getWriterId() %></td>
					<td><%=f.getbDate() %></td>
					<td><%=f.getbClicks() %></td>
				</tr>
					<%} %>
	
			
		</table>
		
		<div id="searchBtn" align="center">
    	<input type="search">
    	<button type="submit" class="btn btn-primary"><a href="searchViewFree.jsp" id="textBtn" >검색</a></button>
    	
	</div>	

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
	
	
	$(function(){
		$("#listArea td").mouseenter(function(){
			$(this).parent().css({"color":"darkgrey", "cursor":"pointer"});
		
		
		}).mouseout(function(){
			$(this).parent().css({"color":"black"})
		
		}).click(function(){
			var num = $(this).parent().children().eq(0).text();//->글번호 가져오기
			console.log(num);
			
			location.href="<%=request.getContextPath()%>/selectOne.fr?num="+num;
		});
	});
</script>
<jsp:include page="/views/layout/treeview/board/layout-down.jsp" />