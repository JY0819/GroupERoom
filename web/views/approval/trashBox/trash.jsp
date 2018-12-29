<%@page import="com.semi.approval.approve.model.vo.TrashTable"%>
<%@page import="com.semi.approval.approve.model.vo.ApprLine"%>
<%@page import="com.semi.admin.user.model.vo.Employee"%>
<%@page import="com.semi.approval.approve.model.vo.Approval"%>
<%@page import="java.util.ArrayList"%>	
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	ArrayList<TrashTable> list = (ArrayList<TrashTable>)request.getAttribute("list");
	//ArrayList<ApprLine> line = (ArrayList<ApprLine>)request.getAttribute("line");
	Employee employee = (Employee)session.getAttribute("loginUser");
	
	
	
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

		<button class="move">이동</button>
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
					<th>결 과</th>
					
				</tr>	
			</thead>
			
			<tbody>
					
					<% for(TrashTable trashTable : list) {%>
						<%if(employee.getEmpName().equals(trashTable.getWirter()) ){ %>
						<tr>
						<td><input type="checkbox" name="checkTd"
							style="height: 17px; width: 17px;" ></td>
						<td><%= trashTable.getWirter() %></td>
						<%if(!(trashTable.getManager() == null)){%>
						<td><%=trashTable.getManager() %></td>
						<%}else{ %>
						<td></td>
						<%} %>
						<td><%= trashTable.getDocnum() %></td>
						<%-- <input type="hidden" class="apprno" value="<%= a.getApprNo() %>"> --%>
						
						<td><%= trashTable.getResult().replaceAll("N", "승인대기중") %></td>
						
						</tr>
						
						
						<%} %>
						<%} %>

			</tbody>
			
		</table>
		
		
		</div>
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
		 		
                docuno = td.eq(3).text();
                tdArr.push(docuno);
                console.log(docuno);
               
              
		 	});
			
		 	 location.href="<%=request.getContextPath()%>/deleteTrash.tr?docnum=" + tdArr+",";
	        /*   $("#ex3_Result2").html(tdArr);    */
	        
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
<div class="col-lg-12" id="ex3_Result1" ></div> 
        <div class="col-lg-12" id="ex3_Result2" ></div> 



	</div>
	

</section>
<jsp:include page="/views/layout/treeview/approval/layout-down.jsp" />
