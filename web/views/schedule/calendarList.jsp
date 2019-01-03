<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.semi.schedule.model.vo.*,
    com.semi.admin.user.model.vo.*, java.sql.*"%>
<%
	Employee loginUser=(Employee)request.getSession().getAttribute("loginUser");
	ArrayList<HashMap<String, Object>> list=(ArrayList<HashMap<String, Object>>)request.getAttribute("list");
%>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>-->
<jsp:include page="/views/layout/treeview/schedule/layout-up.jsp" />
<link rel="stylesheet" type="text/css" href="/semi/assets/css/schedule/calendarList.css">
<script>
	var jsonData=treeviewJson.calendarJson;
	var nodeName="일정 목록";
</script>
<script language="javascript" type="text/javascript">
	var today = new Date(); // 오늘 날짜
	var nMonth;
	var holis="";
	var lunar_date;
	var replaceHolis;
	var replaceLunHolis1, replaceLunHolis2, replaceLunHolis3, replaceLunHolis4, replaceLunHolis5, replaceLunHolis6;
	
	/*공휴일*/
	var holidaySol = [
		['0101', '신정'], ['0301', '삼일절'], ['0505', '어린이날'], 
		['0606', '현충일'], ['0815', '광복절'], ['1003', '개천철'], ['1009', '한글날'],
		['1225', '성탄절']
	];
	var holidayLun=[
		 ['0100', '연휴'], ['0101', '설날'], ['0102', '연휴'], ['0408', '석가탄신일'], ['0814', '연휴'], ['0815', '추석'], ['0816', '연휴']
	];
	
	function goCalendar(){
		var goYear=$("#goCalYear").val();
		var goMonth=$("#goCalMonth").val();
		today=new Date(goYear, goMonth-1, 1);

		buildCalendar();
	}
	
	function prevCalendar() {
		today = new Date(today.getFullYear(), today.getMonth() - 1 /*이전달*/, today.getDate());
		buildCalendar(); // 현재 달 
		
	}
 
	function nextCalendar() {
		today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
		buildCalendar();
		
	}
 
	function buildCalendar() {// 현재 달
		
		/*달력 생성용*/
		nMonth = new Date(today.getFullYear(), today.getMonth(), 1);  // 이번 달의 첫째 날
		var lastDate = new Date(today.getFullYear(), today.getMonth()+1, 0); // 이번 달의 마지막 날
		

		var tblCalendar = document.getElementById("calendarMain");     // 테이블 달력을 만들 테이블
		var tblCalendarYM = document.getElementById("calendarTitle");    // yyyy년 m월 출력할 곳
		tblCalendarYM.innerHTML = today.getFullYear() + "년 " + (today.getMonth()+1) + "월";  // yyyy년 m월 출력
		
		var weekday;
		
		// 기존 테이블에 뿌려진 줄, 칸 삭제
		while (tblCalendar.rows.length > 0) {
			tblCalendar.deleteRow(tblCalendar.rows.length-1); //현재 있는 열 모두 삭제
		}
		
		var row =/*  null; //주차별로 추가될 열 
		row =  */tblCalendar.insertRow();

		
		var cnt = 0; // 1일이 시작되는 칸을 맞추어 줌
		var line=0;
		for (var i=0; i<nMonth.getDay(); i++) {
			
			
			cnt+=1;
			
		}
 
		for (var i=1; i<=lastDate.getDate(); i++) { //날마다 새로운 td 추가
			var holiDate=new Date(today.getFullYear(), today.getMonth(), i);
	 		var year=today.getYear()+1900;
			var month=(today.getMonth()+1);
			var day=holiDate.getDate();
			weekday=holiDate.getDay()+1;
			
			console.log(weekday);
			console.log(cnt);
			
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
			
			lunaMonthCal(holis);
			
			switch(weekday%7){
				case 1: weekday='일'; break;
				case 2: weekday='월'; break;
				case 3: weekday='화'; break;
				case 4: weekday='수'; break;
				case 5: weekday='목'; break;
				case 6: weekday='금'; break;
				case 0: weekday='토'; break;
			}
			
			cell = row.insertCell();
			var deleterow=0;
		
			<%
			for(int k=0;k<list.size();k++){
				HashMap<String, Object> hmap1=list.get(k);%>
				if(Number(holis)==<%=hmap1.get("calendarId")%>){
					deleterow++;
				}else{
					
				}
			<%
			}%>
			console.log("deleterow:"+deleterow);
			if(deleterow==0){ //그날 일정 없으면 셀 지우기
				console.log("parent: "+cell);
				cell.remove();
			}
			if(deleterow>0){ //그날 스케줄이 있으면 그 날 요일/일정/일 표시~
				
			
			cell.innerHTML ='<span style="font-weight:bold;">'+weekday+'</span>'+'<p></p>';
			
			if((cnt+1)%7 ==1) {
				//일요일 날짜 색 red
				cell.innerHTML='<span class="sunday">'+weekday+'</span>'+'<p></p>';
			}
			if((cnt+1)%7 ==0) {
				//토요일 날짜 색 blue
				cell.innerHTML='<span class="saturday">'+weekday+'</span>'+'<p></p>';

			}
			cell.id='calSchedule'+holis+'0';
			
			cell = row.insertCell();
			cell.innerHTML ='<span style="font-weight:bold;"></span>';
			cell.id='calSchedule'+holis;
			$("#calSchedule"+holis).attr("colspan","5");
			$("#calSchedule"+holis).attr("class","scheduleList");
			
			
			cell = row.insertCell();
			cell.innerHTML ='<span style="font-weight:bold;">'+day+'</span>';

			cell.id='calSchedule'+holis+'1';
			$("#calSchedule"+holis+"1").attr("colspan","2");
			}
			line=line+3;
			cnt = cnt + 1;
			
			if (line%3 == 0) {
				// 1주일이 7일 > 7일마다 새 열 추가
				row = calendar.insertRow();// 줄 추가
			}
			if(cnt%7 ==1) {
				//일요일 날짜 색 red
				cell.innerHTML='<span class="sunday">'+i+'</span>'+'<p></p>';
			}
			if(cnt%7 ==0) {
				//토요일 날짜 색 blue
				cell.innerHTML='<span class="saturday">'+i+'</span>'+'<p></p>';

			}
			
			/*양력 공휴일 적용*/
			for(var j=0;j<holidaySol.length;j++){
				if(holis.toString().substring(4)===holidaySol[j][0].toString()){
					cell.innerHTML='<span class="sunday">'+holidaySol[j][1]+' '+i+'</span>';
					$("#calSchedule"+holis+'0').html('<span class="sunday">'+weekday+'</span>');
					if(holis.toString().substring(4)==holidaySol[2][0]){
						if(cnt%7==1){replaceHolis=1;}
						if(cnt%7==0){replaceHolis=2;}
					}
				} 
			}
			
			/*음력 공휴일 적용*/
			for(var j=0;j<holidayLun.length;j++){
				if(lunar_date.lunHolis.toString().substring(4,8)===holidayLun[j][0].toString()){
					cell.innerHTML='<span class="sunday">'+holidayLun[j][1]+' '+i+'</span>';
					if(j==0 && cnt%7==1){replaceHolis=3;}
					if(j==1 && cnt%7==1){replaceHolis=4;}
					if(j==2 && cnt%7==1){replaceHolis=5;}
					if(j==4 && cnt%7==1){replaceHolis=6;}
					if(j==5 && cnt%7==1){replaceHolis=7;}
					if(j==6 && cnt%7==1){replaceHolis=8;}
				}
				console.log(replaceHolis);
			} 	
			
			if(lunar_date.lunHolis.toString().substring(4,8)==='0103'){
				replaceLunHolis1=holis+'1';
				replaceLunHolis3=holis+'0';
			}
			if(lunar_date.lunHolis.toString().substring(4,8)==='0817'){
				replaceLunHolis2=holis+'1';
				replaceLunHolis4=holis+'0';
			}
			

		}
		
		switch(replaceHolis){
		//어린이날 대체휴일
		case 1: $("#calSchedule"+holis.toString().substring(0,4)+"05061").html('<span class="sunday">대체휴일 6</span>'); replaceHolis=0; 
					$("#calSchedule"+holis.toString().substring(0,4)+"05060").html('<span class="sunday">월</span>');break;			
		case 2: $("#calSchedule"+holis.toString().substring(0,4)+"05071").html('<span class="sunday">대체휴일 6</span>'); replaceHolis=0;
					$("#calSchedule"+holis.toString().substring(0,4)+"05070").html('<span class="sunday">월</span>');break;
		//설날 대체휴일
		case 3: $("#calSchedule"+replaceLunHolis1).html('<span class="sunday">대체휴일 '+replaceLunHolis1.substring(6, 8)+'</span>'); replaceHolis=0;
					$("#calSchedule"+replaceLunHolis3).html('<span class="sunday">월</span>');break;
		case 4: $("#calSchedule"+replaceLunHolis1).html('<span class="sunday">대체휴일 '+replaceLunHolis1.substring(6, 8)+'</span>'); replaceHolis=0;
					$("#calSchedule"+replaceLunHolis3).html('<span class="sunday">월</span>');break;
		case 5: $("#calSchedule"+replaceLunHolis1).html('<span class="sunday">대체휴일 '+replaceLunHolis1.substring(6, 8)+'</span>'); replaceHolis=0;
					$("#calSchedule"+replaceLunHolis3).html('<span class="sunday">월</span>');break;
		//추석 대체휴일
		case 6: $("#calSchedule"+replaceLunHolis2).html('<span class="sunday">대체휴일 '+replaceLunHolis2.substring(6, 8)+'</span>'); replaceHolis=0;
					$("#calSchedule"+replaceLunHolis4).html('<span class="sunday">월</span>');break;
		case 7: $("#calSchedule"+replaceLunHolis2).html('<span class="sunday">대체휴일 '+replaceLunHolis2.substring(6, 8)+'</span>'); replaceHolis=0;
					$("#calSchedule"+replaceLunHolis4).html('<span class="sunday">월</span>');break;
		case 8: $("#calSchedule"+replaceLunHolis2).html('<span class="sunday">대체휴일 '+replaceLunHolis2.substring(6, 8)+'</span>'); replaceHolis=0;
					$("#calSchedule"+replaceLunHolis4).html('<span class="sunday">월</span>');break;
		default:break;
		}
		
		<%for(int i=0;i<list.size();i++){
			HashMap<String, Object> hmap=list.get(i);%>
			if(Number(<%=hmap.get("calendarClass")%>)==1/*  && $("#Myschedule").is(":checked") */){
				$("#calSchedule"+<%=hmap.get("calendarId")%>).append("<p name='calendarClass' value='1'><input type='hidden' value='<%=hmap.get("calendarNo")%>'><%=hmap.get("calendarTime")%>"+' '+"<%=hmap.get("calendarContents")%></p>");
				$("#calSchedule"+<%=hmap.get("calendarId")%>).children("p[value='1']").css("color","#2ebe8b");
			}
			
			if(Number(<%=hmap.get("calendarClass")%>)==2/*  && $("#Teamschedule").is(":checked")  */){
				$("#calSchedule"+<%=hmap.get("calendarId")%>).append("<p name='calendarClass' value='2'><input type='hidden' value='<%=hmap.get("calendarNo")%>'><%=hmap.get("calendarTime")%>"+' '+"<%=hmap.get("calendarContents")%></p>");
				$("#calSchedule"+<%=hmap.get("calendarId")%>).children("p[value='2']").css("color","#736DCC");
			}
			
			if(Number(<%=hmap.get("calendarClass")%>)==3 /* && $("#Companyschedule").is(":checked") */){
				$("#calSchedule"+<%=hmap.get("calendarId")%>).append("<p name='calendarClass' value='3'><input type='hidden' value='<%=hmap.get("calendarNo")%>'><%=hmap.get("calendarTime")%>"+' '+"<%=hmap.get("calendarContents")%></p>");
				$("#calSchedule"+<%=hmap.get("calendarId")%>).children("p[value='3']").css("color","#C64A4A");
			}
		<%
		}%>
	}
		
	//음력 월 data
	var lunaMonthArr=[
		[2, 1, 2, 2, 1, 2, 1, 2, 1, 2, 1, 2], /* 1951 */
		[1, 2, 1, 2, 4, 2, 1, 2, 1, 2, 1, 2],
		[1, 2, 1, 1, 2, 2, 1, 2, 2, 1, 2, 2],
		[1, 1, 2, 1, 1, 2, 1, 2, 2, 1, 2, 2],
		[2, 1, 4, 1, 1, 2, 1, 2, 1, 2, 2, 2],
		[1, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2, 2],
		[2, 1, 2, 1, 2, 1, 1, 5, 2, 1, 2, 2],
		[1, 2, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2],
		[1, 2, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1],
		[2, 1, 2, 1, 2, 5, 2, 1, 2, 1, 2, 1],
		[2, 1, 2, 1, 2, 1, 2, 2, 1, 2, 1, 2], /* 1961 */
		[1, 2, 1, 1, 2, 1, 2, 2, 1, 2, 2, 1],
		[2, 1, 2, 3, 2, 1, 2, 1, 2, 2, 2, 1],
		[2, 1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 2],
		[1, 2, 1, 2, 1, 1, 2, 1, 1, 2, 2, 1],
		[2, 2, 5, 2, 1, 1, 2, 1, 1, 2, 2, 1],
		[2, 2, 1, 2, 2, 1, 1, 2, 1, 2, 1, 2],
		[1, 2, 2, 1, 2, 1, 5, 2, 1, 2, 1, 2],
		[1, 2, 1, 2, 1, 2, 2, 1, 2, 1, 2, 1],
		[2, 1, 1, 2, 2, 1, 2, 1, 2, 2, 1, 2],
		[1, 2, 1, 1, 5, 2, 1, 2, 2, 2, 1, 2], /* 1971 */
		[1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 2, 1],
		[2, 1, 2, 1, 1, 2, 1, 1, 2, 2, 2, 1],
		[2, 2, 1, 5, 1, 2, 1, 1, 2, 2, 1, 2],
		[2, 2, 1, 2, 1, 1, 2, 1, 1, 2, 1, 2],
		[2, 2, 1, 2, 1, 2, 1, 5, 2, 1, 1, 2],
		[2, 1, 2, 2, 1, 2, 1, 2, 1, 2, 1, 1],
		[2, 2, 1, 2, 1, 2, 2, 1, 2, 1, 2, 1],
		[2, 1, 1, 2, 1, 6, 1, 2, 2, 1, 2, 1],
		[2, 1, 1, 2, 1, 2, 1, 2, 2, 1, 2, 2],
		[1, 2, 1, 1, 2, 1, 1, 2, 2, 1, 2, 2], /* 1981 */
		[2, 1, 2, 3, 2, 1, 1, 2, 2, 1, 2, 2],
		[2, 1, 2, 1, 1, 2, 1, 1, 2, 1, 2, 2],
		[2, 1, 2, 2, 1, 1, 2, 1, 1, 5, 2, 2],
		[1, 2, 2, 1, 2, 1, 2, 1, 1, 2, 1, 2],
		[1, 2, 2, 1, 2, 2, 1, 2, 1, 2, 1, 1],
		[2, 1, 2, 2, 1, 5, 2, 2, 1, 2, 1, 2],
		[1, 1, 2, 1, 2, 1, 2, 2, 1, 2, 2, 1],
		[2, 1, 1, 2, 1, 2, 1, 2, 2, 1, 2, 2],
		[1, 2, 1, 1, 5, 1, 2, 1, 2, 2, 2, 2],
		[1, 2, 1, 1, 2, 1, 1, 2, 1, 2, 2, 2], /* 1991 */
		[1, 2, 2, 1, 1, 2, 1, 1, 2, 1, 2, 2],
		[1, 2, 5, 2, 1, 2, 1, 1, 2, 1, 2, 1],
		[2, 2, 2, 1, 2, 1, 2, 1, 1, 2, 1, 2],
		[1, 2, 2, 1, 2, 2, 1, 5, 2, 1, 1, 2],
		[1, 2, 1, 2, 2, 1, 2, 1, 2, 2, 1, 2],
		[1, 1, 2, 1, 2, 1, 2, 2, 1, 2, 2, 1],
		[2, 1, 1, 2, 3, 2, 2, 1, 2, 2, 2, 1],
		[2, 1, 1, 2, 1, 1, 2, 1, 2, 2, 2, 1],
		[2, 2, 1, 1, 2, 1, 1, 2, 1, 2, 2, 1],
		[2, 2, 2, 3, 2, 1, 1, 2, 1, 2, 1, 2], /* 2001 */
		[2, 2, 1, 2, 1, 2, 1, 1, 2, 1, 2, 1],
		[2, 2, 1, 2, 2, 1, 2, 1, 1, 2, 1, 2],
		[1, 5, 2, 2, 1, 2, 1, 2, 2, 1, 1, 2],
		[1, 2, 1, 2, 1, 2, 2, 1, 2, 2, 1, 2],
		[1, 1, 2, 1, 2, 1, 5, 2, 2, 1, 2, 2],
		[1, 1, 2, 1, 1, 2, 1, 2, 2, 2, 1, 2],
		[2, 1, 1, 2, 1, 1, 2, 1, 2, 2, 1, 2],
		[2, 2, 1, 1, 5, 1, 2, 1, 2, 1, 2, 2],
		[2, 1, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2],
		[2, 1, 2, 2, 1, 2, 1, 1, 2, 1, 2, 1], /* 2011 */
		[2, 1, 6, 2, 1, 2, 1, 1, 2, 1, 2, 1],
		[2, 1, 2, 2, 1, 2, 1, 2, 1, 2, 1, 2],
		[1, 2, 1, 2, 1, 2, 1, 2, 5, 2, 1, 2],
		[1, 2, 1, 1, 2, 1, 2, 2, 2, 1, 2, 2],
		[1, 1, 2, 1, 1, 2, 1, 2, 2, 1, 2, 2],
		[2, 1, 1, 2, 3, 2, 1, 2, 1, 2, 2, 2],
		[1, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2, 2],
		[2, 1, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2],
		[2, 1, 2, 5, 2, 1, 1, 2, 1, 2, 1, 2],
		[1, 2, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1], /* 2021 */
		[2, 1, 2, 1, 2, 2, 1, 2, 1, 2, 1, 2],
		[1, 5, 2, 1, 2, 1, 2, 2, 1, 2, 1, 2],
		[1, 2, 1, 1, 2, 1, 2, 2, 1, 2, 2, 1],
		[2, 1, 2, 1, 1, 5, 2, 1, 2, 2, 2, 1],
		[2, 1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 2],
		[1, 2, 1, 2, 1, 1, 2, 1, 1, 2, 2, 2],
		[1, 2, 2, 1, 5, 1, 2, 1, 1, 2, 2, 1],
		[2, 2, 1, 2, 2, 1, 1, 2, 1, 1, 2, 2],
		[1, 2, 1, 2, 2, 1, 2, 1, 2, 1, 2, 1],
		[2, 1, 5, 2, 1, 2, 2, 1, 2, 1, 2, 1], /* 2031 */
		[2, 1, 1, 2, 1, 2, 2, 1, 2, 2, 1, 2],
		[1, 2, 1, 1, 2, 1, 5, 2, 2, 2, 1, 2],
		[1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 2, 1],
		[2, 1, 2, 1, 1, 2, 1, 1, 2, 2, 1, 2],
		[2, 2, 1, 2, 1, 4, 1, 1, 2, 1, 2, 2],
		[2, 2, 1, 2, 1, 1, 2, 1, 1, 2, 1, 2],
		[2, 2, 1, 2, 1, 2, 1, 2, 1, 1, 2, 1],
		[2, 2, 1, 2, 5, 2, 1, 2, 1, 2, 1, 1],
		[2, 1, 2, 2, 1, 2, 2, 1, 2, 1, 2, 1],
		[2, 1, 1, 2, 1, 2, 2, 1, 2, 2, 1, 2],   /* 2041 */
		[1, 5, 1, 2, 1, 2, 1, 2, 2, 1, 2, 2],
		[1, 2, 1, 1, 2, 1, 1, 2, 2, 1, 2, 2],
		[2, 1, 2, 1, 1, 2, 3, 2, 1, 2, 2, 2],
		[2, 1, 2, 1, 1, 2, 1, 1, 2, 1, 2, 2],
		[2, 1, 2, 1, 2, 1, 2, 1, 1, 2, 1, 2],
		[2, 1, 2, 2, 4, 1, 2, 1, 1, 2, 1, 2],
		[1, 2, 2, 1, 2, 2, 1, 2, 1, 1, 2, 1],
		[2, 1, 2, 1, 2, 2, 1, 2, 2, 1, 2, 1],
		[1, 2, 4, 1, 2, 1, 2, 2, 1, 2, 2, 1]
	];
			
	//음력 기준일
	var lunaGeneral=new Date(1951, 1, 6);
	var solDate,solYear,solMonth,solDay;
	var interval;
	var MonthTable;
	function lunaDate(solDate){
		
		//비교일 Date화
		solDate=new Date(holis.toString().substring(0,4), (holis.toString().substring(4,6)-1), holis.toString().substring(6));
		
		//음력 날짜 비교를 위한 연/월/일 선언
		solYear=solDate.getFullYear();
		solMonth=solDate.getMonth();
		solDay=solDate.getDate();
			
		MonthTable=[31, 0, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
		//2월 일수 넣어주기
		if (((solDate.year%4==0) && (solDate.year%100!=0)) || (solDate.year%400 ==0)) MonthTable[1] = 29;
		else MonthTable[1] = 28;

		//기준일로부터 일수 계산
		if(solYear>=1951 && solYear<2051){
			interval=Math.abs(solDate.getTime() - lunaGeneral.getTime());
			interval=Math.ceil(interval /(1000 * 3600 * 24)); //기준일로부터의 날짜 구하기
		}
		
		this.year=1951;
		this.month=0;
		this.date=1;
		this.lunMonth=false;
		this.lunHolis='';
				
		if(this.month<10){
			if(this.date<10){
				this.lunHolis=this.year+'0'+(this.month+1)+'0'+this.date+this.lunMonth;
			}else{
				this.lunHolis=this.year+'0'+(this.month+1)+''+this.date+this.lunMonth;
			}
		}else{
			if(this.date<10){
				this.lunHolis=this.year+''+(this.month+1)+'0'+this.date+this.lunMonth;
			}else{
				this.lunHolis=this.year+''+(this.month+1)+''+this.date+this.lunMonth;
			}
		}
		
	}
			
	//음력 각 1년의 날짜수 구하기
	function YeartoDay(solYear) {
		var i, sum;
		sum = 0;
		
		for (i=0;i<12;i++) {
			if(solYear<1950){}
			else if(solYear>=1951 && solYear<2051){
				switch(lunaMonthArr[solYear - 1951][i]){
					case 1: sum+=29; break;
					case 2: sum+=30; break;
					case 3: sum+=58; break;
					case 4: sum+=59; break;
					case 5: sum+=59; break;
					case 6: sum+=60; break;
				}
			}else{}
		}
		return sum;	
	}
			
	//음력 월 날짜 수 구하기
	function MonthtoDay(lunar_date) {
		var monthDays=[[29, 0], [30, 0], [29, 29], [29, 30], [30, 29], [30, 30]];
		var nDays;
		if(lunar_date.lunMonth==false){
			switch(lunaMonthArr[lunar_date.year-1951][lunar_date.month]){
				case 1:nDays=29;	lunar_date.lunMonth=false; break;
				case 2:nDays=30;	lunar_date.lunMonth=false; break;
				case 3:nDays=29;	lunar_date.lunMonth=true; break;
				case 4:nDays=29;	lunar_date.lunMonth=true; break;
				case 5:nDays=30;	lunar_date.lunMonth=true; break;
				case 6:nDays=30;	lunar_date.lunMonth=true; break;
			}
		}else{ //lunMonth가 true임.
			console.log("윤달");
			switch(lunaMonthArr[lunar_date.year-1951][lunar_date.month]){
				case 3:nDays=29;	lunar_date.lunMonth=true; break;
				case 4:nDays=30;	lunar_date.lunMonth=true; break;
				case 5:nDays=29;	lunar_date.lunMonth=true; break;
				case 6:nDays=30;	lunar_date.lunMonth=true; break;
			}
		}
		return nDays;
	}

	// 양력날짜를 음력데이터형식의 날짜로 반환
	function SolarToLunar(solar_date) {
		var i, nDays, tmp, tDays;
		tDays=0;
		nDays=interval; //기준일에서 지난 날짜

		var lunar_date = new lunaDate(); // 반환할 음력 날짜를 선언. 음력 첫날로 초기화
		lunar_date.year = 1951;
		lunar_date.month = 0;
		lunar_date.day = 1;
		lunar_date.lunMonth = false;

	// nDays가 0보다 작아질때 까지, 각년도의 총 날짜수를 빼는 걸 반복해 그 루프횟수로서 현재 년도를 계산.
	// 이 루프가 종료됨과 동시에 음력데이터의 year속성은 현재 년도가 저장되게 된다.
		do {
			tmp = nDays;
			nDays -= YeartoDay(lunar_date.year);
			tDays+=YeartoDay(lunar_date.year);
			if (nDays < 0) {
				nDays = tmp;
				tDays=tDays-YeartoDay(lunar_date.year);
				break;
			}			
			lunar_date.year++;
		} while (true);

		// 1년날수 이하 > nDays를 월 단위로 빼는걸 반복해 현재 월을 계산.
		// 윤달이면 윤달 true
		do {
			tmp = nDays;
			nDays -= MonthtoDay(lunar_date);
			tDays += MonthtoDay(lunar_date);				
			if (nDays < 0) {
				nDays = tmp;
				tDays=tDays-MonthtoDay(lunar_date);
				//console.log("월계산2"+lunar_date.lunMonth);
				break;
			}
			if (lunar_date.lunMonth==true) {
				tmp = nDays;
				nDays-=MonthtoDay(lunar_date);
				tDays += MonthtoDay(lunar_date);
					
				if (nDays < 0) {
					nDays = tmp;
					tDays=tDays-MonthtoDay(lunar_date);
					lunar_date.lunMonth = false;
					lunar_date.month++;
					break;
				}else{
					lunar_date.lunMonth = false;
					lunar_date.month++;
				}
			}else {
				lunar_date.month++;
				lunar_date.lunMonth = false;
				//console.log("월계산윤달"+lunar_date.lunMonth);
			}
		} while (true);
		// 마지막으로 월단위 날짜수 이하로 작아진 nDays를 이용해 날짜를 계산
		lunar_date.date = nDays+1;
		if(lunar_date.month<9){
			if(lunar_date.date<10){
				lunar_date.lunHolis=lunar_date.year+'0'+(lunar_date.month+1)+'0'+lunar_date.date+lunar_date.lunMonth;
			}else{
				lunar_date.lunHolis=lunar_date.year+'0'+(lunar_date.month+1)+''+lunar_date.date+lunar_date.lunMonth;
			}
		}else{
			if(lunar_date.date<10){
				lunar_date.lunHolis=lunar_date.year+''+(lunar_date.month+1)+'0'+lunar_date.date+lunar_date.lunMonth;
			}else{
				lunar_date.lunHolis=lunar_date.year+''+(lunar_date.month+1)+''+lunar_date.date+lunar_date.lunMonth;
			}
			if(lunar_date.month==11 && lunar_date.date==29){
				switch(lunaMonthArr[lunar_date.year-1951][lunar_date.month]){
				case 1: lunar_date.lunHolis=(lunar_date.year+1)+'0'+1+'00'+lunar_date.lunMonth; break;
				case 2: break;
				}
			}else if(lunar_date.month==11  && lunar_date.date==30){
				switch(lunaMonthArr[lunar_date.year-1951][lunar_date.month]){
				case 1: break;
				case 2: lunar_date.lunHolis=(lunar_date.year+1)+'0'+1+'00'+lunar_date.lunMonth; break;
				}
			}
		}
		return lunar_date;
	}

	function lunaMonthCal(holis){
	
		console.log("lunaMonthCal_holis : "+holis);
		lunar_date=new lunaDate(holis.toString().substring(0,4), holis.toString().substring(4,6), holis.toString().substring(6));
		lunar_date=new SolarToLunar(solDate);

		console.log(solYear+'년'+(solMonth+1)+'월'+solDay
				+'일은 음력'+lunar_date.year+'년'+(lunar_date.month+1)+'월'+lunar_date.date+'일'+lunar_date.lunMonth);
		console.log("lunHolis : "+lunar_date.lunHolis);
		console.log("");
		console.log("");
	}
</script>
<section class="content">
	<div class="content-left">
		<div id="treeview"></div>
		<%if(loginUser!=null){ %>
		<div class="scheduleLeft">
			<div class="list">
				<input type="checkbox" id="Myschedule" name="myschedule" value="1">
				<label for="Myschedule">내 일정</label><br><br>
				<input type="checkbox" id="Teamschedule" name="teamschedule" value="2">
				<label for="Teamschedule"><%=loginUser.getDeptName() %>팀 일정</label><br><br>
				<input type="checkbox" id="Companyschedule" name="companyschedule" value="3">
				<label for="Companyschedule">회사 일정</label><br>
			</div>
		</div>
		<%} %>
	</div>
	<div class="content-right container">
	<%if(loginUser!=null){ %>
	<div class="schedule">
	<div id="goCal">
			<!-- <input type="date" name="goCalDate" id="goCalDate" size="3"> 
			<script>
				document.getElementById("goCalDate").valueAsDate=new Date();
			</script> -->
			<div id="goCalDate">
				<input type="number" id="goCalYear" min="1950" max="2050">&nbsp;<label for="goCalYear">년</label> 
				<input type="number" id="goCalMonth" min="1" max="12">&nbsp;<label for="goCalMonth">월</label>
				<div id="goCalBtn" onclick="goCalendar()">이동</div>
			</div>
 			<script>
 				$("#goCalYear").val(new Date().getFullYear());
 				$("#goCalMonth").val((new Date().getMonth())+1);
 			</script>
		</div>
		<table id="calendar" align="center">
			<thead>
				<tr id="title">
					<td onclick="prevCalendar()" id="preCal"><label style="font-size:30px"><</label></td>
					<td colspan="5" align="center"id="calendarTitle" style="font-size:30px">yyyy년 m월</td>
					<td onclick="nextCalendar()" id="nextCal"><label style="font-size:30px">></label></td>
				</tr>
				<tr id="day"> 
					<td class="day"></td>
					<td colspan="5" class="day">일정 내용</td>
					<td class="day"></td>
				</tr>
			</thead>
			<tbody id="calendarMain"> <%-- 날짜 들어가는 부분 --%>
			</tbody>
		</table>
	<div class="bottom">
		<h1> 　</h1>
	</div>
	<script language="javascript" type="text/javascript">
		/*달력 생성*/
		buildCalendar();
		
		$("#Myschedule").change(function(){
			if($("#Myschedule").is(":checked")){
				//여기에 servlet ajax
				<%for(int i=0;i<list.size();i++){
					HashMap<String, Object> hmap=list.get(i);
					if((int)hmap.get("calendarClass")==1){
				%>
						<%-- $("#calSchedule"+<%=hmap.get("calendarId")%>).append("<p name='calendarClass' value='1'><input type='hidden' value='<%=hmap.get("calendarNo")%>'><%=hmap.get("calendarTime")%>"+' '+"<%=hmap.get("calendarContents")%></p>");
						 --%>$("#calSchedule"+<%=hmap.get("calendarId")%>).children("p[value='1']").css("background","#D2EFE5");
				<%
					}
				}%>
	        }else{
	            <%for(int i=0;i<list.size();i++){
					HashMap<String, Object> hmap=list.get(i);
					if((int)hmap.get("calendarClass")==1){
			%>
						<%-- $("#calSchedule"+<%=hmap.get("calendarId")%>+" > p").remove();
						console.log(<%=hmap.get("calendarId")%>+" 삭제"); --%>
						$("#calSchedule"+<%=hmap.get("calendarId")%>).children("p[value='1']").css("background","#ffffff");
			<%
					}							
				}%>	
	        }
		});
		
		$("#Teamschedule").change(function(){
			if($("#Teamschedule").is(":checked")){
	            <%for(int i=0;i<list.size();i++){
					HashMap<String, Object> hmap=list.get(i);
					if((int)hmap.get("calendarClass")==2){
				%>	
<%-- 						$("#calSchedule"+<%=hmap.get("calendarId")%>).append("<p name='calendarClass' value='2'><input type='hidden' value='<%=hmap.get("calendarNo")%>'><%=hmap.get("calendarTime")%>"+' '+"<%=hmap.get("calendarContents")%></p>");
 --%>						$("#calSchedule"+<%=hmap.get("calendarId")%>).children("p[value='2']").css("background","#D3D1EF");
				<%
					}
				}%>
	        }else{
	            <%for(int i=0;i<list.size();i++){
	    			HashMap<String, Object> hmap=list.get(i);
	    			if((int)hmap.get("calendarClass")==2){
	    		%>	
	    				<%-- $("#calSchedule"+<%=hmap.get("calendarId")%>+" > p").remove(); --%>
	    				$("#calSchedule"+<%=hmap.get("calendarId")%>).children("p[value='2']").css("background","#ffffff");
	    		<%
	    			}
	    		}%>
	        }
		});
		
		$("#Companyschedule").change(function(){
			if($("#Companyschedule").is(":checked")){
	            <%for(int i=0;i<list.size();i++){
					HashMap<String, Object> hmap=list.get(i);
					if((int)hmap.get("calendarClass")==3){
				%>
					<%-- 	$("#calSchedule"+<%=hmap.get("calendarId")%>).append("<p name='calendarClass' value='3'><input type='hidden' value='<%=hmap.get("calendarNo")%>'><%=hmap.get("calendarTime")%>"+' '+"<%=hmap.get("calendarContents")%></p>"); --%>
						$("#calSchedule"+<%=hmap.get("calendarId")%>).children("p[value='3']").css("background","#F4C2C2");
						
				<%
					}
				}%>
	        }else{
	            <%for(int i=0;i<list.size();i++){
	    			HashMap<String, Object> hmap=list.get(i);
	    			if((int)hmap.get("calendarClass")==3){
	    		%>
	    				<%-- $("#calSchedule"+<%=hmap.get("calendarId")%>+" > p").remove(); --%>
	    				$("#calSchedule"+<%=hmap.get("calendarId")%>).children("p[value='3']").css("background","#ffffff");
	    		<%
	    			}
	    		}%>
	        }
		});

	</script> 
	</div>
	<%}else{%>
<%
		request.setAttribute("msg", "잘못된 경로로 접근했습니다.");
		request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
	} %>

</section>
<jsp:include page="/views/layout/treeview/schedule/layout-down.jsp" />