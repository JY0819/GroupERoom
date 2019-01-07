<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.semi.board.team.model.vo.*, com.semi.admin.user.model.vo.*"%>
<% 
	Employee loginUser = (Employee)session.getAttribute("loginUser"); 
	ArrayList<Team> list = (ArrayList<Team>)request.getAttribute("list");
	Team t = (Team)request.getAttribute("t");
 %>

<link rel="stylesheet" type="text/css" href="/semi/assets/css/admin/board.css">
<jsp:include page="/views/layout/treeview/board/layout-up.jsp" />

<script>
	
	var jsonData = treeviewJson.boardJson;
	var nodeName = "부서게시판";
</script>

<style>
body {
	height: 780px;
}
#td{
	width: 10px;
}
</style>


<section class="content">
	<div class="content-left">
		<div id="treeview"></div>
	</div>
	
	<div class="content-right container">
		<div id="title">
			<h1 align="left"> | 부서게시판 |</h1>
		</div>
		<hr>
		

	<div class="container">

		<div class="row">
			<form action="<%= request.getContextPath()%>/insert.tm" method="post">				
			<table class="table table-striped" style="text-align: center; border: 1px;">
					<thead>
						<tr>
							<th id="formtitle" colspan="2" style="background-color: #eeeeee; text-align: center;">부서게시판 글 작성</th>
						</tr> 
					</thead>

					<tbody>
					
					<tr>
					<td id="td">부서</td>
						<td><input type="text" name="deptId" class="form-control" value="<%=loginUser.getDeptName() %>" maxlength="30" readOnly>
						</td>
						
					</tr>
					<tr>
					<td>작성자</td>
						<td><input type="text" name="writer" class="form-control" value="<%=loginUser.getEmpName() %>" maxlength="30" readOnly></td>
						
					</tr>
						<tr>
						<td>제목</td>
							<td>
							<input type="text" name="title" class="form-control"placeholder="글 제목을 입력해주세요." maxlength="50">
							</td>
						</tr>
						<tr>
						<td>내용</td>
							<td>
							<textarea class="form-control" name="content" placeholder="내용을 입력해주세요." maxlength="2048" style="height: 330px"></textarea>
							</td>
						</tr>
					</tbody>
					
				</table>
				
				<div class="form-group">
					<label for="inputattach">파일첨부</label>
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
				
				<div class="insertNoticeBtn">
					<button type="submit" id="enrollBtn" class="btn btn-primary">등록</button>
					<button type="button" id="gotoList" class="btn btn-primary">목록으로</button>
				</div>
			</form>
		</div>
	</div>
<br>
<br>
<br>
<br>
<br>
	
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
		
		$(function(){
			$("#gotoList").click(function(){
				location.href="/semi/views/board/team/boardTeam.jsp";
			});
		});
	</script>
	
</section>

<jsp:include page="/views/layout/treeview/board/layout-down.jsp" />