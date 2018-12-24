<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/views/layout/treeview/approval/layout-up.jsp" />
<script>
	var jsonData = treeviewJson.approvalJson;
	var nodeName = "반려함";
</script>


<section>

	<div class="content-left">
		<div id="treeview"></div>
	</div>

	<div class="content-right container">
		
	</div>
	
</section>

<jsp:include page="/views/layout/treeview/approval/layout-down.jsp" />