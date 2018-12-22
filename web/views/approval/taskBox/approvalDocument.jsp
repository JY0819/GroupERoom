<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
	/*결재할 문서 표*/
      table {
      
        width: 80%;
        text-align: center;
      	margin-left: auto;
      	margin-right: auto;
      	position: relative;
       	top:200px;
      }
      
      table, th, td {
        border: 1px double rgb(128,181,240);
        
      }
      th{
      background-color: rgb(128,181,240);
      height:30px;
      }
     td{
     	height:40px;
     }
     /*표 밑 버튼 영역*/
     .btnArea {
     	top: 500px;
     	right: 650px;
     	position: absolute;
     }
     /*승인버튼*/
     .success{
       text-align: center;
	   background-color: #205181;
	   color:white;
	   border-radius: 10px;
	   width: 100px;
	   height: 40px;
	   top: 100px;
       left: 140px;
       position: absolute;
       border: 0;
	   outline: 0;
     }
     /*반려버튼*/
     .return{
       text-align: center;
	   background-color: #205181;
	   color:white;
	   border-radius: 10px;
	   width: 100px;
	   height: 40px;
	   top: 100px;
       left: 260px;
       position: absolute;
	   border: 0;
	   outline: 0;
     }
     /*몇번 페이지인지 출력하는 가운데 버튼*/
     #countBtn {
     	background: #205181;
     	color: white;
     }
     /*좌측 화살표 버튼*/
     .fas fa-chevron-left {
     	position: absolute;
     	right: 50px;
     }
     /*우측 화살표 버튼*/
     .fas fa-chevron-right{
     	position: absolute;
     	right: 50px;
     }
       
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결재할 문서 페이지</title>
</head>
<body>
	<jsp:include page ="/views/main/mainPage.jsp"/>
	<button class="success">승인</button>
  	<button class="return">반려</button>
  		
  	 <table>
      <thead>
        <tr>
          <th><input type="checkbox" name="checkAll" id="checkAll" onclick="checkall();"></th>
          <th>번  호</th>
          <th>작 성 자</th>
          <th>부  서</th>
          <th>문 서 번 호</th>
          <th>제       목</th>
          <th>의  견</th>
          <th>작 성 날 짜</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td><input type="checkbox" name="checkRow"></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td><input type="checkbox" name="checkRow"></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td><input type="checkbox" name="checkRow"></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>	
          <td></td>
          
        </tr>
        
      </tbody>
   
    </table>f
    <div class="btnArea">
    <button><i class="fas fa-chevron-left"></i></button>
	<input  id="countBtn" type="button" value="1" disabled="disabled">
   <button><i class="fas fa-chevron-right"></i></button>
   </div>
	<script>
	/*체크박스 조절*/
		function checkall(){
			if($("#checkAll").is(':checked')){
				$("input[name=checkRow]").prop("checked",true);
			}else{
				$("input[name=checkRow]").prop("checked",false);
			}
		}
	</script>
</body>
</html>