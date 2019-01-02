<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="com.semi.approval.document.vo.Document"%>
<%
	Document document = (Document)request.getAttribute("doc");
%>       
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>WorkplanDocument</title>
<link rel="stylesheet" type="text/css" href="/semi/assets/css/approval/document.css">

</head>
<body>

	<jsp:include page ="/views/main/mainPage.jsp"/>

	<h1>업무계획서</h1>
	<table>
		<tr>
			<td class="td">번호</td>
			<td class="content"><input type="text" name="num" value=<%= document.getManageNo()+1%>></td>
			<td rowspan="2" class="gap"></td>
			<td class="td" rowspan="3">결<br>재</td>
			<td class="td">1차</td>
			<td class="td">2차</td>
			<td class="td">3차</td>
		</tr>
		<tr>
			<td class="td">이미지첨부</td>
			<td class="content"><input type="file" name="fileNoContent"></td>
			<td class="approvalTd" rowspan="2"><input type="image"></td>
			<td class="approvalTd" rowspan="2"><input type="image"></td>
			<td class="approvalTd" rowspan="2"><input type="image"></td>
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
			<td class="td">사원번호</td>
			<td class="employeeNumber" colspan="3"><input type="text" name="empNo" value=<%= document.getManageEmpId() %>></td> 
		</tr>
		<tr>
			<td class="td">제목</td>
			<td class="content" colspan="2"><input type="text" name="noContent"></td>
			<td class="td" rowspan="2">분류</td>
			<td class="content" colspan="3" rowspan="2">
				<select name="documentKind">
					<option>휴가신청서</option>
					<option>업무계획서</option>
					<option>재직증명서</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class="td">작성일</td>
			<td class="content" colspan="2"><input type="text" name="noContent"></td>
		</tr>
		<tr>
			<td class="lastContent" colspan="7"><textarea class="contentArea"></textarea></td>
		</tr>
	</table>
		<button class="saveBtn">저장</button>
		<button class="closeBtn">닫기</button>
</body>
</html>