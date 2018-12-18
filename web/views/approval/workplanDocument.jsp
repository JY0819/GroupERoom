<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>WorkplanDocument</title>
<style>
	/*표상단 제목*/
	h1{
		text-align: center;
	}
	/*표 선, 표 사이즈*/
	table{
		border: 1px solid black;
		border-collapse: collapse;
		width: 85%;
		height: 100%;
		margin-left: auto;
		margin-right: auto;
	}

	/*입력상자 앞에 항목부분*/
	.td{
		height: 50px;
		width: 40px;
		text-align: center;
		border: 1px solid black;
		border-collapse: collapse;
		background-color: lightgray;
	}
	/*번호td와 결재td 사이 공백 td  */
	.gap {
		height: 30px;
		width: 80px;
		border: 1px solid black;
		border-top: hidden;
		border-bottom: hidden;
	}
	.gap2{
		height: 30px;
		border-left: hidden;
	}
	.gap3{
		border-right: hidden;
	}
	.approvalTd {
		text-align: center;
	}
	/*항목뒤 입력상자*/
	.approvalTd, .content{
		width: 50px;
		border: 1px solid black;
		border-collapse: collapse;
	}
	.lastContent {
		height: 30em;
		border: 1px solid black;
	}
	.last {
		text-align: center;
		border-left: hidden;
		border-right: hidden;
		border-bottom: hidden;
	}

</style>
</head>
<body>
	<jsp:include page ="/views/main/mainPage.jsp"/>
	<h1>업무계획서</h1>
	<table>
		<tr>
			<td class="td">번호</td>
			<td class="content"><input type="text" name="noContent"></td>
			<td rowspan="2" class="gap"></td>
			<td class="td" rowspan="2">결<br>재</td>
			<td class="td">1차</td>
			<td class="td">2차</td>
			<td class="td">3차</td>
		</tr>
		<tr>
			<td class="td">첨부파일</td>
			<td class="content"><input type="file" name="fileNoContent"></td>
			<td class="approvalTd"><input type="image"></td>
			<td class="approvalTd"><input type="image"></td>
			<td class="approvalTd"><input type="image"></td>
		</tr>
		<tr>
			<td class="gap2" colspan="2"></td>
			<td></td>
			<td colspan="4"  class="gap3"></td>
		</tr>
		<tr>
			<td class="td">문서번호</td>
			<td class="content" colspan="2"><input type="text" name="noContent"></td>
			<td class="td">사원번호</td>
			<td class="employeeNumber" colspan="3"><input type="text" name="noContent"></td> 
		</tr>
		<tr>
			<td class="td">업무계획</td>
			<td class="content" colspan="2"><input type="text" name="noContent"></td>
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
			<td class="content" colspan="2"><input type="text" name="noContent"></td>
			<td class="td">작성일</td>
			<td class="content" colspan="3"><input type="text" name="noContent"></td>
		</tr>
		<tr>
			<td class="lastContent" colspan="7"></td>
		</tr>
		<tr>
			<td class="last" colspan="7"><h2>GroupERoom</h2></td>
		</tr>
	</table>
</body>
</html>