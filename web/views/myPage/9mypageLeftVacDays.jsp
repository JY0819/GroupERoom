<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/views/main/mainPage.jsp" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

<style>
.alignBox{
	position: relative;
	display: inline-block;
}
#useVacList{
	width: 600px;
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
	<table id="useVacList" class="line">
		<tr>
			<th class="line"><p></p></th>
			<th class="line"><p>휴가 구분</p></th>
			<th class="line"><p>휴가 기간</p></th>
			<th class="line"><p>사유</p></th>
			<th class="line"><p>차감 일자</p></th>
		</tr>
		<tr>
			<td class="line"><p>1</p></td>
			<td class="line"><p>연차</p></td>
			<td class="line"><p>2018-01-01 ~ 2018-01-03</p></td>
			<td class="line"><p>나는 쉰다.</p></td>
			<td class="line"><p>3</p></td>
		</tr>
		<tr>
			<td class="line"><p>2</p></td>
			<td class="line"><p>반차</p></td>
			<td class="line"><p>2018-01-04</p></td>
			<td class="line"><p>안녕히계세요! 여러분</p></td>
			<td class="line"><p>0.5</p></td>
		</tr>
	</table>
	<table>
		<tr>
			<td class="alignPageMove" colspan="6"><a class="pageMove"
				href="#"><i class="fas fa-chevron-left"></i></a><a>&nbsp;</a><a>&nbsp;</a>
				<a class="pageMove" href="#">1</a><a>&nbsp;</a><a>&nbsp;</a> <a
				class="pageMove" href="#">2</a><a>&nbsp;</a><a>&nbsp;</a> <a
				class="pageMove" href="#">3</a><a>&nbsp;</a><a>&nbsp;</a> <a
				class="pageMove" href="#">...</a><a>&nbsp;</a><a>&nbsp;</a> <a
				class="pageMove" href="#"><i class="fas fa-chevron-right"></i></a>
			</td>
		</tr>
	</table>
</div>