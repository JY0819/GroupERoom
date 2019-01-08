<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.semi.board.team.model.vo.*, com.semi.admin.user.model.vo.*"%>
<%
	Team t = (Team)request.getAttribute("t"); 
	Employee loginUser = (Employee)session.getAttribute("loginUser");
	ArrayList<Team> reply = (ArrayList<Team>)request.getAttribute("reply");
	Attachment at = (Attachment)request.getAttribute("at");

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
			<table class="table table-striped" style="text-align: center; border: 1px;">
				<thead>
					<tr>
						<th colspan="3" style="background-color: #eeeeee; text-align: center;">부서게시판 상세보기</th>
					</tr> 
				</thead>
	<form action="", method="post" id="viewTable">
				<tbody text-align="left">
					 <tr>				  
						<td>부서</td>
						<td><input type="hidden" name="deptId" class="form-control" value="<%=loginUser.getDeptName() %>" maxlength="30" readOnly><%=loginUser.getDeptName() %></td>
					</tr> 
					<tr>	
				  
						<td>글번호</td>
						<td readonly><input type="hidden" id="bno" value="<%=t.getBno() %>" name="bno" ><%=t.getBno() %></td>
					</tr>
					<tr>
						<td>조회수</td>
						<td readonly><%=t.getbClicks() %></td>
					</tr>
					
					
					<tr>
						<td>작성자</td>
						<td readonly><%=t.getWriterId() %></td>
					</tr>
					
					<tr>
						<td>작성일자</td>
						<td readonly><%=t.getbDate() %></td>
					</tr>
					<tr>
						<td style="width: 20%;">글 제목</td>

						<td readonly><%=t.getbTitle() %></td>
					</tr>
					<tr>
						<td>내용</td>					
						<td style="min-height: 200px; /* text-align: left; */ readonly"><%=t.getbContent() %></td>
					</tr>
				</tbody>
			</table>
			</form>
			
			<div class="attachfile">
				<label for="inputattach">첨부된 파일</label>
				<input id="fileInput" type="file" data-class-button="btn btn-default" data-class-input="form-control" data-button-text="" data-icon-name="fa fa-upload" class="form-control" tabindex="-1" style="position: absolute; clip: rect(0px 0px 0px 0px);">
					<div class="bootstrap-filestyle input-group">
					<input type="text" id="userfile" class="form-control" name="userfile" disabled="" value="<%=at.getOriginName()%>">
						 <span class="group-span-filestyle input-group-btn" tabindex="0">
<!-- 						 <label for="fileInput" class="btn btn-default ">
 -->							<span><i  onclick="location.href='<%=request.getContextPath() %>/download.fr?num=<%=at.getAno() %>'"></i></span>
  					<!-- </label>  -->
						
					</span> 
						<button onclick="location.href='<%=request.getContextPath() %>/download.tm?num=<%=at.getAno() %>'">다운로드</button>
					
				</div>
				<br>
				
		<BR>
			<div class="repleArea">
			<div class="replySelectArea">
			<table id="replySelectTable" class="table table-striped" style="text-align: center; border: 1px;">
				<% if(reply != null){
				for(int i=0;i<reply.size();i++){ %>
				<tr>
				
					<td><%=reply.get(i).getWriterId() %></td>
					<td><%=reply.get(i).getbContent() %></td>
					<td><%=reply.get(i).getbDate() %></td>
				</tr>
				<%}} %>
			</table>
			</div>
			<table align="center">
			<tr>
						 <td style="width: 20%;" text-align="center">댓글작성
						</td> 
						<td width="700px">
						<input type="text" class="form-control" id="replyContent" placeholder="댓글을 작성해주세요">
						</td>&nbsp;&nbsp;
						<td>
						<button id="addReply" class="btn btn-primary" >댓글등록</button>
						
						</td>
						
					</tr>
			</table>
			
			
		
				</div>	
			</div>
			<br>
			<Br>
			
			<div class="detailNoticeBtn">
				<button id="gotoList" class="btn btn-primary">목록으로</button>
				
				<button id="modifyBtn" class="btn btn-primary" onclick="location.href='<%=request.getContextPath() %>/selectTeam.tm?num=<%=t.getBno()%>'">수정</button>
				<button id="deleteBtn" class="btn btn-primary">삭제</button>
				
			</div>
			
		</div>
	</div>
	
	</div>
	<div>
	<h1>　</h1>
</div>
	
</section>

	<script>
	$(function(){
		$("#gotoList").click(function(){
			location.href="selectList.tm";
		});
	});
	
	$(function(){
		$("#deleteBtn").click(function(){
			
			alert("정말로 삭제하시겠습니까?");
			
		$("#viewTable").attr("action", "<%=request.getContextPath()%>/deleteTeam.tm");
		$("#viewTable").submit();	
			
		});
	});
	$(function(){
		$("#addReply").click(function(){
			
			
			var writer = <%= loginUser.getEmpid() %>; 
			var bno = <%= t.getBno() %>;
			var content = $("#replyContent").val(); 
			
		 	console.log(writer) 
			console.log(bno)
			console.log(content)
			
			$.ajax({
				url:"/semi/insertReply.tm",
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
						
						$("#replyContent").val("");
						window.location.reload();
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
	
