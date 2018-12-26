<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<jsp:include page="/views/main/mainPage.jsp" />
<link rel="stylesheet" type="text/css" href="/semi/assets/css/admin/board.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>

<style>
body {
	height: 780px;
}
</style>

<body>
	<div class="container">

		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px;">
				<thead>
					<tr>
						<th colspan="3" style="background-color: #eeeeee; text-align: center;">공지사항 상세보기</th>
					</tr> 
				</thead>
	
				<tbody>
					<tr>
						<td style="width: 20%;">글 제목</td>
<%-- 						<td colspan="3"><%= %></td> --%>
						<td colspan="3"></td>
					</tr>
					
					<tr>
						<td>작성자</td>
						<td colspan="2"></td>
					</tr>
					
					<tr>
						<td>작성일자</td>
						<td colspan="2"></td>
					</tr>
					
					<tr>
						<td>내용</td>
						<td colspan="2" style="min-height: 200px; text-align: left;"></td>
					</tr>
				</tbody>
			</table>
			
			<div class="attachfile">
				<label for="inputattach">첨부된 파일</label>
				<input id="fileInput" type="file" data-class-button="btn btn-default" data-class-input="form-control" data-button-text="" data-icon-name="fa fa-upload" class="form-control" tabindex="-1" style="position: absolute; clip: rect(0px 0px 0px 0px);">
					<div class="bootstrap-filestyle input-group">
					<input type="text" id="userfile" class="form-control" name="userfile" disabled="">
						<span class="group-span-filestyle input-group-btn" tabindex="0">
						<label for="fileInput" class="btn btn-default ">
							<span><i class="fas fa-file-upload"></i></span>
						</label>
					</span>
				</div>
			</div>
			
			<div class="detailNoticeBtn">
				<button id="gotoList" class="btn btn-primary">목록으로</button>
				<button id="enrollBtn" class="btn btn-primary">수정</button>
				<button id="deleteBtn" class="btn btn-primary">삭제</button>
			</div>
			
		</div>
	</div>

	
	
	
</body>
</html>