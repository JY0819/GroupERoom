<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
	import="java.util.*, com.semi.admin.base.model.vo.*, com.semi.admin.user.model.vo.*"%>
<%
	ArrayList<Department> list = (ArrayList<Department>) request.getAttribute("list");
%>
<jsp:include page="/views/layout/layout-up.jsp" />
<link rel="stylesheet" type="text/css" href="/semi/assets/css/admin/base.css">

<script type="text/javascript">
	function addDept(m){
		location.href="/semi/views/admin/base/depForm.jsp";
	}
	
	/**
		- JY
		이벤트 순서가 버튼(클릭 이벤트) -> 모달 -> td click 이벤트
		
		첫번째 전달 인자에 이름이 달라도 이벤트 객체를 받아올 수 있다
		제이쿼리가 해당 이벤트 함수를 dom에 등록하면 해당 이벤트가 발생할 시점에 이벤트 객체도 받아 올 수 있음
		
		e.target < - html에서 이벤트가 발생되어진 타겟
	    $(e.target).hasClass("userDetail") : boolean 리턴
		-> 이벤트가 발생한 곳이 userDetail이라는 클래스를 가지고 있니?
	*/
	 $(function(){
		$("#listArea td").mouseenter(function(){
			$(this).parent().css({"background" : "#F2F2F2", "cursor" : "pointer"});
		}).mouseout(function(){
			$(this).parent().css({"background" : "white"})
		}).click(function(e){ 
			if(!$(e.target).hasClass("userDetail")){
				var num = $(this).parent().children().eq(0).text();
				location.href="<%=request.getContextPath()%>/selectOne.dp?num=" + num;	
			}
		});
	});
	
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
					
					htmlCode += "<tr >                              ";
					htmlCode += "	<td>" + id + "</td>          	";
					htmlCode += "	<td>" + name + "    </td>	   	";
					htmlCode += "	<td>" + position + "  </td>	 	";
					htmlCode += "</tr>                              ";
				}

				$("#deptUser").html(header + htmlCode);
				
			},
			error : function(){
				console.log("실패!");
			}
		});
	}
	
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
					for (Department dep : list)	{
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
<jsp:include page="/views/layout/layout-down.jsp" />