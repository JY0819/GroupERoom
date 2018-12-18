<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
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
     #countBtn {
     	background: navy;
     	color: white;
     }
     .moveBtn{
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
	.garbageBtn {
	text-align: center;
	background-color: #F1C40F;
	color:white;
	border-radius: 10px;
	width: 100px;
	height: 40px;
	top: 100px;
    left: 250px;
    position: absolute;
	}
    </style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<jsp:include page ="/views/main/mainPage.jsp"/>
  	<button class="moveBtn">이동</button>
  	<button class="garbageBtn">삭제</button>
  	 <table>
      <thead>
        <tr>
          <th><input type="checkbox" name="checkAll" id="checkAll" onclick="checkAll();" style="height: 17px; width: 17px;"></th>
          <th>번  호</th>
          <th>작 성 자</th>
          <th>부  서</th>
          <th>문 서 번 호</th>
          <th>의  견</th>
          <th>작 성 날 짜</th>
          <th>처 리 현 황</th>
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
      </tbody>
    </table>
    <div class="btn">
	<button><i class="fas fa-chevron-left" style="right: 50px"></i></button>
	<input  id="countBtn" type="button" value="1" disabled="disabled">
   <button><i class="fas fa-chevron-right" style="right: 50px"></i></button>
   </div>
   <script>
   	function checkAll() {
		if($("#checkAll").is(':checked')) {
			$("input[name=checkTd]").prop("checked", true);
		}else {
			$("input[name=checkTd]").prop("checked", false);
		}
	}
   </script>
	
</body>
</html>