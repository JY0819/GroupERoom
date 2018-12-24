<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/views/layout/treeview/admin/layout-up.jsp" />

<script type="text/javascript">
	//참고 : https://jonmiles.github.io/bootstrap-treeview/
	var jsonData = treeviewJson.adminJson;
	var nodeName = "사원 추가";
</script>

<section class="content">
	<div class="content-left">
		<div id="treeview"></div>
	</div>
	
	<div class="content-right container">
		<jsp:include page="/views/admin/management/user/userForm.jsp" />
	</div>
</section>

<jsp:include page="/views/layout/treeview/admin/layout-down.jsp" />