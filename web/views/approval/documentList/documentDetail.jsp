<%@page import="com.semi.common.vo.Attachments"%>
<%@page import="com.semi.admin.user.model.vo.Employee"%>
<%@page import="com.semi.approval.document.vo.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.semi.approval.document.vo.Document"%>
<%
	Document document = (Document)request.getAttribute("document");
	Attachments attachments = (Attachments)request.getAttribute("attachments");
	Employee employee = (Employee)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>DetailDocument</title>
<link rel="stylesheet" type="text/css" href="/semi/assets/css/approval/document.css">

</head>
<body>

<jsp:include page="/views/main/mainPage.jsp"/>

	<table class="detailDoc">
		
		<tr>
			<td class="td">분류<input type="hidden" name="va" value="va"></td>
			<td class="content"><input type="text" name="num" value=""></td>
			<td rowspan="2" class="gap"></td>
			<td class="td" rowspan="3">결<br>재</td>
			<td class="td">1차 결재 확인</td>
			<td class="td">2차 결재 확인</td>
			<td class="td">3차 결재 확인</td>
		</tr>
		<tr>
		<!--이미지 태그넣기  -->
			<td class="td">첨부파일</td>
			<td class="content">&nbsp;<input type="image" name="file"></td>
			<td class="approvalTd" rowspan="2"><input type="text" name="approve1"></td>
			<td class="approvalTd" rowspan="2"><input type="text" name="approve2"></td>
			<td class="approvalTd" rowspan="2"><input type="text" name="approve3"></td>
		</tr>
		<tr>
			<td class="td">1차<br>결재자</td>
			<td class="content"><input type="text" id="person1" name="person1"><input type="hidden" id="appr1" name="empNo1" value=""></td>
		</tr>
		<tr>
			<td class="td">2차<br>결재자</td>
			<td class="content"><input type="text" id="person2" name="person2"><input type="hidden" id="appr2"  name="empNo2" value=""></td>
		</tr>
		<tr>
			<td class="td">3차<br>결재자</td>
			<td class="content"><input type="text" id="person3" name="person3"><input type="hidden" id="appr3"  name="empNo3" value=""></td>
		</tr>
		<tr>
			<td class="gap2" colspan="2"></td>
			<td></td>
			<td colspan="4"  class="gap3"></td>
		</tr>
		<tr>
			<td class="td">문서번호</td>
			<td class="content" colspan="2"><input type="text" name="docNum" value=""></td>
			<!--value=document.getManageDocNo()-->
			<td class="td">사원번호</td>
			<td class="content" colspan="3"><input type="text" name="empNum" value=""></td>
			<!--value=document.getManageNo()  --> 
		</tr>
		<tr>
			<td class="td">휴가기간</td>
			<td class="content" colspan="2"><input type="text" name="startDate"><br><input type="text" name="endDate"></td>
			<td class="td">사유</td>
			<td class="content" colspan="7"><input type="text" name="reason"></td>
		</tr>
		<tr>
			<td class="td">제목</td>
			<td class="content" colspan="2"><input type="text" name="title"></td>
			<td class="td">작성일</td>
			<td class="content" colspan="3"><input type="text" name="date"></td>
		</tr>
		
		<tr>
			<td colspan="7" class="td">내용</td>
		</tr> 
		<tr>
			<td class="lastContent" colspan="7"><textarea class="contentArea" name="content"></textarea></td>
		</tr>
		
		
	</table>
	<button class="closedetail" onclick="back();">닫기</button>
	<script>
		  /* function back() {
			location.href = "/semi/selectDocument.sd";
		}  */ 
	</script>
</body>
</html>