<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="sidemenu" class="sidebar">
	<a href="#" class="closebtn" onclick='closeNav()'> <i
		class="fa fa-angle-double-left fa-5" aria-hidden="true"></i>
	</a><!--  <a href="#" style="width:300px;">회원정보</a> -->
	<div id="sideuserDiv">
		<div id="sideuserPhoto"></div>
		<div id="sideuserInfo">김사원 <br> 개발팀 <br> 대리</div>
	</div>
	 <a style="width:300px;">메모</a>
	<style>
		#sideuserDiv{
			padding: 10px 10px 10px 10px;
			background:#295F93;
			margin:0px 0px 10px 25px;
			width:240px;
			height:170px;
		}
		#sideuserPhoto{
			border:1px solid #295F93;
			width:120px;
			height:120px;
			padding:15px 5px 15px 5px;
			border-radius: 50%;
			background-image: url("assets/images/upload_EmpImg/20190109092726256246.jpg");
			background-position:center;
			display:table-cell;
		}
		#sideuserInfo{
			display:table-cell;
		}
		#memoDiv{
			padding:10px 10px 10px 25px;
		}
		#memoArea{
			scrollbar-face-color:#326FAA;
			scrollbar-highlight-color: navy;
			scrollbar-3dlight-color: #FFFFFF;
			scrollbar-shadow-color: navy;
			scrollbar-darkshadow-color: #FFFFFF;
			scrollbar-track-color: #FFFFFF;
			scrollbar-arrow-color: navy;
			width:240px;
			height:320px;
			padding: 5px 5px 5px 5px;
			border:1px solid #295F93;
			background:#295F93;
			color:white;
		}
	</style>
	<div id="memoDiv">
		<textarea id="memoArea"></textarea>
	</div>
	
</div>