<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결제된 문서</title>
<style>
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
     .btnArea {
     	top: 500px;
     	right: 650px;
     	position: absolute;
     }
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
     .delete{
     text-align: center;
	   background-color: #F1C40F;
	   color:white;
	   border-radius: 10px;
	   width: 100px;
	   height: 40px;
	   top: 100px;
    left: 140px;
    position: absolute;
     }
     
       
</style>
</head>
<body>
	<jsp:include page ="/views/main/mainPage.jsp"/>
	
	<button class="delete">삭제</button>
	
  	 <table>
      <thead>
        <tr>
          <th><input type="checkbox" name="checkAll" id="checkAll" onclick="checkAll();" style="height: 17px; width: 17px;"></th>
          <th>번  호</th>
          <th>작 성 자</th>
          <th>문 서 번 호</th>
          <th>결 과</th>
          <th>의 견</th>
          <th>작 성 날 짜</th>
          <th>처 리 날 짜</th>
         
        </tr>
      </thead>
      <tbody>
        <tr>
          <td><input type="checkbox" name="checkTd" style="height: 17px; width: 17px;"></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          
        </tr>
        <tr>
          <td><input type="checkbox" name="checkTd" style="height: 17px; width: 17px;"></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          
        </tr>
        <tr>
          <td><input type="checkbox" name="checkTd" style="height: 17px; width: 17px;"></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          
          
        </tr>
        <script>
   		function checkAll() {
		if($("#checkAll").is(':checked')) {
			$("input[name=checkTd]").prop("checked", true);
		}else {
			$("input[name=checkTd]").prop("checked", false);
		}
		}
   		</script>
        
      </tbody>
   
    </table>
    <div class="btnArea">
	<button><i class="fas fa-chevron-left"></i></button>
	<input  id="countBtn" type="button" value="1" disabled="disabled">
   <button><i class="fas fa-chevron-right"></i></button>
   </div>
</body>
</html>