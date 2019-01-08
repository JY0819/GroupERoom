<%@page import="com.semi.common.vo.DeptEmp"%>
<%@page import="com.semi.admin.user.model.vo.*"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.semi.schedule.model.vo.*"%>
<%
	Employee loginUser=(Employee)request.getSession().getAttribute("loginUser");
	ArrayList<HashMap<String, Object>> list=(ArrayList<HashMap<String, Object>>)request.getAttribute("list");
	ArrayList<HashMap<String, Object>> vacList=(ArrayList<HashMap<String, Object>>)request.getAttribute("vacList");
%>
<%--수정해야할 것들
css 좀 더 보기좋게 수정
팝업되는 각종 div들 function (show/hide) 효율적으로 수정 

 --%>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>-->
<jsp:include page="/views/layout/treeview/schedule/layout-up.jsp" />
<link rel="stylesheet" type="text/css" href="/semi/assets/css/schedule/calendar.css">
<script>
	var jsonData=treeviewJson.calendarJson;
	var nodeName="일정 관리";
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
		if(goMonth>12) {goMonth=12; alert("정상입력 되지 않아 "+goYear+"년 12월로 이동합니다.");}
		else if(goMonth<1){goMonth=1; alert("정상입력 되지 않아 "+goYear+"년 1월로 이동합니다.");}
		
		today=new Date(goYear, goMonth-1, 1);
		buildCalendar(); //
	}
	
	function prevCalendar() {
		today = new Date(today.getFullYear(), today.getMonth() - 1 /*이전달*/, today.getDate());
		buildCalendar(); 
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
		var tblCalendarYM = document.getElementById("calendarTitle");    // 몇년몇월인지 출력할 곳
		tblCalendarYM.innerHTML = today.getFullYear() + "년 " + (today.getMonth()+1) + "월";  // 연월 출력
	
		// 기존 테이블에 뿌려진 줄, 칸 삭제
		while (tblCalendar.rows.length > 0) {
			tblCalendar.deleteRow(tblCalendar.rows.length-1); //현재 있는 열 모두 삭제
		}
		
		var row = null; //주차별 열추가
		row = tblCalendar.insertRow();
		
		var cnt = 0; // 1일이 시작되는 칸을 맞추어 줌
		for (var i=0; i<nMonth.getDay(); i++) {
			cell = row.insertCell();
			cnt = cnt + 1;
		}
 
		for (var i=1; i<=lastDate.getDate(); i++) { //날마다 새로운 td 추가
			var holiDate=new Date(today.getFullYear(), today.getMonth(), i); //공휴일 비교를 위한 일자 얻기
	 		var year=today.getYear()+1900;
			var month=(today.getMonth()+1);
			var day=holiDate.getDate();
			
			/*공휴일 비교용 문자열*/
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
			
			//음력 날짜 구하는 함수 적용
			lunaMonthCal(holis);
			
			cell = row.insertCell();
			cnt=cnt+1;
			cell.innerHTML ='<span style="font-weight:bold;">'+i+'</span>';
			cell.id='calSchedule'+holis; //일정 입력용 Id 부여
			console.log(holis+" cnt : "+(cnt%7));
			
			if (cnt%7 == 0) {
				// 1주일이 7일 > 7일마다 새 열 추가
				row = calendar.insertRow();// 줄 추가
			}
			if(cnt%7 ==1) {
				//일요일 날짜 색 red
				cell.innerHTML='<span class="sunday">'+i+'</span>';
			}
			if(cnt%7 ==0) {
				//토요일 날짜 색 blue
				cell.innerHTML='<span class="saturday">'+i+'</span>';
			}
			
			/*양력 공휴일 적용*/
			for(var j=0;j<holidaySol.length;j++){
				if(holis.toString().substring(4)===holidaySol[j][0].toString()){
					cell.innerHTML='<span class="sunday">'+i+'<br><span>'+
					holidaySol[j][1]+'</span>';
					
					//어린이날 대체휴일일 경우 대체휴일
					if(today.getFullYear()>2014){
						if(holis.toString().substring(4)==holidaySol[2][0]){
							if(cnt%7==1){replaceHolis=1;}
							if(cnt%7==0){replaceHolis=2;}
						}
					}
				} 
			}
			
			/*음력 공휴일 적용*/
			for(var j=0;j<holidayLun.length;j++){
				if(lunar_date.lunHolis.toString().substring(4,8)===holidayLun[j][0].toString()){
					//음력 공휴일 적용
					cell.innerHTML='<span class="sunday">'+i+'<br>'+holidayLun[j][1]+'</span>';
						
					if(today.getFullYear()>2014){
						//대체 휴일이 적용 될 경우 대체휴일
						if(j==0 && cnt%7==1){replaceHolis=3;}
						if(j==1 && cnt%7==1){replaceHolis=4;}
						if(j==2 && cnt%7==1){replaceHolis=5;}
					}
					if(today.getFullYear()>=2014){
						if(j==4 && cnt%7==1){replaceHolis=6;}
						if(j==5 && cnt%7==1){replaceHolis=7;}
						if(j==6 && cnt%7==1){replaceHolis=8;}
					}
				}
				console.log(replaceHolis);
			} 	
			
			if(lunar_date.lunHolis.toString().substring(4,8)==='0103'){replaceLunHolis1=holis;}
			if(lunar_date.lunHolis.toString().substring(4,8)==='0817'){replaceLunHolis2=holis;}
			
			/* 
			if(lunar_date.lunHolis.toString().substring(6,8)==='15'){
				if(lunar_date.lunHolis.toString().substring(4,5)==='0'){
					if(lunar_date.lunMonth){
						cell.innerHTML+='<br><span class="day">윤'+lunar_date.lunHolis.toString().substring(5,6)+'/'+lunar_date.lunHolis.toString().substring(6,8)+'</span>';
					}else{
						cell.innerHTML+='<br><span class="day">'+lunar_date.lunHolis.toString().substring(5,6)+'/'+lunar_date.lunHolis.toString().substring(6,8)+'</span>';
					}
				}else{
					if(lunar_date.lunMonth){
						cell.innerHTML+='<br><span class="day">윤'+lunar_date.lunHolis.toString().substring(4,6)+'/'+lunar_date.lunHolis.toString().substring(6,8)+'</span>';
					}else{
						cell.innerHTML+='<br><span class="day">'+lunar_date.lunHolis.toString().substring(4,6)+'/'+lunar_date.lunHolis.toString().substring(6,8)+'</span>';
					}
				}
			}
			 */
		}
		switch(replaceHolis){
		//어린이날 대체휴일
		case 1:$("#calSchedule"+holis.toString().substring(0,4)+"0506").html('<span class="sunday">6<br>대체휴일</span><p></p>'); replaceHolis=0; break;
		case 2:$("#calSchedule"+holis.toString().substring(0,4)+"0507").html('<span class="sunday">7<br>대체휴일</span><p></p>'); replaceHolis=0;break;
		//설날 대체휴일
		case 3: $("#calSchedule"+replaceLunHolis1).html('<span class="sunday">'+replaceLunHolis1.substring(6, 8)+'<br>대체휴일</span>'); replaceHolis=0;break;
		case 4: $("#calSchedule"+replaceLunHolis1).html('<span class="sunday">'+replaceLunHolis1.substring(6, 8)+'<br>대체휴일</span>'); replaceHolis=0;break;
		case 5: $("#calSchedule"+replaceLunHolis1).html('<span class="sunday">'+replaceLunHolis1.substring(6, 8)+'<br>대체휴일</span>'); replaceHolis=0;break;
		//추석 대체휴일
		case 6: $("#calSchedule"+replaceLunHolis2).html('<span class="sunday">'+replaceLunHolis2.substring(6, 8)+'<br>대체휴일</span>'); replaceHolis=0;break;
		case 7: $("#calSchedule"+replaceLunHolis2).html('<span class="sunday">'+replaceLunHolis2.substring(6, 8)+'<br>대체휴일</span>'); replaceHolis=0;break;
		case 8: $("#calSchedule"+replaceLunHolis2).html('<span class="sunday">'+replaceLunHolis2.substring(6, 8)+'<br>대체휴일</span>'); replaceHolis=0;break;
		default:break;
		}
		
		
		//불러온 일정 삽입
		<%for(int i=0;i<list.size();i++){
			HashMap<String, Object> hmap=list.get(i);
			if((hmap.get("calendarContents")).toString().length()>9){%>
				if(Number(<%=hmap.get("calendarClass")%>)==1 && $("#Myschedule").is(":checked")){
					$("#calSchedule"+<%=hmap.get("calendarId")%>).append("<p name='calendarClass' value='1'><input type='hidden' value='<%=hmap.get("calendarNo")%>'><%=hmap.get("calendarTime")%>"+' '+"<%=hmap.get("calendarContents").toString().substring(0, 9)%>"+"..."+"</p>");
					$("#calSchedule"+<%=hmap.get("calendarId")%>).children("p[value='1']").css("color","#269752");
				}
				
				if(Number(<%=hmap.get("calendarClass")%>)==2 && $("#Teamschedule").is(":checked") ){
					$("#calSchedule"+<%=hmap.get("calendarId")%>).append("<p name='calendarClass' value='2'><input type='hidden' value='<%=hmap.get("calendarNo")%>'><%=hmap.get("calendarTime")%>"+' '+"<%=hmap.get("calendarContents").toString().substring(0, 9)%>"+"..."+"</p>");
					$("#calSchedule"+<%=hmap.get("calendarId")%>).children("p[value='2']").css("color","#3069A8");
				}
				
				if(Number(<%=hmap.get("calendarClass")%>)==3 && $("#Companyschedule").is(":checked")){
					$("#calSchedule"+<%=hmap.get("calendarId")%>).append("<p name='calendarClass' value='3'><input type='hidden' value='<%=hmap.get("calendarNo")%>'><%=hmap.get("calendarTime")%>"+' '+"<%=hmap.get("calendarContents").toString().substring(0, 9)%>"+"..."+"</p>");
					$("#calSchedule"+<%=hmap.get("calendarId")%>).children("p[value='3']").css("color","#C64A4A");
				}
			<%}else{%>
			if(Number(<%=hmap.get("calendarClass")%>)==1 && $("#Myschedule").is(":checked")){
				$("#calSchedule"+<%=hmap.get("calendarId")%>).append("<p name='calendarClass' value='1'><input type='hidden' value='<%=hmap.get("calendarNo")%>'><%=hmap.get("calendarTime")%>"+' '+"<%=hmap.get("calendarContents")%></p>");
				$("#calSchedule"+<%=hmap.get("calendarId")%>).children("p[value='1']").css("color","#269752");
			}
			
			if(Number(<%=hmap.get("calendarClass")%>)==2 && $("#Teamschedule").is(":checked") ){
				$("#calSchedule"+<%=hmap.get("calendarId")%>).append("<p name='calendarClass' value='2'><input type='hidden' value='<%=hmap.get("calendarNo")%>'><%=hmap.get("calendarTime")%>"+' '+"<%=hmap.get("calendarContents")%></p>");
				$("#calSchedule"+<%=hmap.get("calendarId")%>).children("p[value='2']").css("color","#3069A8");
			}
			
			if(Number(<%=hmap.get("calendarClass")%>)==3 && $("#Companyschedule").is(":checked")){
				$("#calSchedule"+<%=hmap.get("calendarId")%>).append("<p name='calendarClass' value='3'><input type='hidden' value='<%=hmap.get("calendarNo")%>'><%=hmap.get("calendarTime")%>"+' '+"<%=hmap.get("calendarContents")%></p>");
				$("#calSchedule"+<%=hmap.get("calendarId")%>).children("p[value='3']").css("color","#C64A4A");
			}
		<%}
		}
		%>
		<%for(int i=0;i<vacList.size();i++){
			HashMap<String, Object> hmap=vacList.get(i);
			%>
			if($("#useVacschedule").is(":checked")){
				
			<%for(int j=0;j<((ArrayList<String>)hmap.get("useDays")).size();j++){%>
					if($("#calSchedule"+<%=((ArrayList<String>)hmap.get("useDays")).get(j)%>).children("span").hasClass("saturday")){
						
					}else if($("#calSchedule"+<%=((ArrayList<String>)hmap.get("useDays")).get(j)%>).children("span").hasClass("sunday")){
						
					}else{						
						$("#calSchedule"+<%=((ArrayList<String>)hmap.get("useDays")).get(j)%>).append("<p name='calendarClass' value='4'><%=hmap.get("empName")%> 휴가</p>");
						$("#calSchedule"+<%=((ArrayList<String>)hmap.get("useDays")).get(j)%>).children("p[value='4']").css("color","#3069A8");
					}
			<%}%>
			
			 <%--
				if($("#calSchedule"+<%=hmap.get("useStart")%>).children("span").hasClass("saturday")){
					
				}else if($("#calSchedule"+<%=hmap.get("useStart")%>).children("span").hasClass("sunday")){
					
				}else{						
					$("#calSchedule"+<%=hmap.get("useStart")%>).append("<p name='calendarClass' value='2'><%=hmap.get("empName")%>휴가</p>");
					$("#calSchedule"+<%=hmap.get("useStart")%>).children("p[value='2']").css("color","#736DCC");
				}
				--%>
			}
			
			
		<%
			}
		%>
		<%-- <%ArrayList<DeptEmp> empList=address.get(loginUser.getDeptId());%> --%>
		
		// 휴가 불러오기 >
		//setLabel();
		view(); //일정 입력 기본정보 불러오는 함수
		if(today.getFullYear()<=1950){
			alert("더이상 음력공휴일이 지원되지 않습니다!");
		}else if(today.getFullYear()>=2051){
			alert("더이상 음력공휴일이 지원되지 않습니다!");
		}
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
	
	
	//음력 몇월 며칠/윤달여부 등 저장하는 함수
	function lunaDate(solDate){
		
		//비교일 Date화
		solDate=new Date(holis.toString().substring(0,4), (holis.toString().substring(4,6)-1), holis.toString().substring(6));
		
		//음력 날짜 비교를 위한 연/월/일 선언
		solYear=solDate.getFullYear();
		solMonth=solDate.getMonth();
		solDay=solDate.getDate();
			
		MonthTable=[31, 0, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
		//2월 일수 넣어주기
		if (((solDate.year%4==0) && (solDate.year%100!=0)) || (solDate.year%400 ==0)) {MonthTable[1] = 29;}
		else {MonthTable[1] = 28;}

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
			
	//음력 각월의 날짜 수 구하기
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
		}else{ //lunMonth가 true일때
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

	// 양력날짜를 음력데이터형식의 날짜로 바꾸는 함수
	function SolarToLunar(solar_date) {
		var i, nDays, tmp, tDays;
		tDays=0;
		nDays=interval; //기준일에서 지난 날짜

		var lunar_date = new lunaDate(); // 반환할 음력 날짜를 선언. 음력 첫날로 초기화
		lunar_date.year = 1951;
		lunar_date.month = 0;
		lunar_date.day = 1;
		lunar_date.lunMonth = false;

		// nDays가 0보다 작아질때 까지 각년도의 총 날짜수를 빼기반복>연도 계산.
		// 현재 연도 계산 > lunaDate에 현재 연도 저장
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

		// nDays가 0보다 작아질 때까지 각 월의 총 날짜수 빼기 반복>월 계산
		// 윤달이면 윤달 true
		// 월 계산 > lunaDate에 현재 월 저장
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
		
		//nDays가 월단위 날짜수 이하로 작아지면 며칠인지 계산
		// lunaDate에 일수 저장
		//lunaDate에 저장된 날짜 불러와서 음력 공휴일 비교용 문자열 저장
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

	//위의 과정들을 하나로 연결되게 합치는 함수
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
<div id="nonClick"></div>
	<div class="content-left">
		<div id="treeview"></div>
		<%if(loginUser!=null){ %>
		<div class="scheduleLeft">
		<div class="list">
			<input type="checkbox" id="Myschedule" name="myschedule" value="1" checked>
			<label for="Myschedule">내 일정</label><br><br>
			<input type="checkbox" id="Teamschedule" name="teamschedule" value="2" checked>
			<label for="Teamschedule"><%=loginUser.getDeptName() %>팀 일정</label><br><br>
			<input type="checkbox" id="Companyschedule" name="companyschedule" value="3" checked>
			<label for="Companyschedule">회사 일정</label><br><br>
			<input type="checkbox" id="useVacschedule" name="useVacschedule" value="4" checked>
			<label for="useVacschedule">휴가</label><br>
		</div>
		<%} %>
	</div>
	</div>
	<div class="content-right container">
	<%if(loginUser!=null){ %>
	<div class="schedule">
		<div id="nonClick1"></div>
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
					<td colspan="5" align="center" id="calendarTitle" style="font-size:30px">yyyy년 m월</td>
					<td onclick="nextCalendar()" id="nextCal"><label style="font-size:30px">></label></td>
				</tr>
				<tr id="day"> 
					<td class="sunday day" align="center" name="day" value="1">일</td>
					<td class="day" name="day" value="2">월</td>
					<td class="day" name="day" value="3">화</td>
					<td class="day" name="day" value="4">수</td>
					<td class="day" name="day" value="5">목</td>
					<td class="day" name="day" value="6">금</td>
					<td class="saturday day" align="center" name="day" value="0">토</td>
				</tr>
			</thead>
			<tbody id="calendarMain"> <%-- 날짜 들어가는 부분 --%>
			</tbody>
		</table>
	</div>
		<div class="popUpSchedule" id="viewSchedule" align="center"> <%-- 일정 보기 div --%>
			<div class="scheduleDay" id="viewScheduleDay"></div> <%--날짜 --%>
			<div id="daySchedule" vertical-align="center" text-align="center"></div> <%--그날의 일정보기 --%>
			<div class="scheduleBtn" id="addBtn">추가</div>
			<div class="scheduleBtn" id="modifyBtn">수정</div>
			<div class="scheduleBtn" id="delBtn">삭제</div>
			<div class="scheduleBtn" id="closeBtn">닫기</div>
		</div>
		<div class="deleteSchedule" id="addSchedule" align="center"><%-- 일정 추가 div --%>
			<div class="scheduleDay" id="addScheduleDay"></div>
			<div class="message" id="addMessage">
				<select name="scheduleClass">
					<option value="1" selected>내 일정</option>
					<option value="2"><%=loginUser.getDeptName() %>팀  일정</option>
 					<%if(loginUser!=null && loginUser.getAdminAuthority().equals("Y")){ %>
					<option value="3">회사 일정</option>
					<%} %> 
				</select>
				<input type="time" name="addScheduleTime" value="09:00"><br>
				<input type="text" size="25" maxlength="200" placeholder="추가할 일정 입력" name="addSchedule">
			</div>
			<div class="scheduleBtn" id="saveAddBtn">추가</div>
			<div class="scheduleBtn" id="closeAddBtn">닫기</div>
		</div>
		<div class="deleteSchedule" id="modSchedule" align="center"> <%-- 일정 수정 div --%>
			<div class="scheduleDay" id="modScheduleDay"></div>
			<div class="message" id="modMessage">
				<select id="modscheduleClass">
					<option value="1">내 일정</option>
					<option value="2"><%=loginUser.getDeptName() %>팀  일정</option>
 					<%if(loginUser!=null && loginUser.getAdminAuthority().equals("Y")){ %>
					<option value="3">회사 일정</option>
 					<%} %>
 				</select>
				<input type="time" name="modScheduleTime"><br>
				<input type="hidden" name="modScheduleNo">
				<input type="text" size="25" maxlength="200" placeholder="수정할 일정 입력" name="modSchedule">
			</div>
			<div class="scheduleBtn" id="saveModBtn">저장</div>
			<div class="scheduleBtn" id="closeModBtn">닫기</div>
		</div>
		<div class="deleteSchedule" id="delSchedule" align="center"> <%-- 일정 삭제 div --%>
			<div class="scheduleDay" id="delScheduleDay"></div>
			<div class="message" id="delMessage"></div>
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
		<div class="confirm" id="delDelConfirm">
			<div class="scheduleMsg" id="delScheduleMsg">일정 삭제가<br> 완료되었습니다.</div>
			<div class="btnDiv">
				<div class="scheduleBtn" id="closeDelConfirm">닫기</div>
			</div>
		</div>
	<div class="bottom">
		<h1> 　</h1>
	</div>
	
	<script language="javascript" type="text/javascript">
		/*팝업창 우선 숨기기*/
		$("#viewSchedule").hide();
		$("#addSchedule").hide();
		$("#modSchedule").hide();
		$("#delSchedule").hide();
		$("#addConfirm").hide();
		$("#modConfirm").hide();
		$("#delDelConfirm").hide();
		$("#nonClick").hide();
		$("#nonClick1").hide();
		/*달력 생성*/
		buildCalendar();
		
		/*팝업창 불러오기*/
		var scheduleDate="";
		var scheduleDateId="";
		var length;
		var calendarNoArray1=new Array();
		var cnt;
		function view(){
		$(function(){
			<%-- 요일 반복일정 추가... 추후--%>
			
			$("#day").children().click(function(){
				console.log($(this).text());
				$("#viewScheduleDay").html((today.getMonth()+1)+"월 "+$(this).text()+"요일 반복일정");
				cnt=$(this).text();
				$("#modifyBtn").css("display","none");
				$("#delBtn").css("display","none");
				$("#viewSchedule").fadeIn(500);
				$("#nonClick").fadeIn(500);
				$("#nonClick1").show();
				/* <div class="scheduleBtn" id="addBtn">추가</div>
				<div class="scheduleBtn" id="modifyBtn">수정</div>
				<div class="scheduleBtn" id="delBtn">삭제</div>
				<div class="scheduleBtn" id="closeBtn">닫기</div> */
			});
			
			$("#calendarMain").children().children().click(function(){
				if($(this).text().length==1){
					scheduleDate=(today.getYear()+1900)+"년 "
					+(today.getMonth()+1)+"월 "+$(this).children("span").html()+"일";
					if((today.getMonth()+1)<10){
						scheduleDateId=(today.getYear()+1900)+'0'+(today.getMonth()+1)+''+$(this).children("span").html();
					}else{
						scheduleDateId=(today.getYear()+1900)+''+(today.getMonth()+1)+''+$(this).children("span").html();
					}
					$("#viewScheduleDay").text(scheduleDate);
					setLabel();
					$("#viewSchedule").fadeIn(500);
					$("#nonClick").fadeIn(500);
					$("#nonClick1").show();
					console.log("날짜클릭!");
				}else if($(this).text().length>1){
					if(isNaN(Number($(this).text().charAt(1)))){
						scheduleDate=(today.getYear()+1900)+"년 "
						+(today.getMonth()+1)+"월 "+$(this).children("span").html().substring(0,1)+"일";
						if((today.getMonth()+1)<10){
							scheduleDateId=(today.getYear()+1900)+'0'+(today.getMonth()+1)+''+$(this).children("span").html().substring(0,1);
						}else{
							scheduleDateId=(today.getYear()+1900)+''+(today.getMonth()+1)+''+$(this).children("span").html().substring(0,1);
						}
					}else{
						scheduleDate=(today.getYear()+1900)+"년 "
						+(today.getMonth()+1)+"월 "+$(this).children("span").html().substring(0,2)+"일";
						if((today.getMonth()+1)<10){
							scheduleDateId=(today.getYear()+1900)+'0'+(today.getMonth()+1)+''+$(this).children("span").html().substring(0,2);
						}else{
							scheduleDateId=(today.getYear()+1900)+''+(today.getMonth()+1)+''+$(this).children("span").html().substring(0,2);
						}
					}
					$("#viewScheduleDay").text(scheduleDate);
					setLabel();
					$("#viewSchedule").fadeIn(500);
					$("#nonClick").fadeIn(500);
					$("#nonClick1").show();
					
				}else{
					console.log("빈칸클릭!1");
				}
			});
		});
		}
		$("#closeBtn").click(function(){
			console.log();
			$("#modifyBtn").css("display","inline-table");
			$("#delBtn").css("display","inline-table");
			$("#viewSchedule").fadeOut(500);
			$("#nonClick").fadeOut(500);
			$("#nonClick1").hide();
		});
		//일정 추가 팝업 열기
		$("#addBtn").click(function(){
			if($("#modifyBtn").is(":visible")){
				$("#addScheduleDay").text(scheduleDate);
			}else{
				$("#addScheduleDay").text((today.getMonth()+1)+"월 "+cnt+"요일 반복일정");
				$("#addScheduleDay").append('<input type="hidden" name="repeat" value="'+cnt+'">');
			}
			$("#addSchedule").fadeIn(250);
		});
		
		//일정 추가 팝업 닫기
		$("#saveAddBtn").click(function(){
			//$("#addSchedule").hide();
			var scheduleClass=$("select[name='scheduleClass']").val();
			var time=$('input[name=addScheduleTime]').val();
			var scheContents=$('input[name=addSchedule]').val();
			var scheDate=$("#addScheduleDay").text();
			var repeat=$("input[name='repeat']").val();
			var yearR=today.getFullYear();
			var monthR=today.getMonth();
			console.log("year: "+yearR+" / month:"+monthR);
			console.log("추가 "+repeat);
			console.log(scheDate);
			$.ajax({
				url:"insertSchedule.sche",
				type:"post",
				data:{scheduleClass:scheduleClass, scheDate:scheDate, time:time, scheContents:scheContents,repeat:repeat,yearR:yearR, monthR:monthR},
				success:function(data){
					console.log(data);
					$("#viewSchedule").hide();
					$("#addSchedule").hide();
					if(Number(data)==0){
						$("#addScheduleMsg").html("일정 추가에<br>실패했습니다.");
					}
					$("#addConfirm").fadeIn(250);
					
				},
				error:function(data){
					console.log("실패");
					$("#viewSchedule").hide();
					$("#addSchedule").hide();
					$("#addScheduleMsg").html("일정 추가에<br>실패했습니다.");
					$("#addConfirm").fadeIn(250);
				},
				complete:function(){
					console.log(scheDate);
					console.log(scheduleClass+'/'+time+'/'+scheContents);
				}
			});
		});
		
		$("#closeAddBtn").click(function(){
			$("#addSchedule").hide();
		});
		$("#closeAddConfirm").click(function(){ //일정 추가 완료 팝업 닫기
			$("#addConfirm").hide();
			window.location.reload();			
		});
		
		//일정 수정 팝업 열기
		$("#modifyBtn").click(function(){
			$("#modScheduleDay").text(scheduleDate);
			if(Number($("input[name='viewCalNo']").val())>0){
				if(<%=loginUser.getAdminAuthority().equals("N")%> && $('input[name=viewCalClass]').val()==3){
					alert("수정 권한이 없습니다.");
				}else{
					$("#modSchedule").fadeIn(250);
				}				
			}else{
				var $scheduleLabelDelMsg=$("#daySchedule").html('선택된 일정이 없습니다'); 
			}
		});
		
		//일정 수정 팝업 닫기
		$("#saveModBtn").click(function(){
			//$("#modSchedule").hide();
			
			console.log($('#modscheduleClass').val());
			console.log(scheduleDateId);
			console.log($('input[name=modScheduleTime]').val());
			console.log($('input[name=modSchedule]').val());
			console.log($('input[name=modScheduleNo]').val());
			var modscheduleClass=$('#modscheduleClass').val();
			var modscheduleTime=$('input[name=modScheduleTime]').val();
			var modschedule=$('input[name=modSchedule]').val();
			var modcalendarNo=$('input[name=modScheduleNo]').val();
			console.log(modscheduleTime);
			$.ajax({
				url:"modDay.sche",
				type:"post",
				data:{scheduleDateId:scheduleDateId,modscheduleClass:modscheduleClass,
					modscheduleTime:modscheduleTime,modschedule:modschedule,modcalendarNo:modcalendarNo},
				success:function(data){
					console.log(data);
					//이 데이터를 완료 div 페이지 메시지에 띄우기!
					$("#viewSchedule").hide();
					$("#modSchedule").hide();
					if(data=="실패"){
						$("#modScheduleMsg").html("일정 수정을<br>실패했습니다.");
					}
					
					$("#modConfirm").fadeIn(250);
				},
				error:function(data){
					console.log("실패");
					$("#viewSchedule").hide();
					$("#modSchedule").hide();
					$("#modScheduleMsg").html("일정 수정을<br>실패했습니다.");
					$("#modConfirm").fadeIn(250);
				},
				complete:function(data){
					console.log("수정 ajax");
				}
			});
			
		});
		$("#closeModBtn").click(function(){
			$("#modSchedule").fadeOut(500);
			$("#nonClick").fadeOut(500);
			$("#nonClick1").hide();
		});
		$("#closeModConfirm").click(function(){
			//새로고침 ajax 추가하기
			$("#modConfirm").hide();
			$("#nonClick").hide();
			$("#nonClick1").hide();
			window.location.reload();
		});
		
		//일정 삭제 팝업 열기
		$("#delBtn").click(function(){
			$("#delScheduleDay").text(scheduleDate);
			if(Number($("input[name='viewCalNo']").val())>0){
				if(<%=loginUser.getAdminAuthority().equals("N")%> && $('input[name=viewCalClass]').val()==3){
					alert("삭제 권한이 없습니다.");
				}else{
					$("#delSchedule").fadeIn(250);
				}
			}else{
				var $scheduleLabelDelMsg=$("#daySchedule").html('선택된 일정이 없습니다'); 
			}
		});
		
		//일정 삭제 팝업 닫기
		$("#closeDelBtn").click(function(){
			$("#delSchedule").hide();
			$("#nonClick").hide();
			$("#nonClick1").hide();
		});
		//일정 삭제버튼 클릭 > 삭제
		$("#deleteDelBtn").click(function(){
			//$("#delSchedule").hide(); 
			console.log("삭제 input[hidden] : "+$("#delMessage").children().eq(0).val());
			var delCalendarNo=$("input[name=delCalNo]").val();
			var delCalendarClass=$("input[name=delCalClass]").val();
			$.ajax({ 
				url:"delDay.sche",
				type:"post",
				data:{delCalendarNo:delCalendarNo, delCalendarClass:delCalendarClass},
				success:function(data){
					console.log(data+"넘어옴");
					//이 데이터를 완료 div 페이지 메시지에 띄우기!
					$("#viewSchedule").hide();
					$("#delSchedule").hide();
					if(data=="실패"){
						$("#delScheduleMsg").html("일정 삭제에<br>실패했습니다.");
					}
					$("#delDelConfirm").fadeIn(250);
				},
				error:function(data){
					console.log("삭제 ajax 전송 실패");
					$("#viewSchedule").hide();
					$("#delSchedule").hide();
					$("#delScheduleMsg").html("일정 삭제에<br>실패했습니다.");
					$("#delDelConfirm").fadeIn(250);
				},
				complete:function(data){
					console.log("삭제 ajax 루트 끝");
				}
			});
		});
		$("#closeDelConfirm").click(function(){ //일정 삭제 완료 팝업
			$("#delDelConfirm").hide();
			$("#nonClick").hide();
			$("#nonClick1").hide();
			window.location.reload();
		});
		
		/*일정 체크박스list 추가 삭제 관련*/
		$("#Myschedule").change(function(){
			var name=(Number)($("#Myschedule").val());
			console.log(name);
			console.log(typeof(name));
			if($("#Myschedule").is(":checked")){
				<%for(int i=0;i<list.size();i++){
					HashMap<String, Object> hmap=list.get(i);
					if((int)hmap.get("calendarClass")==1){
				%>
						if(Number($("#calSchedule"+<%=hmap.get("calendarId")%>+" > p").children("input[type='hidden']").val())==Number(<%=hmap.get("calendarNo")%>)){
	
						}else{
						<%if((hmap.get("calendarContents")).toString().length()>9){%>
							if(Number(<%=hmap.get("calendarClass")%>)==1 && $("#Myschedule").is(":checked")){
								$("#calSchedule"+<%=hmap.get("calendarId")%>).append("<p name='calendarClass' value='1'><input type='hidden' value='<%=hmap.get("calendarNo")%>'><%=hmap.get("calendarTime")%>"+' '+"<%=hmap.get("calendarContents").toString().substring(0, 9)%>"+"..."+"</p>");
								$("#calSchedule"+<%=hmap.get("calendarId")%>).children("p[value='1']").css("color","#2ebe8b");
							}
						<%}else{%>
							if(Number(<%=hmap.get("calendarClass")%>)==1 && $("#Myschedule").is(":checked")){
								$("#calSchedule"+<%=hmap.get("calendarId")%>).append("<p name='calendarClass' value='1'><input type='hidden' value='<%=hmap.get("calendarNo")%>'><%=hmap.get("calendarTime")%>"+' '+"<%=hmap.get("calendarContents")%></p>");
								$("#calSchedule"+<%=hmap.get("calendarId")%>).children("p[value='1']").css("color","#2ebe8b");
							}
					<%}%>
					}
				<%}
				}%>
	        }else{
			<%for(int i=0;i<list.size();i++){
					HashMap<String, Object> hmap=list.get(i);
					if((int)hmap.get("calendarClass")==1){
			%>
						$("#calSchedule"+<%=hmap.get("calendarId")%>+" > p[value='1']").remove();
						console.log(<%=hmap.get("calendarId")%>+" 삭제");
						
			<%	}							
				}%>	
	        }
		});
		
		$("#Teamschedule").change(function(){
			var name=$("#Teamschedule").val();
			if($("#Teamschedule").is(":checked")){
				<%for(int i=0;i<list.size();i++){
					HashMap<String, Object> hmap=list.get(i);
					if((int)hmap.get("calendarClass")==2){
				%>
						if(Number($("#calSchedule"+<%=hmap.get("calendarId")%>+" > p").children("input[type='hidden']").val())==Number(<%=hmap.get("calendarNo")%>)){
					
						}else{
							<%if((hmap.get("calendarContents")).toString().length()>9){%>
							$("#calSchedule"+<%=hmap.get("calendarId")%>).append("<p name='calendarClass' value='2'><input type='hidden' value='<%=hmap.get("calendarNo")%>'><%=hmap.get("calendarTime")%>"+' '+"<%=hmap.get("calendarContents").toString().substring(0, 9)%>"+"..."+"</p>");
							$("#calSchedule"+<%=hmap.get("calendarId")%>).children("p[value='2']").css("color","#736DCC");
							<%}else{%>
							$("#calSchedule"+<%=hmap.get("calendarId")%>).append("<p name='calendarClass' value='2'><input type='hidden' value='<%=hmap.get("calendarNo")%>'><%=hmap.get("calendarTime")%>"+' '+"<%=hmap.get("calendarContents")%></p>");
							$("#calSchedule"+<%=hmap.get("calendarId")%>).children("p[value='2']").css("color","#736DCC");
							<%}%>
						}
			<%	}
				}%>
	        }else{
	    		<%for(int i=0;i<list.size();i++){
	    			HashMap<String, Object> hmap=list.get(i);
	    			if((int)hmap.get("calendarClass")==2){
	    		%>	
	    				$("#calSchedule"+<%=hmap.get("calendarId")%>+" > p[value='2']").remove();
	    		<%
	    			}
	    		}%>
	        }
		});
		
		$("#Companyschedule").change(function(){
			var name=$("#Companyschedule").val();
			console.log(name);
			if($("#Companyschedule").is(":checked")){
				<%for(int i=0;i<list.size();i++){
					HashMap<String, Object> hmap=list.get(i);
					if((int)hmap.get("calendarClass")==3){
				%>
						if(Number($("#calSchedule"+<%=hmap.get("calendarId")%>+" > p").children("input[type='hidden']").val())==Number(<%=hmap.get("calendarNo")%>)){
					
						}else{
							<%if((hmap.get("calendarContents")).toString().length()>9){%>
							$("#calSchedule"+<%=hmap.get("calendarId")%>).append("<p name='calendarClass' value='3'><input type='hidden' value='<%=hmap.get("calendarNo")%>'><%=hmap.get("calendarTime")%>"+' '+"<%=hmap.get("calendarContents").toString().substring(0, 9)%>"+"..."+"</p>");
							$("#calSchedule"+<%=hmap.get("calendarId")%>).children("p[value='3']").css("color","#C64A4A");
							<%}else{%>
							$("#calSchedule"+<%=hmap.get("calendarId")%>).append("<p name='calendarClass' value='3'><input type='hidden' value='<%=hmap.get("calendarNo")%>'><%=hmap.get("calendarTime")%>"+' '+"<%=hmap.get("calendarContents")%></p>");
							$("#calSchedule"+<%=hmap.get("calendarId")%>).children("p[value='3']").css("color","#C64A4A");
							<%}%>
						}
				<%
					}
				}%>
	        }else{
	    		<%for(int i=0;i<list.size();i++){
	    			HashMap<String, Object> hmap=list.get(i);
	    			if((int)hmap.get("calendarClass")==3){
	    		%>
	    				$("#calSchedule"+<%=hmap.get("calendarId")%>+" > p[value='3']").remove();
	    		<%
	    			}
	    		}%>
	        }
		});
		
		 $("#useVacschedule").change(function(){
			var name=$("#useVacschedule").val();
			var empId=<%=loginUser.getEmpid()%>;
			if($("#useVacschedule").is(":checked")){
			<%for(int i=0;i<vacList.size();i++){
				HashMap<String, Object> hmap=vacList.get(i);
				for(int j=0;j<((ArrayList<String>)hmap.get("useDays")).size();j++){%>
					if($("#calSchedule"+<%=((ArrayList<String>)hmap.get("useDays")).get(j)%>).children("span").hasClass("saturday")){
						
					}else if($("#calSchedule"+<%=((ArrayList<String>)hmap.get("useDays")).get(j)%>).children("span").hasClass("sunday")){
						
					}else{						
						$("#calSchedule"+<%=((ArrayList<String>)hmap.get("useDays")).get(j)%>).append("<p name='calendarClass' value='4'><%=hmap.get("empName")%>휴가</p>");
						$("#calSchedule"+<%=((ArrayList<String>)hmap.get("useDays")).get(j)%>).children("p[value='4']").css("color","#736DCC");
						console.log($("#calSchedule"+<%=((ArrayList<String>)hmap.get("useDays")).get(j)%>).children("p[name='calendarClass']").val());
					}
			<%}
			}%>
	        }else{
	    		<%for(int i=0;i<vacList.size();i++){
	    			HashMap<String, Object> hmap=vacList.get(i);
	    			for(int j=0;j<((ArrayList<String>)hmap.get("useDays")).size();j++){
	    		%>
	    				$("#calSchedule"+<%=((ArrayList<String>)hmap.get("useDays")).get(j)%>+" > p[value='4']").remove();	
	    		<%
	    			}
	    		}%>
	        }
		});
		
		 // 선택시 일정 있을 경우 일정 불러오게
		function setLabel(){
			$("#calendarMain").children().children("td").click(function(){
				var $scheduleLabelOne=$("#daySchedule"); 
				$scheduleLabelOne.html(""); 
			});
			$("#calendarMain").children().children().children("p").click(function(){
				var calendarNo=$(this).children("input[type='hidden']").val();
				console.log("val"+$(this).children("input[type='hidden']").val());
				console.log($(this).parent().children("p"));
				if($(this).val()==4){
					
				}else{
				$.ajax({
					url:"/semi/selectDay.sche",
					data:{scheduleDateId:scheduleDateId,calendarNo:calendarNo},
					type:"post",
					success:function(data){
						//선택한 일정 정보 받아옴 
						console.log("성공");
						var $scheduleLabel=$("#daySchedule"); 
						$scheduleLabel.html(""); //기존 라벨 클리어
						/* console.log(data);
						console.log(data.calendarContents);
						console.log(data.scheduleDate); //받아온 데이터 확인 */
					
						//상세보기 div 세팅
						var $labelHidden=$("<input type='hidden' name='viewCalNo'>").val(data.calendarNo);
						var $labelHidden2=$("<input type='hidden' name='viewCalClass'>").val(data.calendarClass);
						var $br=$("<br>");
						
						var $labelTime=$("<label>").html(data.scheduleTime+'&nbsp');
						var $labelContents=$("<label>").html(data.calendarContents);
						
						$scheduleLabel.append($labelHidden);
						$scheduleLabel.append($labelHidden2);
						$scheduleLabel.append($labelTime);
						$scheduleLabel.append($labelContents);
						if(data=="실패"){
							$scheduleLabel.append("일정 상세조회에<br>실패했습니다. <br> 다시 시도해주세요.");
						}
						$("#nonClick").fadeIn(500);
						$("#nonClick1").show();
						//수정 div 세팅
						if(data.calendarClass==1){
							$('#modscheduleClass option:eq(0)').prop("selected", true);
						}
						if(data.calendarClass==2){
							$('#modscheduleClass option:eq(1)').prop("selected", true);
						}
						if(data.calendarClass==3){
							$('#modscheduleClass option:eq(2)').prop("selected", true);
						}
						$('input[name=modScheduleTime]').val(data.scheduleTime);
						$('input[name=modSchedule]').val(data.calendarContents);
						$('input[name=modScheduleNo]').val(data.calendarNo);
						
						//삭제 div 세팅
						var $DelLabel=$("#delMessage"); //삭제 div
						$DelLabel.html('');
						var $DelHidden=$("<input type='hidden' name='delCalNo'>").val(data.calendarNo);
						var $DelHidden2=$("<input type='hidden' name='delCalClass'>").val(data.calendarClass);
						var $DelTime=$("<label>").html(data.scheduleTime+'&nbsp');
						var $DelContents=$("<label>").html(data.calendarContents);
						
						$DelLabel.append($DelHidden);
						$DelLabel.append($DelHidden2);
						$DelLabel.append($DelTime);
						$DelLabel.append($DelContents);
						$DelLabel.append($br);
						$DelLabel.append("일정을 삭제하시겠습니까?");
						
					},
					error:function(data){
						console.log("실패");
					},
					complete:function(data){
						console.log("ajax");
					}
				});
				}
			});
		}
		
		//일정 상세보기 팝업 닫기
		<%--
		$(function(){
			$("#calendarMain").children().children().click(function(){
				var calendarNoArray1=new Array();
				if($(this).children("p").children("input[type='hidden']").length){
					length=$(this).children("p").children("input[type='hidden']").length;
					for(var i=0;i<length;i++){
						console.log(i+" :ajax "+$(this).children("p").children("input[type='hidden']").eq(i).val());
						calendarNoArray1[i]=$(this).children("p").children("input[type='hidden']").eq(i).val();
					}
					console.log(calendarNoArray1);
				}
				console.log(scheduleDateId);
				var calendarNoArray = JSON.stringify(calendarNoArray1);
				$.ajax({
					url:"/semi/selectDay.sche",
					data:{scheduleDateId:scheduleDateId,calendarNoArray:calendarNoArray},
					type:"post",
					success:function(data){
						console.log("성공");
						var $scheduleLabel=$("#daySchedule");
						$scheduleLabel.html('');
						
						for(var key in data){
							var $label=$("<label>");
							var $timeLabel=$("")
						}
					},
					error:function(data){
						console.log("실패");
					},
					complete:function(data){
						console.log("ajax");
					}
				});
			});		
		});
		--%>
	</script>
</div>
<%}else{%>
<%
		request.setAttribute("msg", "잘못된 경로로 접근했습니다.");
		request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
	} %>
</section>
<jsp:include page="/views/layout/treeview/schedule/layout-down.jsp" />