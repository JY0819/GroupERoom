<%@page import="com.semi.approval.approve.model.vo.TrashTable"%>
<%@page import="com.semi.approval.approve.model.vo.ApprLine"%>
<%@page import="com.semi.admin.user.model.vo.Employee"%>
<%@page import="com.semi.approval.approve.model.vo.Approval"%>
<%@page import="java.util.ArrayList"%>	
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,com.semi.approval.approve.model.vo.*"%>

<%
	ArrayList<TrashTable> list = (ArrayList<TrashTable>)request.getAttribute("list");
	//ArrayList<ApprLine> line = (ArrayList<ApprLine>)request.getAttribute("line");
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


<section class="content">

	<div class="content-left">
		<div id="treeview"></div>
	</div>

	<div class="content-right container">
		<!-- <form id="deleteform" method="get"> -->
		<div class="outer">
		<button class="move" onclick="moveTrash()">이동</button>
		<button class="delete" onclick="deleteTrash()">삭제</button>
		
		<div class="tableArea">
		
		<table>
			<thead>
				<tr>
					<th><input type="checkbox" name="All" id="checkAlltr"
						onclick="checkAll();" style="height: 17px; width: 17px;"></th>
					<th>작 성 자</th>
					<th>처 리 자</th>
					<th>문 서 번 호</th>
					<th>결 재 번 호</th>
					<th>결 과</th>
					
				</tr>	
			</thead>
			
			<tbody>
					
					<% for(TrashTable trashTable : list) {%>
						<%if(employee.getEmpid() == trashTable.getEmpid()){ %>
						<tr>
						<td><input type="checkbox" name="checkTd"
							style="height: 17px; width: 17px;" ></td>
						<td><%= trashTable.getWriter() %></td>
						<%if(!(trashTable.getManager() == null)){%>
						<td><%=trashTable.getManager() %></td>
						<%}else{ %>
						<td></td>
						<%} %>
						<td><%= trashTable.getDocnum() %></td>
						<td><%= trashTable.getApprnum() %></td>
						
						<%-- <input type="hidden" class="apprno" value="<%= a.getApprNo() %>"> --%>
						<% if(trashTable.getResult().equals("N")) {%>
						<td><%= trashTable.getResult().replaceAll("N", "승인대기중") %></td>
						<%} else{%>
						<td><%= trashTable.getResult().replaceAll("Y", "승인")%></td>
						<%} %>
						</tr>
						
						
						<%} %>
						<%} %>

			</tbody>
			
		</table>
		</div>
		 <%-- <div class="pagingArea" align="center">
			<button onclick="location.href='<%=request.getContextPath()%>/selecttrash.tr?currentPage=1'"><<</button> 
			<% if(currentPage <=1){ %>
				<button disabled><</button> <!-- 비활성화 -->
			<%}else{%>
				<button onclick="location.href='<%=request.getContextPath()%>/selecttrash.tr?currentPage=<%=currentPage - 1%>'"><</button> <!-- 하나 이전페이지로 이동 -->
			<%} %>
			
			<% for(int p = startPage; p <= endPage; p++){
				if(p == currentPage){
					
			
				
			%>
				<button disabled><%= p %></button>
			<%  }else{ %>
				<button onclick="location.href='<%=request.getContextPath()%>/selecttrash.tr?currentPage=<%= p %>'"><%= p %></button>
			
			
			<%         } %>
			<%} %>
			
			<%if(currentPage >= maxPage){ %>
				<button disabled>></button> <!-- 비활성화 -->
			<%}else{%>
				<button onclick="location.href='<%=request.getContextPath()%>/selecttrash.tr?currentPage=<%=currentPage + 1%>'">></button> <!-- 하나 다음페이지로 이동 -->
			<%} %>
			
			<button onclick="location.href='<%=request.getContextPath()%>/selecttrash.tr?currentPage=<%=maxPage%>'">>></button>
			
			
		</div>  --%>
		</div>
		
		<div class="btnArea">
			<div class="paging" align="center">
			
				<ul class="pagination">
					<li><a onclick="location.href='<%=request.getContextPath()%>/selecttrash.tr?currentPage=1'"><<</a></li> 
					<% if(currentPage <=1){ %>
					<li><a><</a></li> <!-- 비활성화 -->
					<%}else{%>
					<li><a onclick="location.href='<%=request.getContextPath()%>/selecttrash.tr?currentPage=<%=currentPage - 1%>'"><</a></li> <!-- 하나 이전페이지로 이동 -->
					<%} %>
					<% for(int p = startPage; p <= endPage; p++){
					if(p == currentPage){
					
			
				
					%>
					<li ><a style="background-color: rgb(128, 181, 240) " ><%= p %></a></li>
					<%  }else{ %>
					<li><a onclick="location.href='<%=request.getContextPath()%>/selecttrash.tr?currentPage=<%= p %>'"><%= p %></a></li>
			 
			
					<%         } %>
					<%} %>
					
					<%if(currentPage >= maxPage){ %>
					<li><a >></a></li> <!-- 비활성화 -->
					<%}else{%>
					<li><a onclick="location.href='<%=request.getContextPath()%>/selecttrash.tr?currentPage=<%=currentPage + 1%>'">></a></li> <!-- 하나 다음페이지로 이동 -->
					<%} %>
					<li><a onclick="location.href='<%=request.getContextPath()%>/selecttrash.tr?currentPage=<%=maxPage%>'">>></a></li>
				</ul>
				
			</div>
		</div>
		</div>
		<script>
	var jsonData = treeviewJson.approvalJson;
	var nodeName = "휴지통";
	/* var a2 = $(".apprno").val(); */
	var tdArr = new Array();
	var docuno = "";
	/* console.log(a2); */
	function checkAll() {
		if ($("#checkAlltr").is(':checked')) {
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
	
	
	 function deleteTrash(){
		 	var rowData = new Array();
		 	
		 	var checkbox = $("input[name=checkTd]:checked");
		 	checkbox.each(function(i){
		 		var tr = checkbox.parent().parent().eq(i);
		 		var td = tr.children();
		 		
                apprno = td.eq(4).text();
                tdArr.push(apprno);
                console.log(apprno);
               
              
		 	});
			
		 	 location.href="<%=request.getContextPath()%>/deleteTrash.tr?apprno=" + tdArr+",";
	        /*   $("#ex3_Result2").html(tdArr);    */
	        
			}
	

	 function moveTrash(){
		 var rowData = new Array();
		 var checkbox = $("input[name=checkTd]:checked");
		 	checkbox.each(function(i){
		 		var tr = checkbox.parent().parent().eq(i);
		 		var td = tr.children();
		 		
             apprno = td.eq(4).text();
             tdArr.push(apprno);
             console.log(apprno);
            
           
		 	});
			
		 	 location.href="<%=request.getContextPath()%>/trashmove.tm?apprno=" + tdArr+",";
	        
	 }

	

	 
	 <%-- function deleteTrash(){
		 	var rowData = new Array();
		 	var tdArr = new Array();
		 	var checkbox = $("input[name=checkTd]:checked");
		 	checkbox.each(function(i){
		 		var tr = checkbox.parent().parent().eq(i);
		 		var td = tr.children();
		 		
		 		rowData.push(tr.text());
		 		
		 		
		 		
             var docuno = td.eq(3).text()+", ";
          
             tdArr.push(docuno);
             


		 	});
			$(".selected").attr("action","<%=request.getContextPath()%>/deletetrash.tr");
			 $("#ex3_Result1").html(" * 체크된 Row의 모든 데이터 = "+rowData);    
	          $("#ex3_Result2").html(tdArr);   

			} --%>
	 

</script>
<!-- </form> -->




	
	

</section>
<jsp:include page="/views/layout/treeview/approval/layout-down.jsp" />
