<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="sidemenu" class="sidebar">
	<a href="#" class="closebtn" onclick='closeNav()'> <i
		class="fa fa-angle-double-left fa-5" aria-hidden="true"></i>
	</a>
	<div id="sideuserDiv">
		<div id="sideuserPhoto"></div>
		<div id="sideuserInfo">
			<p><label id="sideEmpName"></label></p>
			<p><label id="sideEmpDept"></label></p>
			<p><label id="sideEmpPosition"></label></p>
		</div>
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
			margin:15px 5px 15px 5px;
			border-radius:100%;
			background-position:center;
			background-size:120px;
			float:left;
		}
		#sideuserInfo{
			float:left;
			width:80px;
			height:120px;
			padding:15px 5px 15px 5px;
			margin:15px 0px 15px 0px;
			text-align:center;
			color:white;
			font-weight:light;
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
			height:300px;
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