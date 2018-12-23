<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/views/layout/treeview/admin/layout-up.jsp" />
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<script type="text/javascript">
	//참고 : https://jonmiles.github.io/bootstrap-treeview/
	var jsonData = treeviewJson.adminJson;
	var nodeName = "휴가 조회";
</script>

<section class="content">
	<div class="content-left">
		<div id="treeview"></div>
	</div>
	
	<div class="content-right container">
		<div>
			<h1>휴가 조회</h1>
		</div>
		<div>
			<input type="text">
		</div>
		<div>
			<table class="table">
				<thead>
					<tr>
						<th>사원 번호</th>
						<th>이름</th>
						<th>부서</th>
						<th>총 휴가일 수</th>
						<th>사용일</th>
						<th>잔여일</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>
</section>

<jsp:include page="/views/layout/treeview/admin/layout-down.jsp" />