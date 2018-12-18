<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	ul {
		list-style: none;
	}
	ul li {
		color: white;
		font-size: 21px;
	}
	.fa-caret-down {
		color: black;
	}
</style>
<div id="sidemenu" class="sidebar">
	<a href="#" class="closebtn" onclick='closeNav()'> <i
		class="fa fa-angle-double-left fa-5" aria-hidden="true">Approve</i>
	</a> 
	<ul id="ul"><a href="#" style="width:300px;">작업문서함&nbsp;<i class="fas fa-caret-down" onclick="up();"></i></a>
		<li>결재할 문서</li>
		<a href="../approval/documentStatus.jsp"><li>문서 진행 현황</li></a>
		<a href="../approval/returnBox.jsp"><li>반려함</li></a>
		<li>내문서함</li>
		<li>임시보관함</li>
	</ul>
	<a href="#" style="width:300px;">완료문서함</a>
	<a href="#" style="width:300px;">휴지통</a>
	<a href="#" style="width:300px;">환경설정</a>
</div>