<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/views/main/mainPage.jsp" />
<title>게시판 만들기</title>

<style>

* {
  margin:0; padding:0;
}

body {
  font-size:14px;
  font-family:"맑은 고딕";
}

 #boardTitle {
    color:#000;
   text-decoration:none;
   cursor:pointer;
  }

  #boardTitle:hover {
    color:yellowgreen;
    text-decoration:underline;
  }

#board {
  width:800px;
  margin:30px auto 10px;
  position:relative;
  left:120px;
  top:90px;
}

   #title {
    height:45px;
   font-weight:bold;
   font-size:16px;
  /*   clear:both; */
  position:absolute;
  left:230px;
  top:100px;
  } 

 .list dl dt {
  float:left;
}

.list dl dd {
  float:left;
} 

 .list .num {width:60px;} 
.list .sub {width:410px;} 
.list .name {width:95px;} 
.list .data {width:85px;} 
.list .count {width:60px;} 

 
 .list dt {
  width:150px;
  text-align:center;
  background-color:lightblue;
  border-bottom:2px solid black;
  padding:10px 5px;
  }
 
 .list dd {
  width:150px;
  text-align:center;
  padding:8px 5px;
  border-bottom:1px solid #ccc;
} 

  .list dd.sub {
  text-align:left; padding-left:5px; width:410px;
}
 
 #board .list-bot {
   clear: both;
   text-align:center;
   padding:10px 10px;
} 
/*게시판 메뉴*/
#sideMenu{
	position:absolute;
	left:5px;
	/* float:left; */
	/*width:15%;*/
	background-color:#205181;
	width:200px;
	height:500px;
}
#menuFont{
	align:center;
	font-size:20px;
	text-decoration:none;
	color:white;
}
/*버튼 글씨*/
#textBtn{
	text-decoration: none;
	color:black;
	
}
/*버튼*/
#textBtn{
	text-decoration: none;
	color:black;
	
}
#btnBox{
	/*  position:relative;
	top: 190px;
	left: 70px; 
	align:center;*/ 
	
}
/*버튼*/
#searchBtn{
 	/* position: relative;
	top: 210px;
	right:400px;   */
	margin-left:250px;
	margin-right:auto;
	margin-top:200px;
	align:center;
}
</style>


</head>
<body>

	
<!-- <form  id="board" align="center"> -->
	
	

		<div id="title">
	    <h1>l 공지사항</h1>
		</div>
		<br>
	<hr>
	<br>
	<br>
 <!-- 게시판목록 -->
 <div id="sideMenu" >
<br>
		<h3><a href="boardNotice.jsp" id="menuFont">공지사항</a></h3>
		<br>
    <hr>
    <br>
    <h3><a href="boardTeam.jsp" id="menuFont">부서별게시판</a></h3>
   	<br>
    <hr>
    <br>
    <h3><a href="boardFree.jsp" id="menuFont">자유게시판</a></h3>
    <br>
    <hr>
    
	</div> 
 

<div align="center" id="board">

<div class="list"> 
  <dl>
   <dt class="num">번호</dt>
   <dt class="sub">제목</dt>
   <dt class="name">작성자</dt>
   <dt class="data">작성일</dt>
   <dt class="count">조회수</dt>
  </dl>

  <dl>
   <dd class="num">3</dd>
   <dd class="sub"><a id="boardTitle" href"#">월요일 입니다.</a></dd>
   <dd class="name">관리자</dd>
   <dd class="data">2000-10-10</dd>
   <dd class="count">1</dd>
  </dl>
  
  <dl>
   <dd class="num">2</dd>
   <dd class="sub"><a id="boardTitle" href"#">화요일 입니다.</a></dd>
   <dd class="name">관리자</dd>
   <dd class="data">2000-10-10</dd>
   <dd class="count">1</dd>
  </dl>

  <dl>
   <dd class="num">1</dd>
   <dd class="sub"><a id="boardTitle" href"#">수요일 입니다.</a></dd>
   <dd class="name">관리자</dd>
   <dd class="data">2000-10-10</dd>
   <dd class="count">1</dd>
  </dl>
</div>
</div>

<br>
<br>
<br>
  
	 <div id="searchBtn" align="center">
    	<input type="search">
    	<button type="submit"><a href="searchViewFree.jsp" id="textBtn">검색하기</a></button>
    	<button><a id="textBtn" href="writeFree.jsp" id="textBtn"> 글쓰기 </a></button>
	</div>
	

<!-- ㄴㅇㄹ-->


</body>
</html>


    