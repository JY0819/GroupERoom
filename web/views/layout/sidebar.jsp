<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="sidemenu" class="sidebar">
	<a href="#" class="closebtn" onclick='closeNav()'> <i
		class="fa fa-angle-double-left fa-5" aria-hidden="true"></i>
	</a> <a href="#" style="width:300px;">회원정보</a> <a onclick='openMemo()' style="width:300px;">메모</a>
	<div id="memoDiv">
		<textarea id="memoArea" rows="25" cols="30"></textarea>
	</div>
</div>