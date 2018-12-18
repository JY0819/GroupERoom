<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<html xmlns:mso="urn:schemas-microsoft-com:office:office" xmlns:msdt="uuid:C2F41010-65B3-11d1-A29F-00AA00C14882">


<head>
<meta http-equiv="Content-Language" content="ko">
<meta http-equiv="Content-Type" content="text/html; charset=ks_c_5601-1987">
<title>Calendar</title>
</head>


<script type="text/javascript">
	var rege_0_type = "calendar";
	var rege_0_1 = "";
	var rege_0_2 = "";
</script>


<body>
	<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="115" id="AutoNumber1" align="right">
		<tr>
			<td width="115" align="center"><font face=Arial><b><span id="toDay_yearmonth">2007년 5월</span></b></font></td>
		</tr>
		<tr>
			<td width="115" align="center"><font face=Arial color=#002bb8 size=7><span id="toDay_day">24</span></font></td>
		</tr>
		<tr>
			<td width="115" align="center"><font face=Arial><span id="toDay_weekday">목요일</span></font></td>
		</tr>
		<tr>
			<td width="115" align="center"><font face=Arial><span id="toDay_con">음력 4월 8일</span></font></td>
		</tr>
	</table>
<style type="text/css">

 a:link { text-decoration: none;}
 a:visited { text-decoration: none;}
 TD { text-align: center; vertical-align: middle;}
 .CalHead { font:bold 8pt Arial; color: white;}
 .CalCell { font:8pt Arial; cursor: hand;}
 .HeadBtn { vertical-align:middle; height:22; width:18; font:10pt Fixedsys;}
 .HeadBox { vertical-align:middle; font:10pt;}
 .Today { font:bold 10pt Arial; color:white;}

</style>


<script type=text/javascript>
	var yearSelect;
	var monthSelect;
	var oYearSelect;
	var todayDate;


	if (typeof(headerfooter_time_year) != "undefined"){
 	/* 오늘의 날짜를 서버 날짜로 설정 */
 		todayDate = new Date(
		headerfooter_time_year, headerfooter_time_month - 1,
		headerfooter_time_day, headerfooter_time_hour,
		headerfooter_time_minute, headerfooter_time_second);
	}else
		todayDate = new Date();

		function getToDate(){
			var date = new Date();
			var year = date.getFullYear();
			var month = (date.getMonth()+1);
			var day = date.getDate();
			var weekday= new Array('일','월','화','수','목','금','토');
			var wkd= date.getDay();
			toDay_yearmonth.innerText = year+"년 "+month+"월";
			toDay_day.innerText = day;
			toDay_weekday.innerText = weekday[wkd]+"요일";
		}


		function getLunarDate(){
			var date = new Date();
			var year = date.getFullYear();
			var month = (date.getMonth()+1);
			var day = date.getDate();
			var date = lunarCalc(year, month, day, 1);
			toDay_con.innerText = "음력 " + (date.leapMonth ? "윤" : "") + date.month + "월 " + date.day + "일";
		}


		//음력변환 함수
		function conversion(){
			var year = a.value;
			var monty = b.value;
			var day = c.value;
			lunarCalc(a, b, c, 1, 0);
		}


		function memorialDay(name, month, day, solarLunar, holiday, type){
			this.name = name;
			this.month = month;
			this.day = day;
			this.solarLunar = solarLunar;
			this.holiday = holiday; /* true : 빨간날 false : 안빨간날 */
			this.type = type; /* true : real time setting */
			this.techneer = true;
		}


		//매년 반복되는 기념일
		var memorialDays = Array (
			new memorialDay("신정", 1, 1, 1, true),
			new memorialDay("", 12, 0, 2, true, true), /* 실시간으로 정해짐 */
			new memorialDay("설날", 1, 1, 2, true),
			new memorialDay("", 1, 2, 2, true),
			new memorialDay("3·1절", 3, 1, 1, true),
			new memorialDay("식목일", 4, 5, 1, true),
			new memorialDay("석가탄신일", 4, 8, 2, true),
			new memorialDay("어린이날", 5, 5, 1, true),
			new memorialDay("현충일", 6, 6, 1, true),
			new memorialDay("제헌절", 7, 17, 1, true),
			new memorialDay("광복절", 8, 15, 1, true),
			new memorialDay("", 8, 14, 2, true),
			new memorialDay("추석", 8, 15, 2, true),
			new memorialDay("", 8, 16, 2, true),
			new memorialDay("개천절", 10, 3, 1, true),
			new memorialDay("성탄절", 12, 25, 1, true)
		);


		function myDate(year, month, day, leapMonth){
			this.year = year;
			this.month = month;
			this.day = day;
			this.leapMonth = leapMonth;
		}


