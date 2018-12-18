<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/views/main/mainPage.jsp" />
<title>Insert title here</title>
<style>
.title{
	width:400px;
}
.writer{
	width:100px;
}
.content{
	width:400px;
	height:300px;
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
.modify{
	text-decoration:none;
}
/* 게시판 목록끝  */

</style>
</head>
<body>


<form>
<h1 align="center" >공지 게시판</h1>
<hr>
<!-- 게시판목록 -->
 <div id="sideMenu" >

		<h3><a href="boardNotice.jsp" id="menuFont">공지사항</a></h3>
	
    <hr>
    
    <h3><a href="boardTeam.jsp" id="menuFont">부서별게시판</a></h3>
   	
    <hr>
    
    <h3><a href="boardFree.jsp" id="menuFont">자유게시판</a></h3>
   
    <hr>
    
	</div> 
 
	<table align="center">
	
	<tr>
	<th>작성자</th>
	<td><input type="text" class="writer"></td><br/>
	</tr>
	<tr>
	<th>글제목</th>
	<td><input type="text" class="title"></td><br/>
	</tr>
	
	<tr>
	<th>내용</th>
	<td><input type="textarea" class="content"></td><br/>
	</tr>
	
	<tr>
	<th>첨부파일</th>
	<td><input type="file"></td>
	
	</tr>
	<tr >
		<th></th>
		<td align="center">			
			<button type="submit"><a class="modify" href="viewNotice.jsp">수정</a></button>
			<input type="reset" value="취소">
		</td>
	</tr>
	
	</table>
</form>
<script>
	function modify(){
		//내용 db에 수정되고 view페이지로 이동,view에도 해당 내용 보여야함
		
	}
</script>
</body>
</html>