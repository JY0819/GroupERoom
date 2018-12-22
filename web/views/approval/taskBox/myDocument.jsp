<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>내문서함</title>
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
     /*작성버튼  */
     .writeBtn{
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
	/*상신버튼  */
	.sendBtn {
	text-align: center;
	background-color: #205181;
	color:white;
	border-radius: 10px;
	width: 100px;
	height: 40px;
	top: 100px;
    left: 250px;
    position: absolute;
    border: 0;
	outline: 0;
	}
	/*삭제버튼  */
	.deleteBtn {
	text-align: center;
	background-color: #F1C40F;
	color:white;
	border-radius: 10px;
	width: 100px;
	height: 40px;
	top: 100px;
    left: 360px;
    position: absolute;
    border: 0;
	outline: 0;
	}
    </style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>

	<jsp:include page="/views/main/mainPage.jsp"/>
  	<a href="writeDocument.jsp"><button class="writeBtn">작성</button></a>
  	<button class="sendBtn">상신</button>
  	<button class="deleteBtn">삭제</button>
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
    <div class="btnArea">
	<button><i class="fas fa-chevron-left"></i></button>
	<input  id="countBtn" type="button" value="1" disabled="disabled">
   <button><i class="fas fa-chevron-right"></i></button>
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