<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
	import="java.util.*, com.semi.admin.base.model.vo.*, com.semi.admin.user.model.vo.*"%>
<%
	ArrayList<Department> list = (ArrayList<Department>) request.getAttribute("list");
%>
<%-- <%
	ArrayList<Employee> dList = (ArrayList<Employee>) request.getAttribute("list");
%> --%>
<jsp:include page="/views/layout/treeview/admin/layout-up.jsp" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
	var jsonData = treeviewJson.adminJson;
	var nodeName = "부서 관리";
	
	function addDept(){
		location.href="/semi/views/admin/base/depForm.jsp";
	}
	
	<%-- $(function(){
		$("#listArea td").mouseenter(function(){
			$(this).parent().css({"background" : "#F2F2F2", "cursor" : "pointer"});
		}).mouseout(function(){
			$(this).parent().css({"background" : "white"})
		}).click(function(){
			var num = $(this).parent().children().eq(0).text();
			
			console.log(num);
			
			location.href="<%=request.getContextPath()%>/selectOne.dp?num=" + num;
			
		});
	}); --%>
	
	$("#userDetail").click(function(){
		$.ajax({
			url :  "/semi/searchDeptMember.me",
			type : "post",
			data : {
					deptId : deptId
					},
			success : function(data){
				
			},
			error : function(){
				console.log("실패!");
			}
		});
	});
	
</script>
	
<section class="content">
	<div class="content-left">
		<div id="treeview"></div>
	</div>
	
	<div class="content-right container">
		<div>
			<div>
				<h1>부서 관리</h1>
			</div>
			
			<div class="form-group">
				<div class="col-lg-offset-2 col-lg-10">
					<button type="button" class="btn btn-default" id="addDeptBtn" onclick="addDept();">추가</button>
				</div>
			</div>
		</div>
		
		<div>
			<table class="table" id= "listArea">
					<tr>
						<th>부서코드</th>
						<th>부서명</th>
						<th>활성화 여부</th>
						<th>비고</th>
						<th></th>
					</tr>
					
					<%
						for (Department dep : list)	{
					%>
					<tr>
						<td><%=dep.getDeptId()%></td>
						<td><%=dep.getDeptName()%></td>
						<td><%=dep.getDeptAct()%></td>
						<td><%=dep.getDeptNote()%></td>
						<td>
							<button type="button" id="userDetail" class="btn btn-default" data-toggle="modal" data-target="#myModal">상세보기</button>
						</td>
					</tr>
					<%
						}
					%>
			</table>
		</div>
		
	</div>
</section>

<section>
	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
	  <div class="modal-dialog">
	  
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">사원 목록</h4>
	      </div>
	      <div class="modal-body">
	        <table class="table" id= "deptUser">
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>직책</th>
				</tr>
			<%-- 	<%
					for (Employee emp : dList)	{
				%>
				<tr>
					<td><%=emp.getEmpid()%></td>
					<td><%=emp.getEmpName()%></td>
					<td><%=emp.getPositionName()%></td>
				</tr>
				<%
					}
				%> --%>
			</table>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	    
	  </div>
	</div>
</section>
<jsp:include page="/views/layout/treeview/admin/layout-down.jsp" />