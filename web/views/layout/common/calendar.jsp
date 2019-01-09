<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
	buildCalendar();
</script>

<table id="calendar" style="display:table-cell;">
	<thead>
		<tr>
			<th id="calendarTitle" colspan="7"></th>
		</tr>
		<tr>
			<td class="sunday">S</td><td class="day">M</td><td class="day">T</td>
			<td class="day">W</td><td class="day">T</td><td class="day">F</td><td class="saturday">S</td>
		</tr>
	</thead>
	<tbody id="calendarMain">
	</tbody>
</table>


<style>

#announce {
	width: 450px;
	position: relative;
}

#calendar{
	padding:20px 20px 20px 60px;
}
#calendar td{
	width:60px;
	height:60px;
	text-align:center;
}
#calendar tbody td{
	border-top: 1px solid #EAEAEA;
	border-bottom: 1px solid #EAEAEA;
}
.day{
	color: darkgray;
	line-height: 25px;
	text-align:center;
}
.sunday{
	color:#BF7272;
	line-height: 25px;
	text-align:center;
}
.saturday{
	color:#728ABF;
	line-height: 25px;
	text-align:center;	
}
#announce{
	padding:10px 40px 10px 10px;
}
div.dayBack{
	text-align:center;
	width:25px;
	height:25px;
	margin:15px;
	border-radius:100%;
}
</style>

<script type="text/javascript">
	var today = new Date();
	var nMonth;
	var holis=""; //달력용

	function move(e) {
		if (e.id == 'app') {
			location.href="<%=request.getContextPath()%>/selectMainServlet.sm";
		} else if (e.id == 'board') {
			location.href="<%=request.getContextPath()%>/selectList.fr";
		} else if (e.id == 'myP') {
			location.href="<%=request.getContextPath()%>/myPageMain";
		} else if (e.id == 'schedule') {
			location.href = "<%=request.getContextPath()%>/schedule.sche";
		}

	}
	
	function buildCalendar() {
		/*달력 생성용*/
		nMonth=new Date(today.getFullYear(), today.getMonth(), 1);  // 이번 달의 첫째 날
		var lastDate=new Date(today.getFullYear(), today.getMonth()+1, 0); // 이번 달의 마지막 날

		var tblCalendar=document.getElementById("calendarMain");     // 테이블 달력을 만들 테이블
		var tblCalendarYM=document.getElementById("calendarTitle");    // 몇년몇월인지 출력할 곳
		//tblCalendarYM.innerHTML = today.getFullYear() + "년 " + (today.getMonth()+1) + "월";  // 연월 출력
		
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
			cell.innerHTML ='<div class="dayBack"><span class="day">'+i+'</span></div>';
			if(cnt%7 ==1) {cell.innerHTML='<div class="dayBack"><span class="sunday">'+i+'</span></div>';}
			if(cnt%7 ==0) {cell.innerHTML='<div class="dayBack"><span class="saturday">'+i+'</span></div>';}
			cell.id='calSchedule'+holis; //일정 입력용 Id 부여
			
			if (cnt%7 == 0) {row = calendar.insertRow();}

		}
 		//불러온 일정 삽입
		<%
			for(int i=0;i<scheduleList.size();i++){ %>
				$("#calSchedule"+<%=scheduleList.get(i).getScheduleDate()%>).children("div").css("background","#ECECEC");
				$("#calSchedule"+<%=scheduleList.get(i).getScheduleDate()%>).children().children("span").css("font-size","16px");				
		<%}%>	 
	}
	
</script>