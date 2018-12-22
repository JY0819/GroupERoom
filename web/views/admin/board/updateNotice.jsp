<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- admin 만 글 작성 가능 -->
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
			<form method="post" action="">
				<table class="table table-striped" style="text-align: center; border: 1px;">
					<thead>
						<tr>
							<th id="formtitle" colspan="1" style="background-color: #eeeeee; text-align: center;">공지사항 수정</th>
						</tr> 
					</thead>

					<tbody>
						<tr>
							<td>
							<input type="text" class="form-control" placeholder="공지사항 제목을 입력해주세요." maxlength="50">
							</td>
						</tr>
						<tr>
							<td>
							<textarea class="form-control" placeholder="공지사항 내용을 입력해주세요." maxlength="2048" style="height: 330px"></textarea>
							</td>
						</tr>
					</tbody>
					
				</table>
				
				<div class="form-group">
					<label for="inputattach">파일첨부</label>
					<input id="fileInput" filestyle="" type="file" data-class-button="btn btn-default" data-class-input="form-control" data-button-text="" data-icon-name="fa fa-upload" class="form-control" tabindex="-1" style="position: absolute; clip: rect(0px 0px 0px 0px);">
						<div class="bootstrap-filestyle input-group">
						<input type="text" id="userfile" class="form-control" name="userfile" disabled="">
							<span class="group-span-filestyle input-group-btn" tabindex="0">
							<label for="fileInput" class="btn btn-default ">
								<span><i class="fas fa-file-upload"></i></span>
							</label>
						</span>
					</div>
				</div>
	
				<button type="submit" id="updateBtn" class="btn btn-primary">수정</button>
				<button type="button" id="gotoList" class="btn btn-primary">목록으로</button>
			</form>
		</div>

	</div>
	
	<script>
		$(function(){
			$("#fileInput").on('change', function(){  // 값이 변경되면
				if (window.FileReader) {  // modern browser
					var filename = $(this)[0].files[0].name;
				} else {  // old IE
					var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
				}
				// 추출한 파일명 삽입
				$("#userfile").val(filename);
			});
		});
	</script>
	
	
</body>
</html>