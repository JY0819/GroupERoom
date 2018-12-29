<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.semi.board.Free.model.vo.*, com.semi.admin.user.model.vo.*"%>
	
<%
	Free f = (Free)request.getAttribute("f"); 
	Employee loginUser = (Employee)session.getAttribute("loginUser");
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
			<table class="table table-striped"  border: 1px;">
				<thead>
					<tr>
						<th colspan="3" style="background-color: #eeeeee; text-align: center;">자유게시판 상세보기</th>
					</tr> 
				</thead>
	<form action="", method="post" id="viewTable">
				<tbody>
				<tr>
				  
						<td>글번호</td>
						<td readonly><input type="hidden" id="bno" value="<%=f.getBno() %>" name="bno" ><%=f.getBno() %></td>
					</tr>
					<tr>
						<td>조회수</td>
						<td readonly><%=f.getbClicks() %></td>
					</tr>
					
					
					<tr>
						<td>작성자</td>
						<td readonly><%=f.getWriterId() %></td>
					</tr>
					
					<tr>
						<td>작성일자</td>
						<td readonly><%=f.getbDate() %></td>
					</tr>
					<tr>
						<td style="width: 20%;">글 제목</td>

						<td readonly><%=f.getbTitle() %></td>
					</tr>
					<tr>
						<td>내용</td>
						<td style="min-height: 200px; text-align: left; readonly"><%=f.getbContent() %></td>
					</tr>
				</tbody>
			</table>
			</form>
			
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
				<br>
				
			<div class="repleArea">
			<div class="replyWriterArea">
			<table class="table table-striped" style="text-align: center; border: 1px;">
			<tr>
				<td td style="width: 20%;">댓글</td>
				<td colspan="3"></td>			
			</tr>
			<tr>
						 <td style="width: 20%;">댓글작성
						</td> 
						<td width="800px">
						<input type="text" class="form-control" id="replyContent" placeholder="댓글을 작성해주세요">
						</td>
						<td>
						<button id="addReply" class="btn btn-primary" >댓글등록</button>
						
						</td>
						
					</tr>
			</table>
			
			<div id="replySelectArea">
			<table id="replySelectTable" border="1" align="center"></table>
		</div>
		
				</div>	
			</div>
			
			<br>
			<div class="detailNoticeBtn">
				<button id="gotoList" class="btn btn-primary">목록으로</button>
				<button id="editBtn" class="btn btn-primary" onclick="location.href='<%=request.getContextPath() %>/selectFree.fr?num=<%=f.getBno()%>'">수정</button>
				<button id="deleteBtn" class="btn btn-primary">삭제</button>
			</div>
			
		
	</div>
	
	</div>
</section>

	<script>
	$(function(){
		$("#gotoList").click(function(){
			location.href="/semi/selectList.fr";
		});
	});
	
	
	$(function(){
		$("#deleteBtn").click(function(){
			
			alert("정말로 삭제하시겠습니까?");
			
		$("#viewTable").attr("action", "<%=request.getContextPath()%>/deleteFree.fr");
		$("#viewTable").submit();	
			
		});
	});
	
	$(function(){
		$("#addReply").click(function(){
			
			var writer = <%= loginUser.getEmpid() %>; 
			var bno = <%= f.getBno() %>;
			var content = $("#replyContent").val(); 
			
		 	console.log(writer) 
			console.log(bno)
			console.log(content)
			
			$.ajax({
				url:"/semi/insertReply.fr",
				data:{ writer:writer, content:content, bno:bno},
				type:"post",
				success:function(data){
					console.log(data);
					
					var $replySelectTable = $("#replySelectTable");
					$replySelectTable.html('');
					
					for(var key in data){
						var $tr = $("<tr>");
						var $writerTd = $("<td>").text(data[key].writerId).css("width","100px");
						var $contentTd = $("<td>").text(data[key].bContent).css("width","400px");
						var $dateTd = $("<td>").text(data[key].bDate).css("width", "200px");
						
						$tr.append($writerTd);
						$tr.append($contentTd);
						$tr.append($dateTd);
						$replySelectTable.append($tr);
					}
					
					
				},
				error:function(){
					console.log("실패");
				}
			});
		});
	});
</script>
<jsp:include page="/views/layout/treeview/board/layout-down.jsp" />
	
