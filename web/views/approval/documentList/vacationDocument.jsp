<%@page import="com.semi.admin.user.model.vo.Employee"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.semi.approval.document.vo.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.semi.approval.document.vo.Document"%>
<%
	Document document = (Document)request.getAttribute("doc");
	HashMap<Integer, ArrayList<SumEmpInfo>> hmap = (HashMap<Integer, ArrayList<SumEmpInfo>>)request.getAttribute("map");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>VacationDocument</title>
<link rel="stylesheet" type="text/css" href="/semi/assets/css/approval/document.css">

</head>
<body>

<jsp:include page="/views/main/mainPage.jsp"/>
<form action="<%= request.getContextPath() %>/insertDocument.id" method="post" encType="multipart/form-data">
<h1>휴가신청서</h1>
	<table>
		<tr>
			<td class="td">번호<input type="hidden" name="va" value="va"></td>
			<td class="content"><input type="text" name="num" value=<%= document.getManageNo()+1%>></td>
			<td rowspan="2" class="gap"></td>
			<td class="td" rowspan="3">결<br>재</td>
			<td class="td">1차</td>
			<td class="td">2차</td>
			<td class="td">3차</td>
		</tr>
		<tr>
			<td class="td">첨부파일</td>
			<td class="content">&nbsp;<input type="file" name="file"></td>
			<td class="approvalTd" rowspan="2"><input type="image" name="img1"></td>
			<td class="approvalTd" rowspan="2"><input type="image" name="img2"></td>
			<td class="approvalTd" rowspan="2"><input type="image" name="img3"></td>
		</tr>
		<tr>
			<td class="td">결재자</td>
			<td class="content"><input type="text" id="person1" name="person1">&nbsp;<a href="#open"><button type="button">결재자선택</button></a></td>
		</tr>
    	<div class="white_content" id="open">
        	<div>
        		<dl><h4>주소록</h4> 
        			<dt id="dt"><i class="fas fa-bookmark"></i>즐겨찾기</dt>
        				<dd id="d1"><i class="fas fa-star"></i>홍길동(팀장)</dd>
        				<dd id="d2"><i class="fas fa-star"></i>고길동(사원)</dd>
        			<%-- <% for(int i=0; i<hmap.size(); i++) { %>
        			<dt><i class="fas fa-user-edit"><%= hmap.get(i).get(i).getDeptName() %></i></dt>
        				<% for(int j=0; j<hmap.get(i).size(); j++) { %>
        				<dd id="d3"><i class="far fa-star"></i><%= hmap.get(i).get(j).getEmpNo() %><br><%= hmap.get(i).get(j).getEmpName() %></dd>
        					<% } %>
        				<% } %> --%>
        			<!-- <dt><i class="fab fa-bandcamp"></i>마케팅팀</dt>
        				<dd id="d5"><i class="far fa-star"></i>고길동(사원)</dd>
        				<dd id="d6"><i class="far fa-star"></i>고길동(사원)</dd>
        			<dt><i class="fab fa-bandcamp"></i>개발팀</dt>
        				<dd id="d7"><i class="far fa-star"></i>고길동(사원)</dd>
        				<dd id="d8"><i class="far fa-star"></i>고길동(사원)</dd>
        			<dt><i class="fab fa-bandcamp"></i>디자인팀</dt> -->        			
        		</dl>
            	<a class="close" href="#"><button type="button" class="saveBtn2">저장</button></a><a class="close" href="#"><button type="button" class="closeBtn2">닫기</button></a>
        	</div>
    	</div>
		<tr>
			<td class="td">결재자</td>
			<td class="content"><input type="text" id="person2" name="person2">&nbsp;<button type="button">결재자선택</button></td>
		</tr>
		<tr>
			<td class="td">결재자</td>
			<td class="content"><input type="text" id="person3" name="person3">&nbsp;<button type="button">결재자선택</button></td>
		</tr>
		<tr>
			<td class="gap2" colspan="2"></td>
			<td></td>
			<td colspan="4"  class="gap3"></td>
		</tr>
		<tr>
			<td class="td">문서번호</td>
			<td class="content" colspan="2"><input type="text" name="docNum" value=<%= document.getManageDocNo()+1%>></td>
			<!--value=document.getManageDocNo()-->
			<td class="td">사원번호</td>
			<td class="content" colspan="3"><input type="text" name="empNo" value=<%= document.getManageEmpId() %>></td>
			<!--value=document.getManageNo()  --> 
		</tr>
		<tr>
			<td class="td">휴가기간</td>
			<td class="content" colspan="2"><input type="datetime-local" name="startDate"><br><input type="datetime-local" name="endDate"></td>
			<td class="td">분류</td>
			<td class="content" colspan="3">
				<select name="documentKind">
					<option>휴가신청서</option>
					<option>업무계획서</option>
					<option>재직증명서</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class="td">제목</td>
			<td class="content" colspan="2"><input type="text" name="title"></td>
			<td class="td">작성일</td>
			<td class="content" colspan="3"><input type="text" name="date"></td>
		</tr>
		<tr>
			<td class="td">사유</td>
			<td class="content" colspan="7"><input type="text" name="reason"></td>
		</tr> 
		<tr>
			<td class="lastContent" colspan="7"><textarea class="contentArea" name="content"></textarea></td>
		</tr>
	</table>
	<button class="saveBtn" type="submit" style="top: 900px">저장</button> 
	<button class="closeBtn" type="reset" style="top: 900px" onclick="back();">닫기</button>
</form>
	<script>
	function popupOpen(){
		var popUrl = "test.html";	//팝업창에 출력될 페이지 URL
		var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption);
		}
		function back() {
			location.href="views/approval/taskBox/choiceDocument.jsp";
		}
		function click() {
			console.log("클릭함수 실행");
			$("#test1").bind('mouseenter', function() {
				$(this).css({"background":"black", "color":"white"});
			}).bind('mouseleave', function() {
				$(this).css({"background":"white", "color":"black"});
			});
			$("#dt dd").each(function(index, item) {
				console.log($("this").val());
			});
		}
	</script>
</body>
</html>