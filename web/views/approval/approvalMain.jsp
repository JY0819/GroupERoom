<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>결재메인페이지</title>
<style>
	 /*메인 페이지 표 테이블 스타일*/
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
     /*페이지 버튼 영역*/
     .btnArea {
     	top: 500px;
     	right: 650px;
     	position: absolute;
     }
     /*몇번 페이지인지 출력하는 가운데 버튼*/
     #countBtn {
     	background: navy;
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
</head>
<body>

	<jsp:include page="/views/main/mainPage.jsp"/>

  	 <table>
      <thead>
        <tr>
          <th>번  호</th>
          <th>작 성 자</th>
          <th>부  서</th>
          <th>문 서 번 호</th>
          <th>의  견</th>
          <th>작 성 날 짜</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
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

</body>
</html>