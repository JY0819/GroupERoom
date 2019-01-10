<%@page import="com.semi.approval.approve.model.vo.PageInfo"%>
<%@page import="com.semi.admin.user.model.vo.Employee"%>
<%@page import="com.semi.approval.document.vo.MyDocument"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	ArrayList<MyDocument> list = (ArrayList<MyDocument>)request.getAttribute("list");
	Employee employee = (Employee)session.getAttribute("loginUser");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>

<jsp:include page="/views/layout/treeview/approval/layout-up.jsp" />
<link rel="stylesheet" type="text/css"
	href="/semi/assets/css/approval/taskBox.css">

<script>
	var jsonData = treeviewJson.approvalJson;
	var nodeName = "내 문서함";
	
	$(function () {
		setTimeout(function() {
			console.log("결재가 등록되어 알람을 뿌립니다.");
			console.log('대기...');
		 	console.log("0,apprIn")
			sendAlarm("0,apprIn");
		}, 3000);
	});
</script>
<section class="content">

	<div class="content-left">
		<div id="treeview"></div>
	</div>

	<div class="content-right container">

		<a href="/semi/views/approval/taskBox/choiceDocument.jsp"><button class="writeBtn">작성</button></a>
		<button class="sendBtn" onclick="send()">상신</button>
		<button class="deleteBtn" onclick="trash()">삭제</button>
		<table class="commonTable">
			<thead>
				<tr>
					<th><input type="checkbox" name="checkAll" id="checkAlltr"
						onclick="checkAll();" style="height: 17px; width: 17px;"></th>
					<th>번 호</th>
					<th>작 성 자</th>
					<th>부 서</th>
					<th>문 서 번 호</th>
					<th>작 성 날 짜</th>
				</tr>
			</thead>
			<tbody>
			<% if(list != null) { 
					int count = 1;%>
			<% for(int i=0; i<list.size(); i++) { 
				   	if(list.get(i).getWriterNum() == employee.getEmpid() && list.get(i).getSubmission().equals("N")) {
				   		
				%>
				<tr>
					<td><input type="checkbox" name="checkTd"
						style="height: 17px; width: 17px;"></td>
					<td><%= count %></td>
					<td><%= list.get(i).getWriter() %></td>
					<td><%= list.get(i).getDeptName() %></td>
					<td name="mouseent"><%= list.get(i).getDocNum() %></td>
					<td><%= list.get(i).getWriteDay() %></td>
				</tr>
				<% count++; 
				} %>
				<% } %>
				<% }else { %>
				<tr>
					<td><input type="checkbox" name="checkTd"
						style="height: 17px; width: 17px;"></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<% } %>
			</tbody>
		</table>
		<div class="btnArea">
			<div class="paging" align="center">
			
				<ul class="pagination">
					<li><a onclick="location.href='<%=request.getContextPath()%>/selectDocument.sd?currentPage=1'"><<</a></li> 
					<% if(currentPage <=1){ %>
					<li><a><</a></li> <!-- 비활성화 -->
					<%}else{%>
					<li><a onclick="location.href='<%=request.getContextPath()%>/selectDocument.sd?currentPage=<%=currentPage - 1%>'"><</a></li> <!-- 하나 이전페이지로 이동 -->
					<%} %>
					<% for(int p = startPage; p <= endPage; p++){
					if(p == currentPage){
					
			
				
					%>
					<li ><a style="background-color: rgb(128, 181, 240) " ><%= p %></a></li>
					<%  }else{ %>
					<li><a onclick="location.href='<%=request.getContextPath()%>/selectDocument.sd?currentPage=<%= p %>'"><%= p %></a></li>
			 
			
					<%         } %>
					<%} %>
					
					<%if(currentPage >= maxPage){ %>
					<li><a >></a></li> <!-- 비활성화 -->
					<%}else{%>
					<li><a onclick="location.href='<%=request.getContextPath()%>/selectDocument.sd?currentPage=<%=currentPage + 1%>'">></a></li> <!-- 하나 다음페이지로 이동 -->
					<%} %>
					<li><a onclick="location.href='<%=request.getContextPath()%>/selectDocument.sd?currentPage=<%=maxPage%>'">>></a></li>
				</ul>
				
			</div>
		</div>
		<!-- <div class="btnArea">
			<div class="paging" align="center">
				<ul class="pagination">
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
				</ul>
			</div>
		</div> -->
	</div>
</section>

<script>
	//전체 체크시 색 바뀜
	function checkAll() {
		if ($("#checkAlltr").is(':checked')) {
			$("input[name=checkTd]").prop("checked", true);
			$("input[name=checkTd]").parent().parent().addClass("selected");
			
		} else {
			$("input[name=checkTd]").prop("checked", false);
			$("input[name=checkTd]").parent().parent().removeClass("selected");
		}
	}
	
	//체크시 색 바뀜
	 $("input:checkbox").on('click', function() { 
		if ( $(this).prop('checked') ) { 
		$(this).parent().parent().addClass("selected"); 
		} 
		else { 
		$(this).parent().parent().removeClass("selected"); 
		} 
	 }); 
	 
	function send() {
		var sendArr = new Array();
		var checkbox = $("input[name=checkTd]:checked");
	 	checkbox.each(function(i){
	 		var tr = checkbox.parent().parent().eq(i);
	 		var td = tr.children();
	 		
            var docNum = td.eq(4).text();
            sendArr.push(docNum);
            location.href="<%= request.getContextPath()%>/apprSendDocument.asd?docNum=" + sendArr + ",";
		});
	}
	function trash() {
		var trashArr = new Array();
		var checkbox = $("input[name=checkTd]:checked");
	 	checkbox.each(function(i){
	 		var tr = checkbox.parent().parent().eq(i);
	 		var td = tr.children();
	 		
            var docNum = td.eq(4).text();
            trashArr.push(docNum);
            location.href="<%= request.getContextPath()%>/sendTrash.st?docNum=" + trashArr + ",";
	 	});
	}
	 $("td[name=mouseent]").mouseenter(function() {
			$(this).css({"cursor":"pointer"});
		}).mouseout(function() {
			/* $(this).parent().css({"background":"white"}); */
		}).click(function() {
			var docno = $(this).parent().children().eq(4).text();
			
			location.href="<%= request.getContextPath()%>/documentAppr.da?docno=" + docno;
		}); 
</script>
<jsp:include page="/views/layout/treeview/approval/layout-down.jsp" />