// 음력 데이터 (평달 - 작은달 :1,  큰달:2 )
// (윤달이 있는 달 - 평달이 작고 윤달도 작으면 :3 , 평달이 작고 윤달이 크면 : 4)
// (윤달이 있는 달 - 평달이 크고 윤달이 작으면 :5,  평달과 윤달이 모두 크면 : 6)
var lunarMonthTable = [
<!--[1, 2, 2, 1, 2, 1, 2, 1, 2, 1, 1, 2],
[2, 1, 2, 5, 2, 1, 2, 1, 2, 1, 2, 1],
[1, 2, 2, 1, 2, 1, 2, 2, 1, 2, 1, 2], /* 1801 */
[1, 1, 2, 1, 2, 1, 2, 2, 2, 1, 2, 1],
[2, 3, 2, 1, 2, 1, 2, 2, 1, 2, 2, 1],
[2, 1, 1, 2, 1, 1, 2, 2, 1, 2, 2, 2],
[1, 2, 1, 2, 1, 3, 2, 1, 2, 2, 2, 1],
[2, 2, 1, 2, 1, 1, 1, 2, 1, 2, 2, 1],
[2, 2, 2, 1, 1, 2, 1, 1, 2, 1, 2, 2],
[1, 2, 2, 1, 5, 2, 1, 2, 1, 1, 2, 1],
[2, 2, 1, 2, 2, 1, 2, 1, 2, 1, 1, 2],
[1, 2, 1, 2, 2, 1, 2, 2, 1, 2, 1, 2],
[1, 1, 5, 2, 1, 2, 2, 1, 2, 2, 1, 2], /* 1811 */
[1, 1, 2, 1, 2, 1, 2, 1, 2, 2, 2, 1],
[2, 1, 2, 1, 1, 1, 2, 1, 2, 2, 2, 1],
[2, 5, 2, 1, 1, 1, 2, 1, 2, 2, 1, 2],
[2, 2, 1, 1, 2, 1, 1, 2, 1, 2, 1, 2],
[2, 2, 1, 2, 1, 5, 1, 2, 1, 2, 1, 2],
[2, 1, 2, 2, 1, 2, 1, 2, 1, 1, 2, 1],
[2, 1, 2, 2, 1, 2, 2, 1, 2, 1, 1, 2],
[1, 2, 1, 5, 2, 2, 1, 2, 2, 1, 2, 1],
[1, 2, 1, 2, 1, 2, 1, 2, 2, 2, 1, 2],
[1, 1, 2, 1, 1, 2, 1, 2, 2, 2, 1, 2], /* 1821 */
[2, 1, 5, 1, 1, 2, 1, 2, 2, 1, 2, 2],
[2, 1, 2, 1, 1, 1, 2, 1, 2, 1, 2, 2],
[2, 1, 2, 1, 2, 1, 4, 1, 2, 1, 2, 2],
[2, 1, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2],
[2, 1, 2, 2, 1, 2, 1, 1, 2, 1, 2, 1],
[2, 1, 2, 2, 4, 1, 2, 1, 2, 1, 2, 1],
[2, 1, 2, 1, 2, 2, 1, 2, 1, 2, 1, 2],
[1, 2, 1, 2, 1, 2, 1, 2, 2, 1, 2, 2],
[1, 1, 2, 3, 2, 1, 2, 2, 1, 2, 2, 2],
[1, 1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 2], /* 1831 */
[1, 2, 1, 2, 1, 1, 2, 1, 5, 2, 2, 2],
[1, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2, 2],
[1, 2, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2],
[1, 2, 2, 1, 2, 5, 1, 2, 1, 2, 1, 2],
[1, 2, 1, 2, 2, 1, 2, 1, 2, 1, 2, 1],
[2, 1, 2, 1, 2, 1, 2, 2, 1, 2, 1, 2],
[1, 2, 1, 5, 1, 2, 2, 1, 2, 2, 1, 2],
[1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 2, 1],
[2, 1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 2],
[1, 2, 4, 1, 1, 2, 1, 2, 1, 2, 2, 1],   /* 1841 */
[2, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2, 1],
[2, 2, 2, 1, 2, 1, 4, 1, 2, 1, 2, 1],
[2, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2],
[1, 2, 1, 2, 2, 1, 2, 1, 2, 1, 2, 1],
[2, 1, 2, 1, 5, 2, 1, 2, 2, 1, 2, 1],
[2, 1, 1, 2, 1, 2, 1, 2, 2, 2, 1, 2],
[1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 2, 1],
[2, 1, 2, 3, 2, 1, 2, 1, 2, 1, 2, 2],
[2, 1, 2, 1, 1, 2, 1, 1, 2, 2, 1, 2],
[2, 2, 1, 2, 1, 1, 2, 3, 2, 1, 2, 2],   /* 1851 */
[2, 1, 2, 2, 1, 1, 2, 1, 2, 1, 1, 2],
[2, 1, 2, 2, 1, 2, 1, 2, 1, 2, 1, 2],
[1, 2, 1, 2, 1, 2, 5, 2, 1, 2, 1, 2],
[1, 1, 2, 1, 2, 2, 1, 2, 2, 1, 2, 1],
[2, 1, 1, 2, 1, 2, 1, 2, 2, 2, 1, 2],
[1, 2, 1, 1, 5, 2, 1, 2, 1, 2, 2, 2],
[1, 2, 1, 1, 2, 1, 1, 2, 2, 1, 2, 2],
[2, 1, 2, 1, 1, 2, 1, 1, 2, 1, 2, 2],
[2, 1, 6, 1, 1, 2, 1, 1, 2, 1, 2, 2],
[1, 2, 2, 1, 2, 1, 2, 1, 2, 1, 1, 2],   /* 1861 */
[2, 1, 2, 1, 2, 2, 1, 5, 2, 1, 1, 2],
[1, 2, 2, 1, 2, 1, 2, 2, 1, 2, 1, 2],
[1, 1, 2, 1, 2, 1, 2, 2, 1, 2, 2, 1],
[2, 1, 1, 2, 4, 1, 2, 2, 1, 2, 2, 1],
[2, 1, 1, 2, 1, 1, 2, 2, 1, 2, 2, 2],
[1, 2, 1, 1, 2, 1, 1, 2, 1, 2, 2, 2],
[1, 2, 2, 3, 2, 1, 1, 2, 1, 2, 2, 1],
[2, 2, 2, 1, 1, 2, 1, 1, 2, 1, 2, 1],
[2, 2, 2, 1, 2, 1, 2, 1, 1, 5, 2, 1],
[2, 2, 1, 2, 2, 1, 2, 1, 2, 1, 1, 2],   /* 1871 */
[1, 2, 1, 2, 2, 1, 2, 1, 2, 2, 1, 2],
[1, 1, 2, 1, 2, 4, 2, 1, 2, 2, 1, 2],
[1, 1, 2, 1, 2, 1, 2, 1, 2, 2, 2, 1],
[2, 1, 1, 2, 1, 1, 2, 1, 2, 2, 2, 1],
[2, 2, 1, 1, 5, 1, 2, 1, 2, 2, 1, 2],
[2, 2, 1, 1, 2, 1, 1, 2, 1, 2, 1, 2],
[2, 2, 1, 2, 1, 2, 1, 1, 2, 1, 2, 1],
[2, 2, 4, 2, 1, 2, 1, 1, 2, 1, 2, 1],
[2, 1, 2, 2, 1, 2, 2, 1, 2, 1, 1, 2],
[1, 2, 1, 2, 1, 2, 5, 2, 2, 1, 2, 1],   /* 1881 */
[1, 2, 1, 2, 1, 2, 1, 2, 2, 1, 2, 2],
[1, 1, 2, 1, 1, 2, 1, 2, 2, 2, 1, 2],
[2, 1, 1, 2, 3, 2, 1, 2, 2, 1, 2, 2],
[2, 1, 1, 2, 1, 1, 2, 1, 2, 1, 2, 2],
[2, 1, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2],
[2, 2, 1, 5, 2, 1, 1, 2, 1, 2, 1, 2],
[2, 1, 2, 2, 1, 2, 1, 1, 2, 1, 2, 1],
[2, 1, 2, 2, 1, 2, 1, 2, 1, 2, 1, 2],
[1, 5, 2, 1, 2, 2, 1, 2, 1, 2, 1, 2],
[1, 2, 1, 2, 1, 2, 1, 2, 2, 1, 2, 2],   /* 1891 */
[1, 1, 2, 1, 1, 5, 2, 2, 1, 2, 2, 2],
[1, 1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 2],
[1, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2, 2],
[2, 1, 2, 1, 5, 1, 2, 1, 2, 1, 2, 1],
[2, 2, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2],
[1, 2, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1],
[2, 1, 5, 2, 2, 1, 2, 1, 2, 1, 2, 1],
[2, 1, 2, 1, 2, 1, 2, 2, 1, 2, 1, 2],
[1, 2, 1, 1, 2, 1, 2, 5, 2, 2, 1, 2],
[1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 2, 1],   /* 1901 */
[2, 1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 2],
[1, 2, 1, 2, 3, 2, 1, 1, 2, 2, 1, 2],
[2, 2, 1, 2, 1, 1, 2, 1, 1, 2, 2, 1],
[2, 2, 1, 2, 2, 1, 1, 2, 1, 2, 1, 2],
[1, 2, 2, 4, 1, 2, 1, 2, 1, 2, 1, 2],
[1, 2, 1, 2, 1, 2, 2, 1, 2, 1, 2, 1],
[2, 1, 1, 2, 2, 1, 2, 1, 2, 2, 1, 2],
[1, 5, 1, 2, 1, 2, 1, 2, 2, 2, 1, 2],
[1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 2, 1],
[2, 1, 2, 1, 1, 5, 1, 2, 2, 1, 2, 2],   /* 1911 */
[2, 1, 2, 1, 1, 2, 1, 1, 2, 2, 1, 2],
[2, 2, 1, 2, 1, 1, 2, 1, 1, 2, 1, 2],
[2, 2, 1, 2, 5, 1, 2, 1, 2, 1, 1, 2],
[2, 1, 2, 2, 1, 2, 1, 2, 1, 2, 1, 2],
[1, 2, 1, 2, 1, 2, 2, 1, 2, 1, 2, 1],
[2, 3, 2, 1, 2, 2, 1, 2, 2, 1, 2, 1],
[2, 1, 1, 2, 1, 2, 1, 2, 2, 1, 2, 2],
[1, 2, 1, 1, 2, 1, 5, 2, 1, 2, 2, 2],
[1, 2, 1, 1, 2, 1, 1, 2, 2, 1, 2, 2],
[2, 1, 2, 1, 1, 2, 1, 1, 2, 1, 2, 2],   /* 1921 */
[2, 1, 2, 2, 3, 2, 1, 1, 2, 1, 2, 2],
[1, 2, 2, 1, 2, 1, 2, 1, 1, 2, 1, 2],
[2, 1, 2, 1, 2, 2, 1, 2, 1, 2, 1, 1],
[2, 1, 2, 5, 2, 1, 2, 2, 1, 2, 1, 2],
[1, 1, 2, 1, 2, 1, 2, 2, 1, 2, 2, 1],
[2, 1, 1, 2, 1, 2, 1, 2, 2, 1, 2, 2],
[1, 5, 1, 2, 1, 1, 2, 2, 1, 2, 2, 2],
[1, 2, 1, 1, 2, 1, 1, 2, 1, 2, 2, 2],
[1, 2, 2, 1, 1, 5, 1, 2, 1, 2, 2, 1],
[2, 2, 1, 2, 1, 2, 1, 1, 2, 1, 2, 1],   /* 1931 */
[2, 2, 2, 1, 2, 1, 2, 1, 1, 2, 1, 2],
[1, 2, 2, 1, 6, 1, 2, 1, 2, 1, 1, 2],
[1, 2, 1, 2, 2, 1, 2, 1, 2, 2, 1, 2],
[1, 1, 2, 1, 2, 1, 2, 2, 1, 2, 2, 1],
[2, 1, 4, 1, 1, 2, 2, 1, 2, 2, 2, 1],
[2, 1, 1, 2, 1, 1, 2, 1, 2, 2, 2, 1],
[2, 2, 1, 1, 2, 1, 4, 1, 2, 2, 1, 2],
[2, 2, 1, 1, 2, 1, 1, 2, 1, 2, 1, 2],
[2, 2, 1, 2, 1, 2, 1, 1, 2, 1, 2, 1],
[2, 2, 1, 2, 2, 4, 1, 1, 2, 1, 2, 1],   /* 1941 */
[2, 1, 2, 2, 1, 2, 2, 1, 1, 2, 1, 2],
[1, 2, 1, 2, 1, 2, 2, 1, 2, 1, 2, 1],
[2, 1, 2, 4, 1, 2, 1, 2, 2, 1, 2, 2],
[1, 1, 2, 1, 1, 2, 1, 2, 2, 2, 1, 2],
[2, 1, 1, 2, 1, 1, 2, 1, 2, 2, 1, 2],
[2, 5, 1, 2, 1, 1, 2, 1, 2, 1, 2, 2],
[2, 1, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2],
[2, 1, 2, 2, 1, 2, 3, 2, 1, 2, 1, 2],
[1, 2, 2, 2, 1, 2, 1, 1, 2, 1, 2, 1],-->
[2, 1, 2, 2, 1, 2, 1, 2, 1, 2, 1, 2],   /* 1951 */
[1, 2, 1, 2, 4, 1, 2, 2, 1, 2, 1, 2],
[1, 2, 1, 1, 2, 2, 1, 2, 2, 1, 2, 2],
[1, 1, 2, 1, 1, 2, 1, 2, 2, 1, 2, 2],
[2, 1, 4, 1, 1, 2, 1, 2, 1, 2, 2, 2],
[1, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2, 2],
[2, 1, 2, 1, 2, 1, 1, 5, 2, 1, 2, 2],
[1, 2, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2],
[1, 2, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1],
[2, 1, 2, 1, 2, 5, 2, 1, 2, 1, 2, 1],
[2, 1, 2, 1, 2, 1, 2, 2, 1, 2, 1, 2],   /* 1961 */
[1, 2, 1, 1, 2, 1, 2, 2, 1, 2, 2, 1],
[2, 1, 2, 3, 2, 1, 2, 1, 2, 2, 2, 1],
[2, 1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 2],
[1, 2, 1, 2, 1, 1, 2, 1, 1, 2, 2, 2],
[1, 2, 5, 2, 1, 1, 2, 1, 1, 2, 2, 1],
[2, 2, 1, 2, 2, 1, 1, 2, 1, 2, 1, 2],
[1, 2, 1, 2, 2, 1, 5, 2, 1, 2, 1, 2],
[1, 2, 1, 2, 1, 2, 2, 1, 2, 1, 2, 1],
[2, 1, 1, 2, 1, 2, 2, 1, 2, 2, 1, 2],
[1, 2, 1, 1, 5, 2, 1, 2, 2, 2, 1, 2],   /* 1971 */
[1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 2, 1],
[2, 1, 2, 1, 1, 2, 1, 1, 2, 2, 1, 2],
[2, 2, 1, 5, 1, 2, 1, 1, 2, 2, 1, 2],
[2, 2, 1, 2, 1, 1, 2, 1, 1, 2, 1, 2],
[2, 2, 1, 2, 1, 2, 1, 5, 1, 2, 1, 2],
[2, 1, 2, 2, 1, 2, 1, 2, 1, 2, 1, 1],
[2, 1, 2, 2, 1, 2, 2, 1, 2, 1, 2, 1],
[2, 1, 1, 2, 1, 6, 1, 2, 2, 1, 2, 1],
[2, 1, 1, 2, 1, 2, 1, 2, 2, 1, 2, 2],
[1, 2, 1, 1, 2, 1, 1, 2, 2, 1, 2, 2],   /* 1981 */
[2, 1, 2, 3, 2, 1, 1, 2, 1, 2, 2, 2],
[2, 1, 2, 1, 1, 2, 1, 1, 2, 1, 2, 2],
[2, 1, 2, 2, 1, 1, 2, 1, 1, 5, 2, 2],
[1, 2, 2, 1, 2, 1, 2, 1, 1, 2, 1, 2],
[1, 2, 2, 1, 2, 2, 1, 2, 1, 2, 1, 1],
[2, 1, 2, 1, 2, 5, 2, 2, 1, 2, 1, 2],
[1, 1, 2, 1, 2, 1, 2, 2, 1, 2, 2, 1],
[2, 1, 1, 2, 1, 2, 1, 2, 1, 2, 2, 2],
[1, 2, 1, 1, 5, 1, 2, 2, 1, 2, 2, 2],
[1, 2, 1, 1, 2, 1, 1, 2, 1, 2, 2, 2],   /* 1991 */
[1, 2, 2, 1, 1, 2, 1, 1, 2, 1, 2, 2],
[1, 2, 5, 2, 1, 2, 1, 1, 2, 1, 2, 1],
[2, 2, 2, 1, 2, 1, 2, 1, 1, 2, 1, 2],
[1, 2, 2, 1, 2, 1, 2, 5, 2, 1, 1, 2],
[1, 2, 1, 2, 2, 1, 2, 1, 2, 2, 1, 1],
[2, 1, 2, 1, 2, 1, 2, 2, 1, 2, 2, 1],
[2, 1, 1, 2, 3, 2, 2, 1, 2, 2, 2, 1],
[2, 1, 1, 2, 1, 1, 2, 1, 2, 2, 2, 1],
[2, 2, 1, 1, 2, 1, 1, 2, 1, 2, 2, 1],
[2, 2, 1, 5, 2, 1, 1, 2, 1, 2, 1, 2],   /* 2001 */
[2, 2, 1, 2, 1, 2, 1, 1, 2, 1, 2, 1],
[2, 2, 1, 2, 2, 1, 2, 1, 1, 2, 1, 2],
[1, 5, 2, 2, 1, 2, 1, 2, 1, 2, 1, 2],
[1, 2, 1, 2, 1, 2, 2, 1, 2, 1, 2, 1],
[2, 1, 2, 1, 2, 1, 5, 2, 2, 1, 2, 2],
[1, 1, 2, 1, 1, 2, 1, 2, 2, 2, 1, 2],
[2, 1, 1, 2, 1, 1, 2, 1, 2, 2, 1, 2],
[2, 2, 1, 1, 5, 1, 2, 1, 2, 1, 2, 2],
[2, 1, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2],
[2, 1, 2, 2, 1, 2, 1, 1, 2, 1, 2, 1],   /* 2011 */
[2, 1, 2, 5, 2, 2, 1, 1, 2, 1, 2, 1],
[2, 1, 2, 2, 1, 2, 1, 2, 1, 2, 1, 2],
[1, 2, 1, 2, 1, 2, 1, 2, 5, 2, 1, 2],
[1, 2, 1, 1, 2, 1, 2, 2, 2, 1, 2, 1],
[2, 1, 2, 1, 1, 2, 1, 2, 2, 1, 2, 2],
[1, 2, 1, 2, 1, 4, 1, 2, 1, 2, 2, 2],
[1, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2, 2],
[2, 1, 2, 1, 2, 1, 1, 2, 1, 1, 2, 2],
[2, 1, 2, 5, 2, 1, 1, 2, 1, 2, 1, 2],
[1, 2, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1],   /* 2021 */
[2, 1, 2, 1, 2, 2, 1, 2, 1, 2, 1, 2],
[1, 5, 2, 1, 2, 1, 2, 2, 1, 2, 1, 2],
[1, 2, 1, 1, 2, 1, 2, 2, 1, 2, 2, 1],
[2, 1, 2, 1, 1, 5, 2, 1, 2, 2, 2, 1],
[2, 1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 2],
[1, 2, 1, 2, 1, 1, 2, 1, 1, 2, 2, 1],
[2, 2, 2, 1, 5, 1, 2, 1, 1, 2, 2, 1],
[2, 2, 1, 2, 2, 1, 1, 2, 1, 1, 2, 2],
[1, 2, 1, 2, 2, 1, 2, 1, 2, 1, 2, 1],
[2, 1, 5, 2, 1, 2, 2, 1, 2, 1, 2, 1],   /* 2031 */
[2, 1, 1, 2, 1, 2, 2, 1, 2, 2, 1, 2],
[1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 5, 2],
[1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 1, 2],
[2, 1, 2, 1, 1, 2, 1, 1, 2, 2, 1, 2],
[2, 2, 1, 2, 1, 4, 1, 1, 2, 2, 1, 2],
[2, 2, 1, 2, 1, 1, 2, 1, 1, 2, 1, 2],
[2, 2, 1, 2, 1, 2, 1, 2, 1, 1, 2, 1],
[2, 2, 1, 2, 5, 2, 1, 2, 1, 2, 1, 1],
[2, 1, 2, 2, 1, 2, 1, 2, 2, 1, 2, 1],
[2, 1, 1, 2, 1, 2, 2, 1, 2, 2, 1, 2],   /* 2041 */
[1, 5, 1, 2, 1, 2, 1, 2, 2, 1, 2, 2],
[1, 2, 1, 1, 2, 1, 1, 2, 2, 1, 2, 2],
[2, 1, 2, 1, 1, 2, 3, 2, 1, 2, 2, 2],
[2, 1, 2, 1, 1, 2, 1, 1, 2, 1, 2, 2],
[2, 1, 2, 1, 2, 1, 2, 1, 1, 2, 1, 2],
[2, 1, 2, 2, 4, 1, 2, 1, 1, 2, 1, 2],
[1, 2, 2, 1, 2, 2, 1, 2, 1, 1, 2, 1],
[2, 1, 2, 1, 2, 2, 1, 2, 2, 1, 2, 1],
[1, 2, 4, 1, 2, 1, 2, 2, 1, 2, 2, 1],
<!-- [2, 1, 1, 2, 1, 1, 2, 2, 1, 2, 2, 2],   /* 2051 */
[1, 2, 1, 1, 2, 1, 1, 5, 2, 2, 2, 2],
[1, 2, 1, 1, 2, 1, 1, 2, 1, 2, 2, 2],
[1, 2, 2, 1, 1, 2, 1, 1, 2, 1, 2, 2],
[1, 2, 2, 1, 2, 4, 1, 1, 2, 1, 2, 1],
[2, 2, 2, 1, 2, 1, 2, 1, 1, 2, 1, 2],
[1, 2, 2, 1, 2, 1, 2, 2, 1, 1, 2, 1],
[2, 1, 2, 4, 2, 1, 2, 1, 2, 2, 1, 1],
[2, 1, 2, 1, 2, 1, 2, 2, 1, 2, 2, 1],
[2, 1, 1, 2, 1, 1, 2, 2, 1, 2, 2, 1],
[2, 2, 3, 2, 1, 1, 2, 1, 2, 2, 2, 1],   /* 2061 */
[2, 2, 1, 1, 2, 1, 1, 2, 1, 2, 2, 1],
[2, 2, 1, 2, 1, 2, 3, 2, 1, 2, 1, 2],
[2, 2, 1, 2, 1, 2, 1, 1, 2, 1, 2, 1],
[2, 2, 1, 2, 2, 1, 2, 1, 1, 2, 1, 2],
[1, 2, 1, 2, 5, 2, 1, 2, 1, 2, 1, 2],
[1, 2, 1, 2, 1, 2, 2, 1, 2, 1, 2, 1],
[2, 1, 2, 1, 1, 2, 2, 1, 2, 2, 1, 2],
[1, 2, 1, 5, 1, 2, 1, 2, 2, 2, 1, 2],
[2, 1, 1, 2, 1, 1, 2, 1, 2, 2, 1, 2],
[2, 1, 2, 1, 2, 1, 1, 5, 2, 1, 2, 2],   /* 2071 */
[2, 1, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2],
[2, 1, 2, 2, 1, 2, 1, 1, 2, 1, 2, 1],
[2, 1, 2, 2, 1, 5, 2, 1, 2, 1, 2, 1],
[2, 1, 2, 1, 2, 2, 1, 2, 1, 2, 1, 2],
[1, 2, 1, 2, 1, 2, 1, 2, 2, 1, 2, 1],
[2, 1, 2, 3, 2, 1, 2, 2, 2, 1, 2, 1],
[2, 1, 2, 1, 1, 2, 1, 2, 2, 1, 2, 2],
[1, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2, 2],
[2, 1, 5, 2, 1, 1, 2, 1, 2, 1, 2, 2],
[1, 2, 2, 1, 2, 1, 1, 2, 1, 1, 2, 2],   /* 2081 */
[1, 2, 2, 2, 1, 2, 3, 2, 1, 1, 2, 2],
[1, 2, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1],
[2, 1, 2, 1, 2, 2, 1, 2, 1, 2, 1, 2],
[1, 2, 1, 1, 6, 1, 2, 2, 1, 2, 1, 2],
[1, 2, 1, 1, 2, 1, 2, 2, 1, 2, 2, 1],
[2, 1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 2],
[1, 2, 1, 5, 1, 2, 1, 1, 2, 2, 2, 1],
[2, 2, 1, 2, 1, 1, 2, 1, 1, 2, 2, 1],
[2, 2, 2, 1, 2, 1, 1, 5, 1, 2, 2, 1],
[2, 2, 1, 2, 1, 2, 1, 2, 1, 1, 2, 1],   /* 2091 */
[2, 2, 1, 2, 2, 1, 2, 1, 2, 1, 2, 1],
[1, 2, 2, 1, 2, 4, 2, 1, 2, 1, 2, 1],
[2, 1, 1, 2, 1, 2, 2, 1, 2, 2, 1, 2],
[1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 2, 1],
[2, 1, 2, 3, 2, 1, 1, 2, 2, 2, 1, 2],
[2, 1, 2, 1, 1, 2, 1, 1, 2, 2, 1, 2],
[2, 2, 1, 2, 1, 1, 2, 1, 1, 2, 1, 2],
[2, 5, 2, 2, 1, 1, 2, 1, 1, 2, 1, 2],
[2, 2, 1, 2, 1, 2, 1, 2, 1, 1, 2, 1],
[2, 2, 1, 2, 2, 1, 5, 2, 1, 1, 2, 1] -->];


