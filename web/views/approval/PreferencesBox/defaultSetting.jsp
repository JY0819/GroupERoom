<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/views/layout/treeview/approval/layout-up.jsp" />
<link rel="stylesheet" type="text/css"
	href="/semi/assets/css/approval/taskBox.css">

<script>
	var jsonData = treeviewJson.approvalJson;
	var nodeName = "기본 설정";
</script>


<section class="content">

	<div class="content-left">
		<div id="treeview"></div>
	</div>

	<div class="content-right container">


		<div class="titleArea">
			<h1 class="title">기본설정</h1>
			<hr class="line">

			<table class="settingTable">
				<tr>
					<td><h3>현재 비밀번호</h3></td>
					<td><input type="text" size="30px"
						placeholder="현재 전자결재 비밀번호를 입력하세요."></td>
				</tr>
				<tr>
					<td><h3>새 비밀번호</h3></td>
					<td><input type="text" size="32px"
						placeholder="변경할 전자결재 비밀번호를 입력하세요."></td>
				</tr>
				<tr>
					<td><h3>확인</h3></td>
					<td><input type="text" size="32px"
						placeholder="변경할 전자결재 비밀번호를 입력하세요."></td>
				</tr>
				<tr>
					<td><h3>사용여부</h3></td>
					<td><input type="radio" name="choice"><label>사용함</label>&nbsp;&nbsp;<input
						type="radio" name="choice"><label>사용함</label></td>
				</tr>
				<tr>
					<td colspan="2"><button class="saveBtn">저장</button></td>
				</tr>
			</table>
		</div>
	</div>
</section>
<jsp:include page="/views/layout/treeview/approval/layout-down.jsp" />