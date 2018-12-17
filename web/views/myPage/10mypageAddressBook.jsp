<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/views/main/mainPage.jsp" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

<style>
.diary{
	border: 2px solid skyblue;
	border-radius: 15px;
	width: 600px;
	height: 400px;
}
.sub{
	text-indent: 1em;
}
#sendMessagePop{
	border: 2px solid skyblue;
	border-radius: 5px;
	width: 250px;
	height: 150px;
	margin-left: 50px;
	padding: 5px;
}
#messageArea{
	width: 100%;
	height: 125px;
	border-radius: 5px;
	resize: none;
	overflow-x: hidden;
}
.btn{
	width: 50px;
	height: 25px;
	border-radius: 5px;
}
#sendObject{
	border-radius: 5px;
	width: 100%;
	height: 30px;
}
</style>
<div align="center" style="margin-top: 50px; margin-bottom: 100px;">
<div class="diary">
	<table style="margin-top: 30px;">
		<tr>
			<td>즐겨찾기</td>
			<td rowspan="99" style="width: 250px;">
				<table id="sendMessagePop">
					<tr>
						<td>
							<input type="text" id="sendObject" value="받는 사람" readonly>
						</td>
					</tr>
					<tr>
						<td><textarea id="messageArea">보낼 내용</textarea></td>
					</tr>
					<tr>
						<td style="text-align: center;">
							<button class="btn">전송</button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="btn">취소</button>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td class="sub">관리자</td>
		</tr>
		<tr>
			<td class="sub">가나다(팀장)</td>
		</tr>
		<tr>
			<td>인사회계팀</td>
		</tr>
		<tr>
			<td>마케팅팀</td>
		</tr>
		<tr>
			<td>개발팀</td>
		</tr>
		<tr>
			<td class="sub">가나다</td>
		</tr>
		<tr>
			<td class="sub">카카오(팀장)</td>
		</tr>
		<tr>
			<td class="sub">관리자</td>
		</tr>
		<tr>
			<td class="sub">가나다(팀장)</td>
		</tr>
		<tr>
			<td>디자인팀</td>
		</tr>
	</table>
</div>
</div>