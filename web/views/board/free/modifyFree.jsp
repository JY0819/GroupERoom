<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.semi.board.Free.model.vo.*, com.semi.admin.user.model.vo.*"%>
<%
	
	Free f = (Free)request.getAttribute("f"); 
	Employee loginUser = (Employee)session.getAttribute("loginUser");
	Attachment at = (Attachment)request.getAttribute("at");
%>

<link rel="stylesheet" type="text/css" href="/semi/assets/css/admin/board.css">
<jsp:include page="/views/layout/treeview/board/layout-up.jsp" />

<script>
	
	var jsonData = treeviewJson.boardJson;
	var nodeName = "자유게시판";
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
			<h1 align="left"> | 자유게시판 |</h1>
		</div>
		<hr>
		

	<div class="container">

		<div class="row">
						<form action="<%= request.getContextPath()%>/updateFree.fr" method="post" encType="multipart/form-data">
			
				<table class="table table-striped" style="text-align: center; border: 1px;">
					<thead>
						<tr>
							<th id="formtitle" colspan="2" style="background-color: #eeeeee; text-align: center;">자유게시판 글 수정</th>
						</tr> 
					</thead>
					<tbody>
					<tr>
						<td>작성자</td>
						<td>
						<input type="hidden" id="bno" value="<%=f.getBno() %>" name="bno" >
						
						<input type="text" class="form-control" value="<%=loginUser.getEmpName() %>" maxlength="30" readOnly>
						
						</td>
						 
					</tr>
						<tr>
						<td>제목</td>
							<td>
							
							<input type="text" name ="title"class="form-control" value="<%=f.getbTitle() %>" maxlength="50">
							</td>						
						</tr>
						<tr>
							<td>내용</td>
<td>
<textarea name="content" class="form-control"  maxlength="2048" style="height: 330px"><%=f.getbContent() %></textarea>							</td>						</tr>
					</tbody>
					
				</table>
				<input type="hidden" id="inputFile" class="form-control" name="originAno"  value="<%=at.getAno()%>">
				
				<div class="form-group">
					<label for="inputattach">기존파일</label>
					<br>
					<%=at.getOriginName()%>


						<div class="bootstrap-filestyle input-group">
						
							<label for="inputattach">파일첨부</label>
							
						 <input id="fileInput" name="fileInput" type="file" data-class-button="btn btn-default" data-class-input="form-control" data-button-text="" data-icon-name="fa fa-upload" class="form-control" tabindex="-1" style="position: absolute; clip: rect(0px 0px 0px 0px);">
												<input type="hidden" class="form-control" name="userFile" value="<%=at.getOriginName()%>"disabled="" >
					
					<input type="text" id="userfile" class="form-control" name="newFile" disabled="" >
							
							<span class="group-span-filestyle input-group-btn" tabindex="0">
							<label for="fileInput" class="btn btn-default ">
								<span><i class="fas fa-file-upload"></i></span>
							</label>
						</span>
					</div>
				</div>
				
				<div class="insertNoticeBtn">
					<button id="enrollBtn" class="btn btn-primary">수정</button>
					<button type="button" id="gotoList" class="btn btn-primary">목록으로</button>
				</div>
			</form>
			
			
		</div>
		<div>
				<h1></h1>
				<br>
				<h1></h1>
			</div>
	</div>
	
	<script>
		$(function(){
			$("#fileInput").on('change', function(){  // 값이 변경되면
				console.log("dd");
				if (window.FileReader) {  // modern browser
					var filename = $(this)[0].files[0].name;
				} else {  // old IE
					var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
				}
				// 추출한 파일명 삽입
				$("#userfile").val(filename);
				console.log($("input[name='originAno']").val());
			});
		});
		
		$(function(){
			$("#gotoList").click(function(){
				location.href="/semi/selectList.fr";
			});
		});
		
		<%-- $(function(){
			$("#enrollBtn").click(function(){
				
				$("#editTable").attr("action", "<%=request.getContextPath()%>/updateFree.fr");
				$("#editTable").attr("encType", "multpart/form-data");
				$("#editTable").submit();
				
			}); 
			
		});--%>
			
		
	</script>
	
</section>

<jsp:include page="/views/layout/treeview/board/layout-down.jsp" />