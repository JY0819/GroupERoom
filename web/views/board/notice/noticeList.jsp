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
<%if(loginUser.getEmpName() !=null){ %>
<section class="content">
	<div class="content-left">
		<div id="treeview"></div>
	</div>
	
	<div class="content-right container">
		<div id="title">
			<h1 align="left">| 공지사항 |</h1>
		</div>
		<% if(loginUser != null && loginUser.getAdminAuthority().equals("Y")){ %>
		
		<div class="noticeListBtn">
		
			<button type="button" id="writeBtn" class="btn btn-primary">작성하기</button>
 			<button type="button" id="deleteBtn" class="btn btn-warning">삭제</button>
 		
		</div>
		<%} %>
		<br>
		<form action="" id="listForm" name="form1" method="post">
		<table class="table table-striped" id="listArea">
			<thead>
				<tr>
					<th><input type="checkbox" name="checkAll" id="th_checkAll"/></th>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
		</thead>

		<tbody>
	
					<% for(Notice n : list){ %>
				 <tr>
					<td><input type="checkbox" name="checkRow"  value="<%=n.getBno() %>"  /></td>
					 <td><input type="hidden" name="bno"><%=n.getBno() %><input type="hidden" name="fileName" value="<%=n.getFile02()%>"></td> 
					<td class="realTitle"><%=n.getbTitle() %></td>
					<td><%=n.getWriterId() %></td>
					<td><%=n.getbDate() %></td>
					<td><%=n.getbClicks() %></td>
				</tr>
					<%System.out.println(n.getFile02());%>
				
					<%} %>
		
			</tbody>
		</table>
		</form>
		<script>
		$("#th_checkAll").click(function(){
			if($("#th_checkAll").prop("checked")){
				$("input[name=checkRow]").prop("checked", true);
			}else{
				$("input[name=checkRow]").prop("checked", false);
			}
		});
		</script>
		
		<form action="<%=request.getContextPath() %>/search.no" method="get" >
		
		<div id="searchBtn" align="center">
		<select name="searchCondition" >
			<option value="findTitle" selected>글제목</option>  
			<option value="findContent" >글내용</option>  	
    	</select>
    	<input type="search" name="searchValue">
    	<button type="submit" class="btn btn-primary">검색</button>
    	
	</div>	
	</form>
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
<%}else{ %>
	<h3>로그인 후 이용해주세요</h3>
<%} %>
<script>

	
		$(function(){
			$("#writeBtn").click(function(){
				location.href="/semi/views/board/notice/insertNotice.jsp";
			});
		});
		
		
		

		
		
	$(function(){
		$(".realTitle").mouseenter(function(){
			$(this).css({"color":"darkgrey", "cursor":"pointer"});
		
		
		}).mouseout(function(){
			$(this).css({"color":"black"})
		
		}).click(function(){
			var num = $(this).parent().children().eq(1).text();//->글번호 가져오기
			console.log(num);
			var fileName =  $(this).parent().children().eq(1).children("input[name='fileName']").val();
			console.log(fileName);
			
			
			location.href="<%=request.getContextPath()%>/selectOne.no?num="+num+"&fileName="+fileName;
		});
	});
	
	$(function(){
		$("#deleteBtn").click(function(){
			var num = $("tbody").children().children().eq(1).text();
			console.log(num);
			
				alert('해당 게시물이 삭제되었습니다')
				 $("#listForm").attr("action", "<%=request.getContextPath()%>/deleteNotice2.no?num="+num);
					$("#listForm").submit();
			
			
			
				
 		<%-- var result = confirm('삭제 하시겠습니까?');
		if(result){
			$("#formId").attr("action", "<%=request.getContextPath()%>/deleteNotice2.no?num="+num);
			$("#formId").submit();
			
 			location.href='<%=request.getContextPath()%>/deleteNotice2.no?num="+num"&checkList="+checkList;
 		}else{
			window.location.reload();
		}--%>
		}); 
	});
       
	$(function () {
		setTimeout(function() {
			sendAlarm("0" + ",board");
		}, 3000);
	}); 
      
</script>
<jsp:include page="/views/layout/treeview/admin/layout-down.jsp" />