<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<jsp:include page="/views/main/mainPage.jsp" />
<!-- <script src="/semi/views/schedule/luna.js"></script> -->
<link rel="stylesheet" type="text/css" href="/semi/assets/css/calendar.css">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<script language="javascript" type="text/javascript">
	var today = new Date(); // 오늘 날짜
	//지신의 컴퓨터를 기준으로
	//today 에 Date객체를 넣어줌 //ex)5일  
	
	/*공휴일*/
	var holidaySol = [
		['0101', '신정'], ['0301', '삼일절'], ['0505', '어린이날'], 
		['0606', '현충일'], ['0815', '광복절'], ['1003', '개천철'], ['1009', '한글날'],
		['1225', '성탄절']
	];
	var holidayLun=[
		['0101', '설날'], ['0102', ''], ['0408', '부처님 오신날'], ['0814', ''], ['0815', '추석'], ['0816', ''], ['1231', '']
	];
	
	function prevCalendar() {
		today = new Date(today.getFullYear(), today.getMonth() - 1 /*이전달*/, today.getDate());
		buildCalendar(); // 현재 달 
		
	}
 
	function nextCalendar() {
		today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
		buildCalendar();
		
	}
 
	function buildCalendar() {// 현재 달fur
		
		/*달력 생성용*/
		var nMonth = new Date(today.getFullYear(), today.getMonth(), 1);  // 이번 달의 첫째 날
		var lastDate = new Date(today.getFullYear(), today.getMonth()+1, 0); // 이번 달의 마지막 날
		
		
		/*공휴일 호출용*/
		
		var holis="";
		
		
		var tblCalendar = document.getElementById("calendarMain");     // 테이블 달력을 만들 테이블
		var tblCalendarYM = document.getElementById("calendarTitle");    // yyyy년 m월 출력할 곳
		tblCalendarYM.innerHTML = today.getFullYear() + "년 " + (today.getMonth()+1) + "월";  // yyyy년 m월 출력
		
		
		// 기존 테이블에 뿌려진 줄, 칸 삭제
		while (tblCalendar.rows.length > 0) {
			tblCalendar.deleteRow(tblCalendar.rows.length-1); //현재 있는 열 모두 삭제
		}
		
		var row = null; //주차별로 추가될 열 
		row = tblCalendar.insertRow();
		var cnt = 0; // 1일이 시작되는 칸을 맞추어 줌
		for (i=0; i<nMonth.getDay(); i++) {
			cell = row.insertCell();
			cnt = cnt + 1;
		}
 
		for (i=1; i<=lastDate.getDate(); i++) { //날마다 새로운 td 추가
			var holiDate=new Date(today.getFullYear(), today.getMonth(), i);
	 		var year=today.getYear()+1900;
			var month=(today.getMonth()+1);
			var day=holiDate.getDate();
			
			if(month<10){
				if(i<10){
					holis=year+'0'+month+'0'+day;
				}else{
					holis=year+'0'+month+''+day;
				}
			}else{
				if(i<10){
					holis=year+''+month+'0'+day;
				}else{
					holis=year+''+month+''+day;
				}
			}
			
			cell = row.insertCell();
			
			cell.innerHTML ='<span style="font-weight:bold">'+i+'</span>'+'<p id="calSchecdule'+holis+'"></p>';
			cnt = cnt + 1;
			
			if (cnt%7 == 0) {
				// 1주일이 7일 > 7일마다 새 열 추가
				row = calendar.insertRow();// 줄 추가
			}
			if(cnt%7 ==1) {
				//일요일 날짜 색 red
				cell.innerHTML='<span class="sunday">'+i+'</span>'+'<p id="calSchedule'+holis+'"></p>';
			}
			if(cnt%7 ==0) {
				//토요일 날짜 색 blue
				cell.innerHTML='<span class="saturday">'+i+'</span>'+'<p id="calSchedule'+holis+'"></p>';

			}
			/*양력 공휴일 적용*/
			for(j=0;j<holidaySol.length;j++){
				 if(holis.toString().substring(4)===holidaySol[j][0].toString()){
					cell.innerHTML='<span class="sunday">'+i+'<br><span>'+
					holidaySol[j][1]+'</span>'+'<p id="calSchedule'+holis+'"></p>';
					if(j==3){
						if(cnt%7==1){
							cell.next().innerHTML='<span class="sunday">'+i+'<br></span>'
							+'<p id="calSchedule'+holis+'"></p>';
						}
					}
				} 
			}
			// luna();
			/*음력 공휴일 적용*/
			/* for(j=0;j<holidayLun.length;j++){
				if(lunar.toString()===holidayLun[j][0].toString()){
					cell.innerHTML='<span class="sunday">'+i+'<br><span>'+
					holidaySol[j][1]+'</span>';
				}
			} */
			
		}
		view();
		
	}

