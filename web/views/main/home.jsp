<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/views/main/mainPage.jsp" />

<style>
#mainTable {
	position: relative;
	top: 100px;
}

#announce {
	width: 450px;
	position: relative;
}

div.alignleft {
	float: left;
	width: 120px;
	margin-left: 30px;
	margin-top: 20px;
}

div.alignleftText {
	float: left;
	width: 100px;
}

p.imgText {
	font-weight: bold;
	font-size: 15px;
	line-height: 100px;
	text-align: center;
}

.cursor:hover {
	cursor: pointer;
}

.tdPadding {
	border: 2px solid #205181;
}
</style>

<script type="text/javascript">
	var today = new Date();
	var nMonth;
	var holis=""; //달력용

	function move(e) {
		if (e.id == 'app') {
			location.href="/semi/views/approval/approvalMain.jsp";
		} else if (e.id == 'board') {
			location.href="<%=request.getContextPath()%>/selectList.fr";
		} else if (e.id == 'myP') {
			location.href="<%=request.getContextPath()%>/myPageMain";
		} else if (e.id == 'admin') {
			location.href = "/semi/views/admin/user/userList.jsp";
		}

	}
	
	function buildCalendar() {
		/*달력 생성용*/
		nMonth=new Date(today.getFullYear(), today.getMonth(), 1);  // 이번 달의 첫째 날
		var lastDate=new Date(today.getFullYear(), today.getMonth()+1, 0); // 이번 달의 마지막 날

		var tblCalendar=document.getElementById("calendarMain");     // 테이블 달력을 만들 테이블
		var tblCalendarYM=document.getElementById("calendarTitle");    // 몇년몇월인지 출력할 곳
		tblCalendarYM.innerHTML = today.getFullYear() + "년 " + (today.getMonth()+1) + "월";  // 연월 출력
		
		var row = null; //주차별 열추가
		row = tblCalendar.insertRow();
		
		var cnt = 0; // 1일이 시작되는 칸을 맞추어 줌
		for (var i=0; i<nMonth.getDay(); i++) {
			cell = row.insertCell();
			cnt = cnt + 1;
		}
 
		for (var i=1; i<=lastDate.getDate(); i++) { //날마다 새로운 td 추가
			var holiDate=new Date(today.getFullYear(), today.getMonth(), i); //공휴일 비교를 위한 일자 얻기
	 		var year=today.getFullYear();
			var month=(today.getMonth()+1);
			var day=holiDate.getDate();
			
			/*공휴일 비교용 문자열*/
			if(month<10){
				if(i<10){holis=year+'0'+month+'0'+day;}
				else{holis=year+'0'+month+''+day;}
			}else{
				if(i<10){holis=year+''+month+'0'+day;}
				else{holis=year+''+month+''+day;}
			}
			
			cell = row.insertCell();
			cnt=cnt+1;
			cell.innerHTML ='<span style="font-weight:bold;">'+i+'</span>';
			if(cnt%7 ==1) {cell.innerHTML='<span class="sunday">'+i+'</span>';}
			if(cnt%7 ==0) {cell.innerHTML='<span class="saturday">'+i+'</span>';}
			cell.id='calSchedule'+holis; //일정 입력용 Id 부여
			
			if (cnt%7 == 0) {row = calendar.insertRow();}
			
		}
		
	}
	
</script>

<div align="center">
	<table id="mainTable" align="center">
		<tr>
			<!-- 결재 게시판 마이페이지 관리자 -->
			<td class="tdPadding">
				<div onclick="move(this);" id="app" class="cursor">
					<div class="alignleft">
						<i class="far fa-file-alt fa-4x"></i>
					</div>
					<div class="alignleftText">
						<p class="imgText">결재</p>
					</div>
				</div>
			</td>
			<td class="tdPadding">
				<div onclick="move(this);" id="board" class="cursor">
					<div class="alignleft">
						<i class="fas fa-chalkboard fa-4x"></i>
					</div>
					<div class="alignleftText">
						<p class="imgText">게시판</p>
					</div>
				</div>
			</td>
			<td class="tdPadding">
				<div onclick="move(this);" id="myP" class="cursor">
					<div class="alignleft">
						<i class="far fa-user-circle fa-5x"></i>
					</div>
					<div class="alignleftText">
						<p class="imgText">마이페이지</p>
					</div>
				</div>
			</td>
			<td class="tdPadding">
				<div onclick="move(this);" id="admin" class="cursor">
					<div class="alignleft">
						<i class="fas fa-unlock fa-4x"></i>
					</div>
					<div class="alignleftText">
						<p class="imgText">관리자</p>
					</div>
				</div>
			</td>

		</tr>
	</table>
	<!-- 이미지 버튼 밑의 공백 -->
	<br> <br> <br> <br> <br> <br> <br> <br>
	<table>
		<tr>
			<!-- 공지사항 -->
			<td>
				<table id="announce">
					<tr>
						<th style="text-align: left;">공지사항</th>
					</tr>
					<tr>
						<td colspan="3"><hr></td>
					</tr>
					<tr>
						<td><img src="/semi/assets/images/exclamation-mark.png"
							alt="New 이미지" width="20" height="5" /></td>
						<td>
							<p style="text-align: left;">문서 결재 관련 공지사항입니다.</p>
						</td>
						<td>
							<p style="text-align: right;">2018.11.30</p>
						</td>
					</tr>
					<tr>
						<td colspan="3"><hr></td>
					</tr>
					<tr>
						<td><img src="/semi/assets/images/exclamation-mark.png"
							alt="New 이미지" width="20" height="5" /></td>
						<td>
							<p style="text-align: left;">문서 결재 관련 공지사항입니다.</p>
						</td>
						<td>
							<p style="text-align: right;">2018.11.30</p>
						</td>
					</tr>
					<tr>
						<td colspan="3"><hr></td>
					</tr>
					<tr>
						<td colspan="2">
							<p style="text-align: left;">문서 결재 관련 공지사항입니다.</p>
						</td>
						<td>
							<p style="text-align: right;">2018.11.30</p>
						</td>
					</tr>
					<tr>
						<td colspan="3"><hr></td>
					</tr>
					<tr>
						<td colspan="2">
							<p style="text-align: left;">문서 결재 관련 공지사항입니다.</p>
						</td>
						<td>
							<p style="text-align: right;">2018.11.30</p>
						</td>
					</tr>
					<tr>
						<td colspan="3"><hr></td>
					</tr>

				</table>


			</td>
		</tr>
	</table>
	<table id="calendar" style="border:1px solid black">
		<thead>
			<tr>
				<td id="calendarTitle" colspan="7" text-align="center"></td>
			</tr>
		</thead>
		<tbody id="calendarMain">
		</tbody>
	</table>
	<div style="height: 80px;"></div>
</div>
<script>
buildCalendar();
</script>