<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/views/layout/treeview/board/layout-up.jsp" />
<script>
	var jsonData=treeviewJson.boardJson;
	var nodeName="부서게시판";
</script>

<style>
.teamId{
	width:100px;
}
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
/* 게시판 목록끝  */
#modify{
	text-decoration:none;
	color:black;
}
#boardTitle{
	height:45px;
   font-weight:bold;
   font-size:16px;
    clear:both;

}
</style>
<section class="content">
	<div class="content-left">
		<div id="treeview"></div>
	</div>
	<div class="content-right container">



<br>
<div id="boardTitle">
<h1>l 부서게시판</h1>
</div>
<hr>

<div align="center">
	<table float="right">
	<tr>
		<th>부서</th>
		<td>
			<select>
				<option>부서</option>
				<option>마케팅</option>
				<option>회계</option>
				<option>기획</option>

			</select>
		</td>
	</tr>
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
			<button type="submit"><a id="modify" href="viewTeam.jsp">수정</a></button>
			<input type="reset" value="취소">
		</td>
	</tr>
	
	</table>
	<br>
	<br>
	<br>
	<br>
	<br>

</div>

</div>
</section>

<jsp:include page="/views/layout/treeview/board/layout-down.jsp" />


    