/* 양력 <-> 음력 변환 함수
 * type : 1 - 양력 -> 음력
 *        2 - 음력 -> 양력
 * leapmonth : 0 - 평달
 *             1 - 윤달 (type = 2 일때만 유효)
*/
		function lunarCalc(year, month, day, type, leapmonth){
			var solYear, solMonth, solDay;
			var lunYear, lunMonth, lunDay;
			var lunLeapMonth, lunMonthDay;
			var i, lunIndex;

			var solMonthDay = [31, 0, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];


 			/* range check */
			if (year < 1800 || year > 2101){
				alert('1800년부터 2101년까지만 지원합니다');
				return;
 			}
			
 			/* 속도 개선을 위해 기준 일자를 여러개로 한다 */
 			if (year >= 2040){
  			/* 기준일자 양력 2040년 1월 1일 (음력 2039년 11월 17일) */
				solYear = 2040;
				solMonth = 1;
				solDay = 1;
				lunYear = 2039;
				lunMonth = 11;
				lunDay = 17;
				lunLeapMonth = 0;
				
				solMonthDay[1] = 29; /* 2040 년 2월 28일 */
				lunMonthDay = 29; /* 2039년 11월 */
 			}else if (year >= 2020){
			/* 기준일자 양력 2020년 1월 1일 (음력 2019년 12월 7일) */
				solYear = 2020;
				solMonth = 1;
				solDay = 1;
				lunYear = 2019;
				lunMonth = 12;
				lunDay = 7;
				lunLeapMonth = 0;

				solMonthDay[1] = 29; /* 2020 년 2월 28일 */
				lunMonthDay = 30; /* 2019년 12월 */
			}else if (year >= 2000){
			/* 기준일자 양력 2000년 1월 1일 (음력 1999년 11월 25일) */
				solYear = 2000;
				solMonth = 1;
				solDay = 1;
				lunYear = 1999;
				lunMonth = 11;
				lunDay = 25;
				lunLeapMonth = 0;

				solMonthDay[1] = 29; /* 2000 년 2월 28일 */
				lunMonthDay = 30; /* 1999년 11월 */
			}else if (year >= 1980){
			/* 기준일자 양력 1980년 1월 1일 (음력 1979년 11월 14일) */
				solYear = 1980;
				solMonth = 1;
				solDay = 1;
				lunYear = 1979;
				lunMonth = 11;
				lunDay = 14;
				lunLeapMonth = 0;

				solMonthDay[1] = 29; /* 1980 년 2월 28일 */
				lunMonthDay = 30; /* 1979년 11월 */
			}else if (year >= 1960){
			/* 기준일자 양력 1960년 1월 1일 (음력 1959년 12월 3일) */
				solYear = 1960;
				solMonth = 1;
				solDay = 1;
				lunYear = 1959;
				lunMonth = 12;
				lunDay = 3;
				lunLeapMonth = 0;

				solMonthDay[1] = 29; /* 1960 년 2월 28일 */
				lunMonthDay = 29; /* 1959년 12월 */
			}else if (year >= 1951){
			/* 기준일자 양력 1951년 1월 1일 (음력 1950년 11월 24일) */
				solYear = 1951;
				solMonth = 1;
				solDay = 1;
				lunYear = 1950;
				lunMonth = 11;
				lunDay = 24;
				lunLeapMonth = 0;
				
				solMonthDay[1] = 28; /* 1951 년 2월 28일 */
				lunMonthDay = 29; /* 1939년 11월 */
			}


			lunIndex = lunYear - 1950;


			while (true){
				if (type == 1 &&
					year == solYear &&
					month == solMonth &&
					day == solDay){
					return new myDate(lunYear, lunMonth, lunDay, lunLeapMonth);
				}else if (type == 2 &&
							year == lunYear &&
							month == lunMonth &&
							day == lunDay &&
							leapmonth == lunLeapMonth){
					return new myDate(solYear, solMonth, solDay, 0);
				}


			/* add a day of solar calendar */
			if (solMonth == 12 && solDay == 31){
				solYear++;
				solMonth = 1;
				solDay = 1;

				/* set monthDay of Feb */
				if (solYear % 400 == 0){
					solMonthDay[1] = 29;
				}else if (solYear % 100 == 0){
					solMonthDay[1] = 28;
				}else if (solYear % 4 == 0){
					solMonthDay[1] = 29;
				}else{
					solMonthDay[1] = 28;
				}
			}else if (solMonthDay[solMonth - 1] == solDay){
				solMonth++;
				solDay = 1;
			}else{
				solDay++;
			}
			/* add a day of lunar calendar */
			if (lunMonth == 12 &&
				((lunarMonthTable[lunIndex][lunMonth - 1] == 1 && lunDay == 29) ||
				(lunarMonthTable[lunIndex][lunMonth - 1] == 2 && lunDay == 30))){
				lunYear++;
				lunMonth = 1;
				lunDay = 1;
				if (lunYear > 2050) {
					alert("입력하신 날 또는 달은 없습니다. 다시 입력하시기 바랍니다.");
					break;
				}
			}
			lunIndex = lunYear - 1950;
			
			if (lunarMonthTable[lunIndex][lunMonth - 1] == 1){
				lunMonthDay = 29;
			}else if (lunarMonthTable[lunIndex][lunMonth - 1] == 2){
				lunMonthDay = 30;
			}else if (lunDay == lunMonthDay){
 				if (lunarMonthTable[lunIndex][lunMonth - 1] >= 3
					&& lunLeapMonth == 0){
					lunDay = 1;
					lunLeapMonth = 1;
				}else{
					lunMonth++;
					lunDay = 1;
					lunLeapMonth = 0;
				}
				if (lunarMonthTable[lunIndex][lunMonth - 1] == 1){
					lunMonthDay = 29;
				}else if (lunarMonthTable[lunIndex][lunMonth - 1] == 2)
					lunMonthDay = 30;
				}else if (lunarMonthTable[lunIndex][lunMonth - 1] == 3){
					lunMonthDay = 29;
				}else if (lunarMonthTable[lunIndex][lunMonth - 1] == 4 &&
							lunLeapMonth == 0){
					lunMonthDay = 29;
				}else if (lunarMonthTable[lunIndex][lunMonth - 1] == 4 &&
							lunLeapMonth == 1){
					lunMonthDay = 30;
				}else if (lunarMonthTable[lunIndex][lunMonth - 1] == 5 &&
							lunLeapMonth == 0){
					lunMonthDay = 30;
				}else if (lunarMonthTable[lunIndex][lunMonth - 1] == 5 &&
							lunLeapMonth == 1){
					lunMonthDay = 29;
				}else if (lunarMonthTable[lunIndex][lunMonth - 1] == 6){
					lunMonthDay = 30;
				}else{
					lunDay++;
 				}
			}
 		}


		function getWeekday(year, month, day){
			var weekday = Array("일", "월", "화", "수", "목", "금", "토");
			var date = new Date(year, month - 1, day);

			if (date){
				return weekday[date.getDay()];
			}
		}


		function getPassDay(year, month, day){
			var date = new Date(year, month - 1, day);
			var interval = Math.floor((todayDate - date) / (1000 * 60 * 60 * 24) + 1);
			return interval;
		}

		function getDDay(year, month, day){
			var date = new Date(year, month - 1, day);
			var interval = Math.floor((date - todayDate) / (1000 * 60 * 60 * 24) + 1);
			return interval;
		}

		function getDateSpecificInterval(year, month, day, interval){
			var date = new Date(year, month - 1, parseInt(day, 10) + parseInt(interval, 10) - 1);
			return date;
		}


		var date = new Date(year, month - 1, day);
		//1701년 1월 14일을 기준일로 한다. 1800년 이후의 오류를 방지하기 위해 1799년 12월 31일 이전으로 기준일을 정한다.
		var basicDate = new Date(1701, 0, 14);

		var interval = Math.floor([(date - basicDate) / (1000 * 60 * 60 * 24)] % 60);

		function dayCalcDisplay(type){
			switch (type) {
  			/* 오늘은 몇일째 */
				case 1:
					var startYear = parseInt(document.getElementById("mStartYear").value, 10);
					var startMonth = parseInt(document.getElementById("mStartMonth").value, 10);
					var startDay = parseInt(document.getElementById("mStartDay").value, 10);
					break;

			/* x 일째 되는날 */
				case 2:
					var startYear = parseInt(document.getElementById("mmStartYear").value, 10);
					var startMonth = parseInt(document.getElementById("mmStartMonth").value, 10);
					var startDay = parseInt(document.getElementById("mmStartDay").value, 10);
					break;

			/* D-day */
				case 3:
					var startYear = parseInt(document.getElementById("targetYear").value, 10);
					var startMonth = parseInt(document.getElementById("targetMonth").value, 10);
					var startDay = parseInt(document.getElementById("targetDay").value, 10);
					break;

			/* 양력 음력 변환 */
				case 4:
					var startYear = parseInt(document.getElementById("lsStartYear").value, 10);
					var startMonth = parseInt(document.getElementById("lsStartMonth").value, 10);
					var startDay = parseInt(document.getElementById("lsStartDay").value, 10);
					break;
			}

			if ( !startYear || startYear == 0 ||
					!startMonth || startMonth == 0 ||
					!startDay || startDay == 0 ){
				alert('날짜를 입력해주세요');
				return;
			}
			var solMonthDay = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
			if (startYear % 400 == 0 || ( startYear % 4 == 0 && startYear % 100 != 0 )) {
				solMonthDay[1] += 1;
			}
			
			var startDate = new Date(startYear, startMonth - 1, startDay);
			var today = new Date(todayDate.getFullYear(), todayDate.getMonth(), todayDate.getDate());

			switch (type){
			/* 오늘은 몇일째 */
				case 1:
				if (today < startDate){
					alert("기준일을 오늘보다 이전 날짜로 설정하세요");
					return;
				}
				var interval = getPassDay(startYear, startMonth, startDay);
				document.getElementById("day1").value = interval;
				break;
			/* x 일 되는 날은 */
				case 2:
				var day2 = document.getElementById("day2").value;
				if (day2 <= 0){
					alert("0 보다 큰 수를 입력하세요");
					return;
				}
				var date = getDateSpecificInterval(startYear, startMonth, startDay, day2);
				document.getElementById("resultDay").value =
						String(date.getFullYear()) + "년 " +
						String(date.getMonth() +1 ) + "월 " + String(date.getDate()) + "일";
				break;
			 /* D-Day */
 				case 3:
				var interval = getDDay(startYear, startMonth, startDay);

				if (today > startDate){
					alert("기준일을 오늘 이후 날짜로 설정하세요");
					return;
				}
				document.getElementById("day3").value = interval;
				break;

 			/* 양력/음력 변환 */
				case 4:
				if (document.getElementById('solarLunar').value == 'solar'){
					var leapMonth = document.getElementById('leapMonth').checked;
					var date = lunarCalc(startYear, startMonth, startDay, 2, leapMonth);
				}else{
					var date = lunarCalc(startYear, startMonth, startDay, 1);
 				}
				if (date){
					document.getElementById('solarLunarDay').value =
						date.year + "년 " +(date.leapMonth ? "윤" : "") + date.month + "월 " + date.day + "일";
				}else{
					document.getElementById('solarLunarDay').value = "";
				}
				break;
			}
		}
		
		function memorialDayCheck(solarDate, lunarDate){
			var i;
			var memorial;

			for (i = 0; i < memorialDays.length; i++){
				if (memorialDays[i].month == solarDate.month &&
				memorialDays[i].day == solarDate.day &&
				memorialDays[i].solarLunar == 1){
					return memorialDays[i];
				}
				//윤달의 공휴일 처리에 대한 예외처리
				if ( lunarDate.leapMonth && lunarDate.month == 4 && lunarDate.day == 8 ) {
					return null;
				}
				if ( lunarDate.leapMonth && lunarDate.month == 8 && lunarDate.day > 13 && lunarDate.day < 17) {
					return null;
				}
				if (memorialDays[i].month == lunarDate.month &&
					memorialDays[i].day == lunarDate.day &&
					memorialDays[i].solarLunar == 2 &&
					!memorialDays[i].leapMonth){
					return memorialDays[i];
 				}
			return null;
			}
		}

		function yearmemorialDayCheck(solarDate, lunarDate){
 			var i;
			var yearmemorial;
			for (i = 0; i < yearmemorialDays.length; i++){
				if (yearmemorialDays[i].year == solarDate.year &&
				yearmemorialDays[i].month == solarDate.month &&
				yearmemorialDays[i].day == solarDate.day &&
				yearmemorialDays[i].solarLunar == 1){
					return yearmemorialDays[i];
				}
				if (yearmemorialDays[i].year == lunarDate.year &&
				yearmemorialDays[i].month == lunarDate.month &&
				yearmemorialDays[i].day == lunarDate.day &&
				yearmemorialDays[i].solarLunar == 2 &&
				!yearmemorialDays[i].leapMonth){
					return yearmemorialDays[i];
 				}
				return null;
 			}
		}



