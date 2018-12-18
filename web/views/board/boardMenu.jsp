<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/*게시판목록바*/
.leftmenu{
    float: left;
    width:15%;
    background-color: gray;
    width:200px;
    height:500px;
    
}
</style>
</head>
<body>
<!-- 게시판목록 -->
<div class="leftmenu">
    <h3><a href="boardNotice.jsp">공지사항</a></h3>
    <hr>
    <h3><a href="boardTeam.jsp">부서별게시판</a></h3>
    <hr>
    <h3><a href="boardFree.jsp">자유게시판</a></h3>
    <hr>
</div>
</body>
</html>