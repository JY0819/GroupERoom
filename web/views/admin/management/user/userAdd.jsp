<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/views/layout/layout-up.jsp" />

<!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
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
	$(function() {
		var nodeName = "사원 추가";
		/*  
		expandIcon: "glyphicon glyphicon-stop",
	    collapseIcon: "glyphicon glyphicon-unchecked",
	    nodeIcon: "glyphicon glyphicon-user",
	    color: "yellow",
	    backColor: "purple",
	    onhoverColor: "orange",
	    borderColor: "red",
	    showBorder: false,
	    showTags: true,
	    highlightSelected: true,
	    selectedColor: "yellow",
	    selectedBackColor: "darkorange",
	    data: alternateData
		*/
		var jsonData = treeviewJson.adminJson;
		var treeOptionData = {
				data: jsonData
			   ,levels: 2
			   ,onhoverColor: "#205181c7"
			   ,enableLinks: true
			   
			   // event
			   ,onNodeDisabled: function(event, node) {
		       }
		       ,onNodeEnabled: function (event, node) {
		       }
		       
		       ,onNodeCollapsed: function(event, node) {
		       	  // 메뉴 닫기
		       }
		       ,onNodeExpanded: function (event, node) {
		       	  // 메뉴 열기
		       }
		       
		       ,onNodeUnchecked: function (event, node) {
		       }
		       
		       // 메뉴 선택
		       ,onNodeSelected: function (event, node) {
		    	   var href = node.href || "";
		    	   if(href !== ""
		    			&& node.text !== nodeName){
		    		  window.location.href  = href;   
		    	   }
		       }
		       ,onNodeUnselected: function (event, node) {
		       }
			   
		}
		
		var $tree = $('#treeview').treeview(treeOptionData);
		
		// node 찾기
		var findNodess = function(nodeName) {
          return $tree.treeview('search', [ nodeName, { ignoreCase: false, exactMatch: false } ]);
        };
        var nodes = findNodess(nodeName);
	    //$tree.treeview('disableNode', [ nodes ]); // 메뉴 disable
		$tree.treeview('selectNode', [ nodes ]); 	// 메뉴 선택
		
		$(".search-result").removeClass(".search-result");
	});
</script>

<section class="content">
	<div class="content-left">
		<div id="treeview" class=""></div>
	</div>
	
	<div class="content-right">
	</div>
</section>

<jsp:include page="/views/layout/layout-down.jsp" />