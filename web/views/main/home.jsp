<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.semi.schedule.model.vo.Schedule, com.semi.board.notice.model.vo.Notice, java.util.*"%>
<%
	HashMap<String, Object> hmap=(HashMap<String, Object>)request.getAttribute("hmap");
	ArrayList<Notice> noticeList=(ArrayList<Notice>)hmap.get("notice");
	ArrayList<Schedule> scheduleList=(ArrayList<Schedule>)hmap.get("schedule");
%>
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
	border-radius:50%;
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
			<%--				if(Number(<%=scheduleList.get(i).getCalendarClass()%>)==3){
			$("#calSchedule"+<%=scheduleList.get(i).getScheduleDate()%>).append("<p name='calendarClass' value='3'><input type='hidden' value='<%=scheduleList.get(i).getCalendarNo()%>'><%=scheduleList.get(i).getScheduleTime()%>"+' '+"<%=scheduleList.get(i).getCalendarContents()%></p>");
--%>			$("#calSchedule"+<%=scheduleList.get(i).getScheduleDate()%>).children("div").css("background","#ECECEC");
				$("#calSchedule"+<%=scheduleList.get(i).getScheduleDate()%>).children().children("span").css("font-size","16px");
<%-- 				$("#calSchedule"+<%=scheduleList.get(i).getScheduleDate()%>).children().children("span").css("font-weight","bold");
 --%>				
	<%}%>	 
		
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
				<div onclick="move(this);" id="schedule" class="cursor">
					<div class="alignleft">
						<i class="fas fa-calendar-alt fa-4x"></i>
					</div>
					<div class="alignleftText">
						<p class="imgText">일정</p>
					</div>
				</div>
			</td>

		</tr>
	</table>
	<!-- 이미지 버튼 밑의 공백 -->
	<div><h1>　</h1><h3>　</h3></div>
	<table id="announce" style="display:table-cell;">
		<tr>
			<th colspan="2" style="font-weight:100;text-align:left;color:gray;" >공 지 사 항</th>
		</tr>
		<tr>
			<td colspan="2"><hr></td>
		</tr>
		<%for (Notice n:noticeList){%>
			<tr>
				<td width="500px"><p style="text-align: left;">
					<%Date today=new Date();
						boolean time;
						time=(today.getTime()-n.getbDate().getTime())/(24*3600*1000)<=1.5;
						if(time){
					%><i style="color:#D76464;" class="xi-new-o xi-2x"></i><%} %>
				<input type="hidden" name="bno" value="<%=n.getBno()%>"><%=n.getbTitle() %></p></td>
				<td width="200px"><p style="text-align: right;"><%=n.getbDate() %></p></td>
			</tr>
			<tr>
				<td colspan="2" style="height:3px; padding:0px" colspan="7"><hr></td>
			</tr>
		<% }%>
		<%if(noticeList.size()==0){ %>
			<tr>
				<td colspan="2" height="3px" colspan="7">등록된 공지사항이 없습니다.</td>
			</tr>
			<tr>
				<td colspan="2" height="3px" colspan="7"><hr></td>
			</tr>
		<%} %>
		<!-- 
			<td><img src="/semi/assets/images/exclamation-mark.png" alt="New 이미지" width="20" height="5" /></td>-->
	</table>
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
	<div style="height: 50px;"></div>
</div>
<script>

	buildCalendar();

	$(function(){
		<%if(noticeList.size()==0){}else{ %>

		$("#announce td").mouseenter(function(){
			$(this).parent().css({"color":"darkgrey", "cursor":"pointer"});
		}).mouseout(function(){
			$(this).parent().css({"color":"black"})
		}).click(function(){
			var num = $('input[name="bno"]').val()//->글번호 가져오기
			console.log(num);
			location.href="<%=request.getContextPath()%>/selectOne.no?num="+num;
		});
		<%}%>
	});
</script>