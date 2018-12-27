<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.semi.approval.document.vo.Document"%>
<%
	Document document = (Document)request.getAttribute("doc");
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
			<td class="content"><input type="text" name="num" value=<%= document.getManageEmpId()+1%>></td>
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
			<td class="content"><input type="text" id="person1" name="person1">&nbsp;<button>결재자선택</button></td>
		</tr>
		<tr>
			<td class="td">결재자</td>
			<td class="content"><input type="text" id="person2" name="person2">&nbsp;<button>결재자선택</button></td>
		</tr>
		<tr>
			<td class="td">결재자</td>
			<td class="content"><input type="text" id="person3" name="person3">&nbsp;<button>결재자선택</button></td>
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
			<td class="content" colspan="3"><input type="text" name="empNo" value=<%= document.getManageNo() %>></td>
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
	<button class="closeBtn" onclick="back();">닫기</button>
</form>
	<script>
		function back() {
			location.href="../taskBox/choiceDocument.jsp";
		}
	</script>
</body>
</html>