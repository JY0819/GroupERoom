<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<form>
	<table class="table">
		<tr>
			<td>부서코드</td>
			<td><input type="text"></td>
		</tr>
		<tr>
			<td>부서명</td>
			<td><input type="text"></td>
		</tr>
		<tr>
			<td>활성화여부</td>
			<td>
				<label for="active">활성화</label>
				<input type="checkbox" id="active" value="" >
			</td>
		</tr>
		<tr>
			<td>비고</td>
			<td>
				<textarea rows="5" cols="20"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" class="btn btn-default" id="saveBtn" value="저장하기">
				<input type="submit" class="btn btn-primary" id="updateBtn" value="수정">
				<input type="submit" class="btn btn-danger"  id="deleteBtn" value="삭제">
			</td>
		</tr>
	</table>
</form>
