<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
     .btn {
     	top: 500px;
     	right: 650px;
     	position: absolute;
     }
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
     }
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
     }
       
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
    <div class="btn">
	<button><i class="fas fa-chevron-left" style="right: 50px"></i></button>
	<button><input type="button" readonly></button>
   <button><i class="fas fa-chevron-right" style="right: 50px"></i></button>
   </div>
	<jsp:include page="/views/layout/layout-down.jsp"/>
	<script>
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