/* 이곳에 이전달, 다음달로 넘어가는 함수를 입력한다 */

function setCalendar(year, month)
{

 /* set the day before 설날 */
 if (lunarMonthTable[year - 1 - 1799][11] == 1)
  memorialDays[1].day = 29;
 else if (lunarMonthTable[year - 1 - 1799][11] == 2)
  memorialDays[1].day = 30;


 var date = new Date(year, month - 1, 1);
 var startWeekday = date.getDay();


  /* memorial day */
  var memorial = memorialDayCheck(solarDate, lunarDate);

}


function lunarMonthCheck()
{
 if (document.getElementById('solarLunar').value == "solar")
  document.getElementById('leapMonth').disabled = false;
 else
  document.getElementById('leapMonth').disabled = true;
}


var ayear = todayDate.getFullYear(), amonth = todayDate.getMonth() + 1;


function noAlpha(e)
{
     if (e.keyCode < 48 || e.keyCode > 57)
     e.returnValue = false;
}


  </script>
</b>
</font>
<table width=670 border=0 cellpadding=0 cellspacing=0>
 <tr>
  <td nowrap valign=top><!--------달력 들어갈곳----->
  <table border=0 cellpadding=0 cellspacing=0 width=100%>
   <tr>
    <td>
    <table border=0 cellpadding=0 cellspacing=0 width=100%>
     <tr>
      <td rowspan=2 width=1 nowrap bgcolor=ffffff></td>
      <td width="1%" bgcolor=#FFFFFF></td>
     </tr>
     <tr>
      <td height=1 bgcolor=#FFFFFF></td>
     </tr>
     <tr>
      </td>
      <td width="97%" bgcolor=#C0C0C0 height=32 align=center bordercolorlight="#000000" bordercolordark="#000000"><!-----날짜 넣는 곳--->
      <table border=0 cellpadding=0 cellspacing=0>
       <tr>
        <td nowrap><input TYPE="button" VALUE="◀" onClick="javascript:prevMonth();" class="10"> <!--------년도----------> <select id=yearSelect
         style='font-family:굴림;font-size:12px;color:black' onChange='setCalendar()'>


         <script type=text/javascript>
 for (var i = 1800, selectStr = ""; i <= 2101; i++)
  selectStr += "<option value='" + i + "'>" + i + " 년</option>";
 selectStr += "</select>";
 document.write(selectStr);
