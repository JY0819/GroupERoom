<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
 import="java.util.*, com.semi.board.team.model.vo.*, com.semi.admin.user.model.vo.*"%>
<%
	ArrayList<Team> list = (ArrayList<Team>)request.getAttribute("list");
	Employee loginUser = (Employee)session.getAttribute("loginUser");
	

%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="/semi/assets/css/admin/board.css">
<jsp:include page="/views/layout/treeview/board/layout-up.jsp" />

<script>
	
	var jsonData = treeviewJson.boardJson;
	var nodeName = "부서게시판";
</script>

<section class="content">
	<div class="content-left">
		<div id="treeview"></div>
	</div>
	
	<div class="content-right container">
	
		
		
    		<h3 align="center">부서코드를 입력하세요</h3>
    		<br>
    			<form action="<%=request.getContextPath() %>/search.tm" method="get" >
		
		<div id="searchBtn" align="center">
    	<input type="search" name="searchValue">
    	<button type="submit" class="btn btn-primary">확인</button>
    	
	</div>	
	</form>
    	
	</div>	

	<br>
	<br>
	<br>
	<br>
	<br>

</section>
<script>
	
	
	
</script>
<jsp:include page="/views/layout/treeview/board/layout-down.jsp" />