<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<jsp:include page="/views/main/mainPage.jsp" />
<link rel="stylesheet" type="text/css" href="/semi/assets/css/calendar.css">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>Calender</title>
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
		
		
		// 기존 테이블에 뿌려진 줄, 칸 삭제
		while (tblCalendar.rows.length > 0) {
			tblCalendar.deleteRow(tblCalendar.rows.length-1); //현재 있는 열 모두 삭제
		}
		
		var row = null; //주차별로 추가될 열 
		row = tblCalendar.insertRow();
		
		var cnt = 0; // 1일이 시작되는 칸을 맞추어 줌
		for (var i=0; i<nMonth.getDay(); i++) {
			cell = row.insertCell();
			cnt = cnt + 1;
		}
 
		for (var i=1; i<=lastDate.getDate(); i++) { //날마다 새로운 td 추가
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
			//console.log("진짜 holis : "+holis);
			lunaMonthCal(holis);
			

			cell = row.insertCell();
			cell.innerHTML ='<span style="font-weight:bold;">'+i+'</span>'+'<p></p>';
			cell.id='calSchedule'+holis;
			
			
			cnt = cnt + 1;
			
			if (cnt%7 == 0) {
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
					cell.innerHTML='<span class="sunday">'+i+'<br><span>'+
					holidaySol[j][1]+'</span>'+'<p></p>';
					if(holis.toString().substring(4)==holidaySol[2][0]){
						if(cnt%7==1){replaceHolis=1;}
						if(cnt%7==0){replaceHolis=2;}
					}
				} 
			}
			
			/*음력 공휴일 적용*/
			for(var j=0;j<holidayLun.length;j++){
				if(lunar_date.lunHolis.toString().substring(4,8)===holidayLun[j][0].toString()){
					cell.innerHTML='<span class="sunday">'+i+'<br>'+
					holidayLun[j][1]+'</span>';
					if(j==0 && cnt%7==1){replaceHolis=3;}
					if(j==1 && cnt%7==1){replaceHolis=4;}
					if(j==2 && cnt%7==1){replaceHolis=5;}
					if(j==4 && cnt%7==1){replaceHolis=6;}
					if(j==5 && cnt%7==1){replaceHolis=7;}
					if(j==6 && cnt%7==1){replaceHolis=8;}
				}
				console.log(replaceHolis);
			} 	
			
			if(lunar_date.lunHolis.toString().substring(4,8)==='0103'){replaceLunHolis1=holis;}
			if(lunar_date.lunHolis.toString().substring(4,8)==='0817'){replaceLunHolis2=holis;}

		}
		view();
		switch(replaceHolis){
		//어린이날 대체휴일
		case 1:$("#calSchedule"+holis.toString().substring(0,4)+"0506").html('<span class="sunday">6<br>대체휴일</span><p></p>'); replaceHolis=0; break;
		case 2:$("#calSchedule"+holis.toString().substring(0,4)+"0507").html('<span class="sunday">7<br>대체휴일</span><p></p>'); replaceHolis=0;break;
		//설날 대체휴일
		case 3: $("#calSchedule"+replaceLunHolis1).html('<span class="sunday">'+replaceLunHolis1.substring(6, 8)+'<br>대체휴일</span><p></p>'); replaceHolis=0;break;
		case 4: $("#calSchedule"+replaceLunHolis1).html('<span class="sunday">'+replaceLunHolis1.substring(6, 8)+'<br>대체휴일</span><p></p>'); replaceHolis=0;break;
		case 5: $("#calSchedule"+replaceLunHolis1).html('<span class="sunday">'+replaceLunHolis1.substring(6, 8)+'<br>대체휴일</span><p></p>'); replaceHolis=0;break;
		//추석 대체휴일
		case 6: $("#calSchedule"+replaceLunHolis2).html('<span class="sunday">'+replaceLunHolis2.substring(6, 8)+'<br>대체휴일</span><p></p>'); replaceHolis=0;break;
		case 7: $("#calSchedule"+replaceLunHolis2).html('<span class="sunday">'+replaceLunHolis2.substring(6, 8)+'<br>대체휴일</span><p></p>'); replaceHolis=0;break;
		case 8: $("#calSchedule"+replaceLunHolis2).html('<span class="sunday">'+replaceLunHolis2.substring(6, 8)+'<br>대체휴일</span><p></p>'); replaceHolis=0;break;
		default:break;
		}
		//$('#calSchecdule'+holis.toString().substring(0,4)+"1231 > span").html('6<br>대체휴일');
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

	
	//여기만 수정하면 됨 
	//루프가 두번도는 문제
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
</head>
<body>
	<div class="sideMenu">
		<div class="sideMenuHead">일정</div>
		<div class="sideMenuBody">일정관리</div>
	</div>
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