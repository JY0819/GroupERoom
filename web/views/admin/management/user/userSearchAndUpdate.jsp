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
						<th>주소</th>
						<th>연락처</th>
					</tr>
				</thead>
			</table>
		</form>
	</div>
</section>

<jsp:include page="/views/layout/treeview/admin/layout-down.jsp" />