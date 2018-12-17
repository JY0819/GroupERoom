<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/views/main/mainPage.jsp" />

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
	margin-right: 250px;
	margin-left: 250px;
}
#btn2{
	margin-right: 50px;
	margin-left: 100px;
}
.alignBox{
	position: relative;
	display: inline-block;
}
.diary{
	border: 2px solid skyblue;
	border-radius: 15px;
	width: 200px;
	height: 300px;
	padding-left: 20px;
	padding-right: 0;
	padding-top: 20px;
}
.sub{
	text-indent: 1em;
}
#mainTable{
	position: relative; 
	top: 50px;
	margin-bottom: 200px;
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
</style>

<div align="center">
	<table id="mainTable">
		<tr>
			<td>
				<div class="alignBox"><input class="btn" id="btn1" type="button" value="받은 쪽지함"></div>
			</td>
			<td>
				<div class="alignBox"><input class="btn" id="btn2" type="button" value="주소록"></div>
			</td>
		</tr>
		<tr>
			<td>
				<table id="messageList" class="line">
					<tr>
						<th class="line"><p></p></th>
						<th class="line"><p>보낸 날짜</p></th>
						<th class="line"><p>보낸 사람</p></th>
						<th class="line"><p>받는 사람</p></th>
						<th class="line"><p>내용</p></th>
						<th class="line"><p>읽은 날짜</p></th>
					</tr>
					<tr>
						<td class="line"><p>1</p></td>
						<td class="line"><p>2018-01-01</p></td>
						<td class="line"><p>김둘리 (SI팀장)</p></td>
						<td class="line"><p>개발팀 전체</p></td>
						<td class="line"><p>결재에 덧붙인 내용 체크</p></td>
						<td class="line"><p>2018-01-10</p></td>
					</tr>
					<tr>
						<td class="line"><p>2</p></td>
						<td class="line"><p>2018-01-01</p></td>
						<td class="line"><p>김둘리 (SI팀장)</p></td>
						<td class="line"><p>개발팀 전체</p></td>
						<td class="line"><p>결재에 덧붙인 내용 체크</p></td>
						<td class="line"><p>2018-01-10</p></td>
					</tr>
					<tr>
						<td class="line"><p>3</p></td>
						<td class="line"><p>2018-01-01</p></td>
						<td class="line"><p>김둘리 (SI팀장)</p></td>
						<td class="line"><p>개발팀 전체</p></td>
						<td class="line"><p>결재에 덧붙인 내용 체크</p></td>
						<td class="line"><p>2018-01-10</p></td>
					</tr>
					<tr>
						<td class="line"><p>4</p></td>
						<td class="line"><p>2018-01-01</p></td>
						<td class="line"><p>김둘리 (SI팀장)</p></td>
						<td class="line"><p>개발팀 전체</p></td>
						<td class="line"><p>결재에 덧붙인 내용 체크</p></td>
						<td class="line"><p>2018-01-10</p></td>
					</tr>
					<tr>
						<td class="line"><p>5</p></td>
						<td class="line"><p>2018-01-01</p></td>
						<td class="line"><p>김둘리 (SI팀장)</p></td>
						<td class="line"><p>개발팀 전체</p></td>
						<td class="line"><p>결재에 덧붙인 내용 체크</p></td>
						<td class="line"><p>2018-01-10</p></td>
					</tr>
				</table>
			</td>
			<td>
				<div class="diary" style="margin-left: 50px;">
				<table>
					<tr>
						<td>즐겨찾기</td>
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
			</td>
		</tr>
	</table>
</div>

