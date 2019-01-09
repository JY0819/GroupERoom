<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
	import="java.util.*, com.semi.admin.base.model.vo.*, com.semi.admin.user.model.vo.*"%>
<%
	ArrayList<Department> list = (ArrayList<Department>) request.getAttribute("list");
%>
<jsp:include page="/views/layout/treeview/admin/layout-up.jsp" />
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<link rel="stylesheet" type="text/css" href="/semi/assets/css/admin/base.css">

<script type="text/javascript">
	var jsonData = treeviewJson.adminJson;
	var nodeName = "부서 관리";
	
	function addDept(m){
		location.href="/semi/views/admin/base/depForm.jsp";
	}
	
	 $(function(){
		$("#listArea td").mouseenter(function(){
			$(this).parent().css({"background" : "#F2F2F2", "cursor" : "pointer"});
		}).mouseout(function(){
			$(this).parent().css({"background" : "white"})
		}).click(function(){
			var num = $(this).parent().children().eq(0).text();
			
			console.log(num);
			location.href="<%=request.getContextPath()%>/selectOne.dp?num=" + num;
		});
		
	});
	
	// 
	/* $("#stopbubble").click(function(e){
		e.stopPropagation();
	});
	 */
	/* $("#stopbubble").click(function(e){
		if	(event.stopPropagation) event.stopPropagation();
		else event.cancelBubble = true;
	}); */

	function startAjax(deptId){
		console.log("부서 id = " + deptId);
		
		var header = "";
			header += "<tr>";
			header += "<th>아이디</th> ";
			header += "<th>이름</th>  ";
			header += "<th>직책</th>  ";
			header += "</tr>";
			
			
		$.ajax({
			url :  "/semi/searchDeptMember.me",	//서블릿 맵핑 url
			type : "post",	//http method
			data : {
					deptId : deptId // 자바에서 받을 수 있는 데이터 정의
					},
					
			success : function(data){	// 성공시 
				var htmlCode = "";
				for(var i = 0; i < data.length; i++){
					var rowData = data[i];

					var id 		 = rowData["empid"];
					var name 	 = rowData.empName;
					var position = rowData.positionName;
					
					htmlCode += "<tr >                                     ";
					htmlCode += "	<td>" + id + "</td>          ";
					htmlCode += "	<td>" + name + "    </td>	   ";
					htmlCode += "	<td>" + position + "  </td>	 	";
					htmlCode += "</tr>                                    ";
				}

				$("#deptUser").html(header + htmlCode);
				
			},
			error : function(){
				console.log("실패!");
			}
		});
	}
	
	/* function stop(){
		if	(event.stopPropagation) event.stopPropagation();
		else event.cancelBubble = true;
	} */
</script>
	
<section class="content">
	<div class="content-left">
		<div id="treeview"></div>
	</div>
	
	<div class="content-right container">
		<div>
			<div>
				<h1>부서 관리</h1>
				<hr>
				<button type="button" class="btn btn-default" id="addDeptBtn" onclick="addDept();">추가</button>
			</div>
			
			<div class="form-group">
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
						for(int i = 0; i < list.size(); i++){
							Department dep = list.get(i);
					%>
					
					<tr>
						<td><%=dep.getDeptId()%></td>
						<td><%=dep.getDeptName()%></td>
						<td><%=dep.getDeptAct()%></td>
						<td><%=dep.getDeptNote()%></td>
						<td>
							<button type="button" class="btn btn-default userDetail" id="modal" data-toggle="modal" data-target="#myModal" onclick="startAjax('<%=dep.getDeptId()%>');">상세보기</button>
						</td>
					</tr>
					<%
						}
					%>
			</table>
		</div>
		<!-- event.cancelBubble = true; -->
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
	        <table class="table" id="deptUser">

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