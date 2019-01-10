<%@page import="com.semi.approval.approve.model.vo.PageInfo"%>
<%@page import="com.semi.approval.approve.model.vo.ApprLine"%>
<%@page import="com.semi.admin.user.model.vo.Employee"%>
<%@page import="com.semi.approval.document.vo.MyDocument"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Employee employee = (Employee)session.getAttribute("loginUser");
	ArrayList<ApprLine> appr = (ArrayList<ApprLine>)request.getAttribute("appr");
	ArrayList<MyDocument> list = (ArrayList<MyDocument>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<jsp:include page="/views/layout/treeview/approval/layout-up.jsp" />
<link rel="stylesheet" type="text/css" href="/semi/assets/css/approval/taskBox.css">

<script>
	var jsonData = treeviewJson.approvalJson;
	var nodeName = "결재할 문서";
</script> 

<section class="content">

	<div class="content-left">
		<div id="treeview"></div>
	</div>

	<div class="content-right container">
 
		<button class="success" onclick="success()">승인</button>
		<button class="return" onclick="returnBox()">반려</button>
		<table class="commonTable">
			<thead>
				<tr>
					<th><input type="checkbox" name="checkAll" id="checkAlltr"
						onclick="checkAll();" style="height: 17px; width: 17px;"></th>
					<th>번 호</th>
					<th>작 성 자</th>
					<th>부 서</th>
					<th>문 서 번 호</th>
					<th>제 목</th>
					<th>작 성 날 짜</th>			
							
				<% for(int i=0; i<appr.size(); i++) {
        		if(employee.getEmpid() == appr.get(i).getApprEmpId()) { %>
        		<input class="apprEmpId" type="hidden" name="apprEmpId" value=<%= appr.get(i).getApprEmpId()  %>>
        		<input class="apprOrder" type="hidden" name="apprOrder" value=<%= appr.get(i).getApprOrder() %>>
        		<input class="apprNo" type="hidden" name="apprNo" value=<%= appr.get(i).getApprNo() %>>
        		<% } %>
        		<% } %>  
				</tr>				
			</thead>
			<tbody>
			
			<% if(list != null) { %>
			<% for(int i=0; i<appr.size(); i++) {
				if(appr.get(i).getApprEmpId() == employee.getEmpid()) {
					/* for(int j=0; j<appr.size(); j++) { */ 
					switch(appr.get(i).getApprOrder()){
						case 1: 
						if(appr.get(i).getApproval().equals("N")){ 
							for(int k=0; k<list.size(); k++) {
							if(appr.get(i).getApprNo() == list.get(k).getApprNum()) {%>							 
							 <tr>
								<td><input type="checkbox" name="checkTd"
									style="height: 17px; width: 17px;"></td>
								<td><%= listCount - list.get(k).getNum() + 1 %></td>
								<td><%= list.get(k).getWriter() %></td>
								<td><%= list.get(k).getDeptName() %></td>
								<td><%= list.get(k).getDocNum() %></td>
								<td><%= list.get(k).getTitle() %></td>
								<td><%= list.get(k).getWriteDay() %></td>
							</tr>
							<% } %>
							 <% } %>
					<% }; %>
						<%
							break;
						case 2:
							 if(appr.get(i-1).getApproval().equals("Y") && appr.get(i).getApproval().equals("N")){ 
							for(int k=0; k<list.size(); k++) {
							if(appr.get(i).getApprNo() == list.get(k).getApprNum()) { %>							 
							 <tr>
								<td><input type="checkbox" name="checkTd"
									style="height: 17px; width: 17px;"></td>
								<td><%= listCount - list.get(k).getNum() + 1 %></td>
								<td><%= list.get(k).getWriter() %></td>
								<td><%= list.get(k).getDeptName() %></td>
								<td><%= list.get(k).getDocNum() %></td>
								<td><%= list.get(k).getTitle() %></td>
								<td><%= list.get(k).getWriteDay() %></td>
							</tr>
							<% } %>
							 <% } %>
							 <% };
							break;
						case 3:
							 if(appr.get(i-1).getApproval().equals("Y") && appr.get(i).getApproval().equals("N")) { 
							 for(int k=0; k<list.size(); k++) {
							 if(appr.get(i).getApprNo() == list.get(k).getApprNum()) { %>							 
							 <tr>
								<td><input type="checkbox" name="checkTd"
									style="height: 17px; width: 17px;"></td>
								<td><%= listCount - list.get(k).getNum() + 1 %></td>
								<td><%= list.get(k).getWriter() %></td>
								<td><%= list.get(k).getDeptName() %></td>
								<td><%= list.get(k).getDocNum() %></td>
								<td><%= list.get(k).getTitle() %></td>
								<td><%= list.get(k).getWriteDay() %></td>
							</tr>
							<% } %>
							 <% } %>
						<%}; break; 
 					  }
					  /* } */			  
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
					<td></td>
				</tr>
				<% } %>
			</tbody>
		</table>
		<div class="btnArea">
				<div class="paging" align="center">
			
				<ul class="pagination">
					<li><a onclick="location.href='<%=request.getContextPath()%>/submitDocumentApproval.sda?currentPage=1'"><<</a></li> 
					<% if(currentPage <=1){ %>
					<li><a><</a></li> <!-- 비활성화 -->
					<%}else{%>
					<li><a onclick="location.href='<%=request.getContextPath()%>/submitDocumentApproval.sda?currentPage=<%=currentPage - 1%>'"><</a></li> <!-- 하나 이전페이지로 이동 -->
					<%} %>
					<% for(int p = startPage; p <= endPage; p++){
					if(p == currentPage){
					
			
				
					%>
					<li ><a style="background-color: rgb(128, 181, 240) " ><%= p %></a></li>
					<%  }else{ %>
					<li><a onclick="location.href='<%=request.getContextPath()%>/submitDocumentApproval.sda?currentPage=<%= p %>'"><%= p %></a></li>
			 
			
					<%         } %>
					<%} %>
					
					<%if(currentPage >= maxPage){ %>
					<li><a >></a></li> <!-- 비활성화 -->
					<%}else{%>
					<li><a onclick="location.href='<%=request.getContextPath()%>/submitDocumentApproval.sda?currentPage=<%=currentPage + 1%>'">></a></li> <!-- 하나 다음페이지로 이동 -->
					<%} %>
					<li><a onclick="location.href='<%=request.getContextPath()%>/submitDocumentApproval.sda?currentPage=<%=maxPage%>'">>></a></li>
				</ul>
				
			</div>
				<!-- <div class="paging" align="center">
				<ul class="pagination">
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
				</ul>
			</div> -->
		</div>
	</div>

</section>

<script>
	/*체크박스 조절*/
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
	function returnBox() {
		var sendArr = new Array();
		var checkbox = $("input[name=checkTd]:checked");
	 	checkbox.each(function(i){
	 		var tr = checkbox.parent().parent().eq(i);
	 		var td = tr.children();
            var docNum = td.eq(4).text();
            var apprEmpId = $(".apprEmpId").val();
            var apprOrder = $(".apprOrder").val();
            var apprNo = $(".apprNo").val();
            sendArr.push(docNum);
            location.href="<%= request.getContextPath()%>/sendReturn.sr?docNum=" + sendArr + ","+"&apprEmpId=" + apprEmpId + "&apprOrder=" + apprOrder + "&apprNo=" + apprNo;
		});
	}

/* 	function closePopUp() {
		if(choice == '결재자1선택'){
			$("#person1").val("");
		}else if(choice == '결재자2선택'){
			$("#person2").val("");
		}else {
			$("#person3").val("");
		}
	} */ 
	function success() {
		var sendArr = new Array();
		var checkbox = $("input[name=checkTd]:checked");
	 	checkbox.each(function(i){
	 		var tr = checkbox.parent().parent().eq(i);
	 		var td = tr.children();
            var docNum = td.eq(4).text();
            var apprEmpId = $(".apprEmpId").val();
            var apprOrder = $(".apprOrder").val();
            var apprNo = $(".apprNo").val();
        
            sendArr.push(docNum);
            location.href="<%= request.getContextPath()%>/successUpdate.su?docNum=" + sendArr + ","+"&apprEmpId=" + apprEmpId + "&apprOrder=" + apprOrder + "&apprNo=" + apprNo;
	 	});
	}
</script>

<jsp:include page="/views/layout/treeview/approval/layout-down.jsp" />