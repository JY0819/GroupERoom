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
		<% for(int i=0; i<list.size(); i++){ 
		if(employee.getEmpid() == appr.get(i).getApprEmpId() && appr.get(i).isCheck()) { %>
		<button class="success">승인</button>
		<button class="return" onclick="returnBox()">반려</button>
		<% }else { %>
		<a href="#open"><button class="success">결재하기</button></a>
		<% } %>
		<% } %>
		<div class="white_content" id="open">
		
        	<div>
        	<form action="<%= request.getContextPath()%>/passCheck.pc" method="post">   
        		<h3>결재 비밀번호를 입력해주세요.</h3>
        		<input type="password" name="password">&nbsp;&nbsp;<button type="submit">확인</button>
        		<input type="hidden" name="apprWriter" value="<%= employee.getEmpid()%>">
        	</form>		        
         		<% for(int i=0; i<appr.size(); i++) {
        		if(employee.getEmpid() == appr.get(i).getApprEmpId()) { %>
        		<input id="apprNum" type="hidden" name="apprNum" value=<%= appr.get(i).getApprEmpId()  %>>
        		<input id="apprOrder" type="hidden" name="apprOrder" value=<%= appr.get(i).getApprOrder() %>>
        		<% } %>
        		<% } %> 
            	<button type="button" class="saveBtn2" onclick="success()">승인</button><a class="close" href="#"><button type="button" class="closeBtn2">닫기</button></a>
        	</div>
    	</div>
		<table>
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
				</tr>
			</thead>
			<tbody>
			
			<% if(list != null) { %>
			<% for(int i=0; i<list.size(); i++) {
				if(appr.get(i).getApprEmpId() == employee.getEmpid()) {
				%>
				<tr>
					<td><input type="checkbox" name="checkTd"
						style="height: 17px; width: 17px;"></td>
					<td><%= list.get(i).getNum() %></td>
					<td><%= list.get(i).getWriter() %></td>
					<td><%= list.get(i).getDeptName() %></td>
					<td><%= list.get(i).getDocNum() %></td>
					<td><%= list.get(i).getTitle() %></td>
					<td><%= list.get(i).getWriteDay() %></td>
				</tr>
				<% } %>
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
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
				</ul>
			</div>
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
            sendArr.push(docNum);
            location.href="<%= request.getContextPath()%>/sendReturn.sr?docNum=" + sendArr + ",";
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
            var apprNum = $("#apprNum").text();
            var apprOrder = $("#apprOrder").text();
            sendArr.push(docNum);
            location.href="<%= request.getContextPath()%>/successUpdate.su?docNum=" + sendArr + ","+"&apprNum=" + apprNum + "&apprOrder=" + apprOrder;
	 	});
	}
</script>

<jsp:include page="/views/layout/treeview/approval/layout-down.jsp" />