</script>
</head>
<body>
	<div class="scheduleLeft">
		<div class="list">
			<input type="checkbox" id="Myschedule" name="myschedule" value="myschedule" checked>
			<label for="Myschedule">내 일정</label><br><br>
			<input type="checkbox" id="Teamschedule" name="teamschedule" value="teamschedule" checked>
			<label for="Teamschedule">부서 일정</label><br><br>
			<input type="checkbox" id="Companyschedule" name="companyschedule" value="companyschedule" checked>
			<label for="Companyschedule">회사 일정</label><br>
		</div>
	</div>
	<div class="schedule">
		<table id="calendar" align="center">
			<thead>
				<tr id="title">
					<td onclick="prevCalendar()" id="preCal"><label style="font-size:30px"><</label></td>
					<td colspan="5" align="center" id="calendarTitle" style="font-size:30px">yyyy년 m월</td>
					<td onclick="nextCalendar()" id="nextCal"><label style="font-size:30px">></label></td>
				</tr>
				<tr id="day"> 
					<td class="sunday day" align="center">일</td>
					<td class="day">월</td>
					<td class="day">화</td>
					<td class="day">수</td>
					<td class="day">목</td>
					<td class="day">금</td>
					<td class="saturday day" align="center">토</td>
				</tr>
			</thead>
			<tbody id="calendarMain"> <%-- 날짜 들어가는 부분 --%>
			</tbody>
		</table>
		<div class="popUpSchedule" id="viewSchedule" align="center"> <%-- 일정 보기 div --%>
			<div class="scheduleDay" id="viewScheduleDay"></div>
			<div id="daySchedule">일 정 들 일 정 들</div>
			<div class="scheduleBtn" id="addBtn">추가</div>
			<div class="scheduleBtn" id="modifyBtn">수정</div>
			<div class="scheduleBtn" id="delBtn">삭제</div>
			<div class="scheduleBtn" id="closeBtn">닫기</div>
		</div>
		<div class="popUpSchedule" id="addSchedule" align="center"> <%-- 일정 추가 div --%>
			<div class="scheduleDay" id="addScheduleDay"></div>
			<div class="message" id="addMessage">
				<select>
					<option value="my">내 일정</option>
					<option value="team">팀 일정</option>
					<!-- 관리자 추가 -->
					<option value="company">회사 일정</option>
				</select>
				<input type="text" size="13" maxlength="25" placeholder="추가할 일정 입력" name="addSchedule">
			</div>
			<div class="scheduleBtn" id="saveAddBtn">추가</div>
			<div class="scheduleBtn" id="closeAddBtn">닫기</div>
		</div>
		<div class="popUpSchedule" id="modSchedule" align="center"> <%-- 일정 수정 div --%>
			<div class="scheduleDay" id="modScheduleDay"></div>
			<div class="message" id="modMessage">
				<select>
					<option value="my">내 일정</option>
					<option value="team">팀 일정</option>
					<!-- 관리자 추가 -->
					<option value="company">회사 일정</option>
				</select>
				<input type="text" size="13" maxlength="25" placeholder="수정할 일정 입력" name="modSchedule">
			</div>
			<div class="scheduleBtn" id="saveModBtn">저장</div>
			<div class="scheduleBtn" id="closeModBtn">닫기</div>
		</div>
		<div class="deleteSchedule" id="delSchedule" align="center"> <%-- 일정 삭제 div --%>
			<div class="scheduleDay" id="delScheduleDay"></div>
			<div class="message" id="delMessage"> 삭 제 ?  ? ? </div>
			<div class="scheduleBtn" id="closeDelBtn">닫기</div>
			<div class="scheduleBtn" id="deleteDelBtn">삭제</div>
		</div>
		<div class="confirm" id="addConfirm">
			<div class="scheduleMsg" id="addScheduleMsg">일정 추가가<br>완료되었습니다.</div>
			<div class="btnDiv">
				<div class="scheduleBtn" id="closeAddConfirm">닫기</div>
			</div>
		</div>
		<div class="confirm" id="modConfirm">
			<div class="scheduleMsg" id="modScheduleMsg">일정 수정이<br>완료되었습니다.</div>
			<div class="btnDiv">
				<div class="scheduleBtn" id="closeModConfirm">닫기</div>
			</div>
		</div>
		<div class="confirm" id="delConfirm">
			<div class="scheduleMsg" id="delConScheduleMsg">일정을<br>정말 삭제할까요?</div>
			<div class="btnDiv2">
				<div class="scheduleBtn" id="delDelBtn">삭제</div>
				<div class="scheduleBtn" id="cancleDelBtn">취소</div>
			</div>
		</div>
		<div class="confirm" id="delDelConfirm">
			<div class="scheduleMsg" id="delScheduleMsg">일정 삭제<br> 완료되었습니다.</div>
			<div class="btnDiv">
				<div class="scheduleBtn" id="closeDelConfirm">닫기</div>
			</div>
		</div>
		
		
		
		
	</div>
	<div class="scheduleRight">
	</div>
	<div class="bottom">
		<h1> 　</h1>
	</div>
	<script language="javascript" type="text/javascript">
		/*달력 생성*/
		buildCalendar();
		
		/*팝업창 우선 숨기기*/
		$("#viewSchedule").hide();
		$("#addSchedule").hide();
		$("#modSchedule").hide();
		$("#delSchedule").hide();
		$("#addConfirm").hide();
		$("#modConfirm").hide();
		$("#delConfirm").hide();
		$("#delDelConfirm").hide();
		/*팝업창 불러오기*/
		var scheduleDate="";
		function view(){
			$("#calendarMain").children().children().click(function(){
				if($(this).text().length==1){
					scheduleDate=(today.getYear()+1900)+"년 "
					+(today.getMonth()+1)+"월 "+$(this).text().charAt(0)+"일";
					$("#viewScheduleDay").text(scheduleDate);
					$("#viewSchedule").show();
					console.log("날짜클릭!");
				}else if($(this).text().length>1){
					if(isNaN(Number($(this).text().charAt(1)))){
						scheduleDate=(today.getYear()+1900)+"년 "
						+(today.getMonth()+1)+"월 "+$(this).text().substring(0, 1)+"일";
					}else{
						scheduleDate=(today.getYear()+1900)+"년 "
						+(today.getMonth()+1)+"월 "+$(this).text().substring(0, 2)+"일";
					}
					$("#viewScheduleDay").text(scheduleDate);
					$("#viewSchedule").show();
					console.log(Number($(this).text().charAt(1)));
					console.log($(this).text().length);
				}else{
					console.log("빈칸클릭!");
				}
			});
		}

		//일정 상세보기 팝업 닫기
		$("#closeBtn").click(function(){
			$("#viewSchedule").hide();
		});
		//일정 추가 팝업 열기
		$("#addBtn").click(function(){
			$("#addScheduleDay").text(scheduleDate);
			$("#addSchedule").show();
		});
		
		//일정 추가 팝업 닫기
		$("#saveAddBtn").click(function(){
			$("#addSchedule").hide();
			$("#addConfirm").show();
		});
		$("#closeAddBtn").click(function(){
			$("#addSchedule").hide();
		});
		$("#closeAddConfirm").click(function(){
			$("#addConfirm").hide();
		});
		
		//일정 수정 팝업 열기
		$("#modifyBtn").click(function(){
			$("#modScheduleDay").text(scheduleDate);
			$("#modSchedule").show();

		});
		
		//일정 수정 팝업 닫기
		$("#saveModBtn").click(function(){
			$("#modSchedule").hide();
			$("#modConfirm").show();
		});
		$("#closeModBtn").click(function(){
			$("#modSchedule").hide();
		});
		$("#closeModConfirm").click(function(){
			$("#modConfirm").hide();
		});
		
		//일정 삭제 팝업 열기
		$("#delBtn").click(function(){
			$("#delScheduleDay").text(scheduleDate);
			$("#delSchedule").show();
		});
		
		//일정 삭제 팝업 닫기
		$("#closeDelBtn").click(function(){
			$("#delSchedule").hide();
		});
		$("#deleteDelBtn").click(function(){
			$("#delSchedule").hide(); 
			$("#delConfirm").show(); //일정 삭제 확인 팝업 켜기
		});
		$("#delDelBtn").click(function(){ //일정 삭제 확인 팝업 > O
			$("#delConfirm").hide();
			$("#delDelConfirm").show();
		})
		$("#cancleDelBtn").click(function(){ //일정 삭제 확인 팝업 > X
			$("#delConfirm").hide();
		})
		$("#closeDelConfirm").click(function(){ //일정 삭제 완료 팝업
			$("#delDelConfirm").hide();
		});
	</script>
</body>
</html>