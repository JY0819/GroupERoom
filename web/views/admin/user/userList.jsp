<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/views/layout/treeview/admin/layout-up.jsp" />

<script type="text/javascript">
	//참고 : https://jonmiles.github.io/bootstrap-treeview/
	var jsonData = treeviewJson.adminJson;
	var nodeName = "사원 조회 및 수정";
</script>

<section class="content">
	<div class="content-left">
		<div id="treeview"></div>
	</div>
	
	<div class="content-right container">
		<form>
			<table class="table">
				<thead>
					<tr>
						<th>사원 번호</th>
						<th>이름</th>
						<th>부서</th>
						<th>직책</th>
						<th>성별</th>
						<th>연락처</th>
					</tr>
				</thead>
				
				<tbody>
				<%-- 				
				<%
					for(Employee emp : list) 
				%>
				<tr>
				
				</tr>
				
				<%
					}
				%>
				 --%>
				</tbody>
			</table>
		</form>
	</div>
	
	<div class="text-center">
		<ul class="pagination">
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
		</ul>
	</div>
</section>

<jsp:include page="/views/layout/treeview/admin/layout-down.jsp" />