<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>재직증명서</title>
<style>
	body {
		margin-bottom: 150px;
	}
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
	/*결재사인 서명부분 */
	.approvalTd {
		text-align: center;
	}
	/*항목뒤 입력상자*/
	.approvalTd, .content{
		width: 50px;
		border: 1px solid black;
		border-collapse: collapse;
	}
	/*내용부분  */
	.lastContent {
		height: 30em;
		border: 1px solid black;
	}
	/*내용부분  */
	/* .last {
		text-align: center;
		border-left: hidden;
		border-right: hidden;
		border-bottom: hidden;
	} */
	/*저장버튼  */
	.saveBtn {
		position: relative;
		top: 250px;
		text-align: center;
		background-color: #205181;
		color:white;
		border-radius: 10px;
		width: 100px;
		height: 40px;
		top: 1150px;
		left: 490px;
	    position: absolute;
	    font-size: 16px;
	    border: 0;
	    outline: 0;
	}
	/*닫기버튼  */
	.closeBtn {
		position: relative;
		top: 250px;
		text-align: center;
		background-color: #F1C40F;
		color:white;
		border-radius: 10px;
		width: 100px;
		height: 40px;
		top: 1150px;
		left: 650px;
	    position: absolute;
	    font-size: 16px;
	    border: 0;
	    outline: 0;
	}
	.lastContent .contentArea {
		position: absolute;
		border: 1px solid black;
		size: 20;
		width: 99.6%;
		left: 0px;
		top: 457px;
		height: 478px;
	}

</style>
</head>
<body>

	<jsp:include page ="/views/main/mainPage.jsp"/>

	<h1>재직증명서</h1>
	<table>
		<tr>
			<td class="td">번호</td>
			<td class="content"><input type="text" name="noContent"></td>
			<td rowspan="2" class="gap"></td>
			<td class="td" rowspan="3">결<br>재</td>
			<td class="td">1차</td>
			<td class="td">2차</td>
			<td class="td">3차</td>
		</tr>
		<tr>
			<td class="td">첨부파일</td>
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
			<td class="content" colspan="2"><input type="text" name="noContent"></td>
			<td class="td">사원번호</td>
			<td class="employeeNumber" colspan="3"><input type="text" name="noContent"></td> 
		</tr>
		<tr>
			<td class="td">직책</td>
			<td class="content" colspan="2">
				<select>
					<option>사원</option>
					<option>직책</option>
					<option>직책</option>
					<option>직책</option>
				</select>
			</td>
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
			<td class="td">재직기간</td>
			<td><input type="date" name="startDate"><br><input type="date" name="endDate"></td>
		</tr>
		<tr>
			<td class="td">제목</td>
			<td class="content" colspan="2"><input type="text" name="noContent"></td>
			<td class="td">작성일</td>
			<td class="content" colspan="3"><input type="text" name="noContent"></td>
		</tr>
		<tr>
			<td class="lastContent" colspan="7"><textarea class="contentArea"></textarea></td>
		</tr>
	</table>
	<button class="saveBtn">저장</button>
	<button class="closeBtn">닫기</button>
</body>
</html>