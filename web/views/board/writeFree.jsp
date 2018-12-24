<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/views/layout/treeview/board/layout-up.jsp" />
<script>
	var jsonData=treeviewJson.boardJson;
	var nodeName="자유게시판";
</script>

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
#btn{
color:black;
	text-decoration:none;
}
/* 게시판 목록끝  */

</style>


<section class="content">
	<div class="content-left">
		<div id="treeview"></div>
	</div>
	<div class="content-right container">

	


<form>
<br>
<h1 align="center" >l 자유 게시판</h1>
<hr>

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
	<tr><td></td></tr>
	<tr><td></td></tr>
	<tr><td></td></tr>
	<tr><td></td></tr>
	<tr><td></td></tr>
	<tr><td></td></tr>
	<tr >
		<th></th>
		<td align="center">			
			<button type="submit"><a id="btn" href="viewFree.jsp">등록</a></button>
			<input type="reset" value="취소">
		</td>
	</tr>
	
	</table>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
</form>


	
</div>
</section>

<jsp:include page="/views/layout/treeview/board/layout-down.jsp" />

