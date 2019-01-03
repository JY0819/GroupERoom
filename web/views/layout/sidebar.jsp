<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="sidemenu" class="sidebar">
	<a href="#" class="closebtn" onclick='closeNav()'> <i
		class="fa fa-angle-double-left fa-5" aria-hidden="true"></i>
	</a> <a href="#" style="width:300px;">회원정보</a> <a style="width:300px;">메모</a>
	<style>
		#memoDiv{
			padding:10px 10px 10px 25px;
		}
		#memoArea{
			width:240px;
			height:320px;
			padding: 5px 5px 5px 5px;
			background:#295F93;
			color:white;
		}
	</style>
	<div id="memoDiv">
		<textarea id="memoArea" rows="25" cols="30"></textarea>
	</div>
	
</div>