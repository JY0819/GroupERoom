$(function() {
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
});