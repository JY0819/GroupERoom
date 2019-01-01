<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,com.semi.approval.approve.model.vo.*"%>
<%@page import="com.semi.admin.user.model.vo.Employee"%>
<%
	ArrayList<FinishApproval> list = (ArrayList<FinishApproval>)request.getAttribute("list");
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
	var nodeName = "결재한 문서";
</script>

<section class="content">

	<div class="content-left">
		<div id="treeview"></div>
	</div>

	<div class="content-right container">

		<button class="delete" onclick="deleteFinish()">삭제</button>

		<table>
			<thead>
				<tr>
					<th><input type="checkbox" name="checkAll" id="checkAll"
						onclick="checkAll();" style="height: 17px; width: 17px;"></th>
					<th>번 호</th>
					<th>작 성 자</th>
					<th>문 서 번 호</th>
					<th>결 과</th>
					<th>의 견</th>
					<th>작 성 날 짜</th>
					<th>처 리 날 짜</th>

				</tr>
			</thead>
			<tbody>
				<%for(FinishApproval finish : list) {%>
				<%if(employee.getEmpName().equals(finish.getApprWriter())){ %>
				<tr>
					<td><input type="checkbox" name="checkTd"
						style="height: 17px; width: 17px;"></td>
					<td><%= finish.getApprNo() %></td>
					<td><%= finish.getApprWriter() %></td>
					<td><%= finish.getDocNo() %></td>
					<td><%= finish.getResult() %></td>
					<td><%= finish.getOpinion() %></td>
					<td><%= finish.getApprDay() %></td>
					<td><%= finish.getApprDate() %></td>

				</tr>
				<%} %>
				<%} %>
			</tbody>

		</table>
		<div class="btnArea">
			<div class="paging" align="center">
			
				<ul class="pagination">
					<li><a onclick="location.href='<%=request.getContextPath()%>/finishappr.fi?currentPage=1'"><<</a></li> 
					<% if(currentPage <=1){ %>
					<li><a><</a></li> <!-- 비활성화 -->
					<%}else{%>
					<li><a onclick="location.href='<%=request.getContextPath()%>/finishappr.fi?currentPage=<%=currentPage - 1%>'"><</a></li> <!-- 하나 이전페이지로 이동 -->
					<%} %>
					<% for(int p = startPage; p <= endPage; p++){
					if(p == currentPage){
					
			
				
					%>
					<li ><a style="background-color: rgb(128, 181, 240) " ><%= p %></a></li>
					<%  }else{ %>
					<li><a onclick="location.href='<%=request.getContextPath()%>/finishappr.fi?currentPage=<%= p %>'"><%= p %></a></li>
			 
			
					<%         } %>
					<%} %>
					
					<%if(currentPage >= maxPage){ %>
					<li><a >></a></li> <!-- 비활성화 -->
					<%}else{%>
					<li><a onclick="location.href='<%=request.getContextPath()%>/finishappr.fi?currentPage=<%=currentPage + 1%>'">></a></li> <!-- 하나 다음페이지로 이동 -->
					<%} %>
					<li><a onclick="location.href='<%=request.getContextPath()%>/finishappr.fi?currentPage=<%=maxPage%>'">>></a></li>
				</ul>
				
			</div>
		</div>
	</div>

	<script>
	var jsonData = treeviewJson.approvalJson;
	var nodeName = "결재한 문서";
	/* var a2 = $(".apprno").val(); */
	var tdArr = new Array();
	var docuno = "";
	
		function checkAll() {
			if ($("#checkAll").is(':checked')) {
				$("input[name=checkTd]").prop("checked", true);
				$("input[name=checkTd]").parent().parent().addClass("selected");
			} else {
				$("input[name=checkTd]").prop("checked", false);
				$("input[name=checkTd]").parent().parent().removeClass("selected");
			}
		}
		
		 $("input:checkbox").on('click', function() { 
				if ( $(this).prop('checked') ) { 
				$(this).parent().parent().addClass("selected"); 
				} 
				else { 
				$(this).parent().parent().removeClass("selected"); 
				} 
			 }); 
		 
		 function deleteFinish(){
			 	var rowData = new Array();
			 	
			 	var checkbox = $("input[name=checkTd]:checked");
			 	checkbox.each(function(i){
			 		var tr = checkbox.parent().parent().eq(i);
			 		var td = tr.children();
			 		
	                apprno = td.eq(1).text();
	                tdArr.push(apprno);
	                console.log(apprno);
	               
	              
			 	});
				
			 	 location.href="<%=request.getContextPath()%>/deletefinish.fi?apprno=" + tdArr+",";
		        /*   $("#ex3_Result2").html(tdArr);    */
		        
				}
	</script>
</section>
<jsp:include page="/views/layout/treeview/approval/layout-down.jsp" />
