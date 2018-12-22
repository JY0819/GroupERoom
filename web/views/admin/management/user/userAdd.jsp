<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/views/layout/layout-up.jsp" />

<link rel="stylesheet" type="text/css" href="/semi/resources/static/treeview/bootstrap.css">
<script src="/semi/resources/static/treeview/treeviewJson.js"></script>
<script src="/semi/resources/static/treeview/bootstrap-treeview.js"></script>

<style type="text/css">
	.content{
		margin-top: 70px;
	}
	.content>.content-left{
		float: left;
	    width: 30%;
	    height: 100%;
	}
	.content>.content-right{
		float: right;
	    width: 68%;
	    height: 100%;
	}
</style>

<script type="text/javascript">
	//참고 : https://jonmiles.github.io/bootstrap-treeview/
	var jsonData = treeviewJson.adminJson;
	var nodeName = "사원 추가";
</script>

<section class="content">
	<div class="content-left">
		<div id="treeview" class=""></div>
	</div>
	
	<div class="content-right">
	</div>
</section>

<script src="/semi/resources/static/treeview/treeviewAction.js"></script>

<jsp:include page="/views/layout/layout-down.jsp" />