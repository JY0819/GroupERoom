<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/views/layout/treeview/board/layout-up.jsp" />
<script>
	var jsonData=treeviewJson.boardJson;
	var nodeName="부서게시판";
</script>
<style>
/*게시판 스타일*/
#boardTitle{
	height:45px;
   font-weight:bold;
   font-size:16px;
    clear:both;

}
section{
	float:left;
	height:200px;
	width:100%;
}
table, td, th,tr{
    
    /*border:1px solid black;*/
    border:1px solid black;
	position:relative;
	/*top에서부터 100px 움직이고 left서부터 200px움직인다.*/
	
	
	
}

tr{
    height:30px;
}

.head{
    background-color:rgb(31,81,129);
    color:white;

}

.list{
    background-color: white;
    color:black;
    
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
/* 게시판 목록끝  */

section>form>button{
	 float:right;
}

#btn{
	text-decoration:none;
}
/*글 내용*/
#content{
	width:600px;
	height:300px;
	border:1px solid black;
	
}
/*글 정보*/
#info{
	margin: right auto;
	
}
#btn{
	text-decoration:none;
	color:black;
}
/*댓글*/
#hide{
	width:100px;
	height:50px;
	border:solid 1px black;
}
#enrollRep{	
	width:560px;
	height:50px;
	
}


#info{
/* 	border: 1px solid white;
 */
	background-color:#205181;
	width:100px;
	color:white;
	text-align:center;
}
#reple{
	border: 1px solid white;
	font-color:white;
}
#rep-info{
	background-color:#205181;
	color:white;
	width:100px;
	text-align:center;
	
}
#table1{
	border: 1px solid white;
	color:white;
}
#table2{
	border: 1px solid white;
	color:white;
}
</style>

<section class="content">
	<div class="content-left">
		<div id="treeview"></div>
	</div>
	<div class="content-right container">

	
	<!-- 게시판 -->
 <section>

<form align="center">
<div id="boardTitle">
<h1>l 자유 게시판</h1>
</div>
<hr>

	
	<div align="center">
	<br>
	<table id="table1" float="right">
		<tr>
			<td id="info">글번호</td><td width="500px"><!-- 글번호불러와 --></td>
			
		</tr>
		<tr>
			<td id="info">조회수</td><td width="500px"><!-- 조회수불러와 --></td>
		</tr>
		<tr>
			<td id="info">작성일<td width="500px"><!-- 작성일러와 --></td>
		</tr>
		<tr>
			<td id="info">작성자</td><td width="500px"><!-- 작성자불러와 --></td>
		</tr>
		<tr>
			<td id="info">제목</td><td width="500px"><!-- 제목불러와 --></td>
		</tr>
		
		
	</table>
	<br>
	<hr>
	<br>
		<br>

		<div id="content"><a>글 내용</a></div></br>
	<table id="table2">
		<tr>
			<td id="info" >첨부파일</td><td width="500px"><!-- 첨부파일 --></td>
		</tr>
	</table>
	
	</br>
	</br>
	
	<table id="reple">
		<tr>
			<td id="rep-info">작성자</td><td width="450px" rowspan="2">댓글내용</td><td id="reple"><button id="btn">댓글삭제</button></td>
		</tr>
		<tr>	
			<td id="rep-info">댓글작성일</td><td id="reple"><button type="submit"><a id="btn" href="#" id="btn">댓글수정</button></td>
		</tr>
		
		
		
	</table>
	<br>
	
 		<input type="textarea" id="enrollRep">&nbsp;<button height="50px" id="btn">댓글등록</button>
 
	</br>
	</br>
	
	<form align="center">
		<button><a href="modifyFree.jsp" id="btn">수정</a></button>
		<button><a href="deleteNotice.jsp" id="btn">삭제</a></button>
		<button><a href="boardFree.jsp" id="btn">목록</a></button>
		<button><a href="replyFree.jsp" id="btn">답글</a></button>
	</form>
	

	</div>
	
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	
	</div>
</section>

<jsp:include page="/views/layout/treeview/board/layout-down.jsp" />

	