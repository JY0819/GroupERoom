<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<form>
	<table class="table">
		<tr>
			<td colspan="2">
				<label for="file">
					<img id="">
				</label>
				<input type="file" id="file">
			</td>
		</tr>
		<tr>
			<td>사원번호</td>
			<td><input type="text"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text"></td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
				<label for="gender_m">남</label>
				<input type="radio" id="gender_m" name="gender" value="M">
				
				<label for="gender_f">여</label>
				<input type="radio" id="gender_f" name="gender" value="F">
			</td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td><input type="date"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password"></td>
		</tr>
		<tr>
			<td>비밀번호 확인</td>
			<td><input type="password"></td>
		</tr>
		<tr>
			<td>연락처</td>
			<td><input type="tel"></td>
		</tr>
		<tr>
			<td>주소</td>
			<td>
				<textarea rows="5" cols="20"></textarea>
			</td>
		</tr>
		<tr>
			<td>소속</td>
			<td>
				<select>
					<option>소속 선택</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>직책</td>
			<td>
				<select>
					<option>직책 선택</option>
				</select>
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
