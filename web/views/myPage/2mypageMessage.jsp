<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/views/main/mainPage.jsp" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

<style>
.btn{
	text-align: center;
	background-color: #205181;
	padding: 5px;
	color:white;
	border-radius: 10px;
	width: 100px;
	height: 40px;
}
#btn1{
	margin-bottom: 20px;
}
#btn2{
	margin-left: 20px;
	margin-bottom: 20px;
}
.alignBox{
	position: relative;
	display: inline-block;
}
#messageList{
	width: 700px;
	height: 300px;
}
.line{
	border: 2px solid skyblue;
	border-collapse: collapse;
	padding-left: 8px;
	padding-right: 8px;
}
#alignDiv{
	margin-top: 80px;
	margin-bottom: 100px;
}
.pageMove{
	color: black;
}
.alignPageMove{
	text-align: center;
	font-weight: bold;
	height: 40px;
}
</style>

<div align="center" id="alignDiv">
	<table>
		<tr>
			<td>
				<div class="alignBox"><input class="btn" id="btn1" type="button" value="선택 쪽지 삭제"></div>
				<div class="alignBox"><input class="btn" id="btn2" type="button" value="선택 쪽지 보관"></div>
			</td>
		</tr>
		<tr>
			<td>
				<table id="messageList" class="line">
					<tr>
						<th class="line"><input id="all" type="checkbox" name="chkList" value="all"></th>
						<th class="line"><p>보낸 날짜</p></th>
						<th class="line"><p>보낸 사람</p></th>
						<th class="line"><p>받는 사람</p></th>
						<th class="line"><p>내용</p></th>
						<th class="line"><p>읽은 날짜</p></th>
					</tr>
					<tr>
						<td class="line"><input type="checkbox" name="chkList" value="1"></td>
						<td class="line"><p>2018-01-01</p></td>
						<td class="line"><p>김둘리 (SI팀장)</p></td>
						<td class="line"><p>개발팀 전체</p></td>
						<td class="line"><p>결재에 덧붙인 내용 체크</p></td>
						<td class="line"><p>2018-01-10</p></td>
					</tr>
					<tr>
						<td class="line"><input type="checkbox" name="chkList" value="2"></td>
						<td class="line"><p>2018-01-01</p></td>
						<td class="line"><p>김둘리 (SI팀장)</p></td>
						<td class="line"><p>개발팀 전체</p></td>
						<td class="line"><p>결재에 덧붙인 내용 체크</p></td>
						<td class="line"><p>2018-01-10</p></td>
					</tr>
					<tr>
						<td class="line"><input type="checkbox" name="chkList" value="3"></td>
						<td class="line"><p>2018-01-01</p></td>
						<td class="line"><p>김둘리 (SI팀장)</p></td>
						<td class="line"><p>개발팀 전체</p></td>
						<td class="line"><p>결재에 덧붙인 내용 체크</p></td>
						<td class="line"><p>2018-01-10</p></td>
					</tr>
					<tr>
						<td class="line"><input type="checkbox" name="chkList" value="4"></td>
						<td class="line"><p>2018-01-01</p></td>
						<td class="line"><p>김둘리 (SI팀장)</p></td>
						<td class="line"><p>개발팀 전체</p></td>
						<td class="line"><p>결재에 덧붙인 내용 체크</p></td>
						<td class="line"><p>2018-01-10</p></td>
					</tr>
					<tr>
						<td class="line"><input type="checkbox" name="chkList" value="5"></td>
						<td class="line"><p>2018-01-01</p></td>
						<td class="line"><p>김둘리 (SI팀장)</p></td>
						<td class="line"><p>개발팀 전체</p></td>
						<td class="line"><p>결재에 덧붙인 내용 체크</p></td>
						<td class="line"><p>2018-01-10</p></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td class="alignPageMove" colspan="6">
				<a class="pageMove" href="#"><i class="fas fa-chevron-left"></i></a><a>&nbsp;</a><a>&nbsp;</a>
				<a class="pageMove" href="#">1</a><a>&nbsp;</a><a>&nbsp;</a>
				<a class="pageMove" href="#">2</a><a>&nbsp;</a><a>&nbsp;</a>
				<a class="pageMove" href="#">3</a><a>&nbsp;</a><a>&nbsp;</a>
				<a class="pageMove" href="#">...</a><a>&nbsp;</a><a>&nbsp;</a>
				<a class="pageMove" href="#"><i class="fas fa-chevron-right"></i></a>
			</td>
		</tr>
	</table>
	<script type="text/javascript"> // 전체선택 쿼리
		$(document).ready(function(){
			$("#all").click(function(){
				if($("#all").prop("checked")){
					$("input[name=chkList]").prop("checked",true);
				}else{
					$("input[name=chkList]").prop("checked",false);
	        	}
			});
		});
	</script>
</div>