</script>


         <!--------년도---------->
         <!--------월---------->


        </select><select id=monthSelect style='font-family:굴림;font-size:12px;color:black' id=monthSelect onChange='setCalendar()'>


         <script type=text/javascript>
 for (var i = 1, selectStr = ""; i <= 12; i++)
  selectStr += "<option value='" + i + "'>" + i + " 월</option>";


 selectStr += "</select>";
 document.write(selectStr);
</script>


         <!--------월---------->
         <input TYPE="button" VALUE="▶" onClick="javascript:nextMonth();" class="10">
        </select></td>
        <td ailgn=right>
        <p align="center">&nbsp;<b><font color=#009900><span id=curenMonth></span></font></b>&nbsp;<input TYPE="button" VALUE="오늘 날짜로"
         onClick="javascript:currentMonth();" class="10">
        </td>
       </tr>
      </table>
      <!-----날짜 넣는 곳---></td>
     </tr>
     <tr>

      <td width="97%" height=1 border=0 bgcolor="#000000" bordercolorlight="#000000" bordercolordark="#000000"></td>
     </tr>
     <tr>

      <td width="97%" bgcolor=ffffff align=center bordercolorlight="#000000" bordercolordark="#000000"><!----달력 넣는곳------>
      <table border=1 cellpadding=0 cellspacing=0 width=100% bordercolor="#E9E9E9">


       <tr>
        <td colspan=7 height=7 nowrap></td>
       </tr>
       <tr>
        <td width=15% align=center><font id=ln6 color=red>일·SUN</font></td>
        <td width=14% align=center><font id=ln6>월·MON</font></td>
        <td width=14% align=center>화·TUE</td>
        <td width=14% align=center><font id=ln6>수·WED</font></td>
        <td width=14% align=center><font id=ln6>목·THU</font></td>
        <td width=14% align=center><font id=ln6>금·FRI</font></td>
        <td width=15% align=center><font id=ln6 color=#0099FF>토·SAT</font></td>
       </tr>
       <tr>
        <td colspan=7 height=7 nowrap></td>
       </tr>
<script type=text/javascript>
 for (i = 0; i < 6; i++)
 {
  document.write("<tr height='65'>");


  for (j = 0; j < 7; j++)
   document.write("<td vAlign='top' cellSpacing='1' id='dayCell" + ( i * 7 + j )+ "'></td>");
  document.write("</tr>");
 }



 if (typeof(rege_0_1) != "undefined" && 1800 <= rege_0_1 && rege_0_1 <= 2101)
 {
  ayear = rege_0_1;
  amonth = 1;
 }


 if (typeof(rege_0_2) != "undefined" && 1 <= rege_0_2 && rege_0_2 <= 12)
  amonth = rege_0_2;
</script>


       <tr>
        <td colspan=7 height=7 nowrap></td>
       </tr>
      </table>
      <!----달력 넣는곳------></td>
     </tr>
    </table>
    </td>
   </tr>
  </table>
  </td>
 </tr>
</table>
</body>
</html>
