<%@page import="com.semi.myPage.model.Msg.vo.Msg"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% 
	ArrayList<Msg> list = (ArrayList<Msg>)request.getAttribute("list");
	int count = 1;
	boolean exist = false;
	if(list.size() == 0){
		exist = false;
	}else{
		exist = true;
	}
%>

<jsp:include page="/views/layout/treeview/mypage/layout-up.jsp" />

<style>
.btn{
	text-align: center;
	background-color: #205181;
	padding: 5px;
	color:white;
	border-radius: 10px;
	width: 120px;
	height: 40px;
}
#btn1{
	margin-bottom: 20px;
}
#btn2{
	margin-left: 20px;
	margin-bottom: 20px;
}
.line{
	border: 2px solid skyblue;
	border-collapse: collapse;
	padding: 8px;
	text-align: center;
}
#messageList{
	width: 700px;
}
#alignDiv{
	margin-top: 80px;
}
</style>

<script>
	var jsonData = treeviewJson.myPageJson;
	var nodeName = "받은 쪽지함";
</script>

<section class="content">

	<div class="content-left">
		<div id="treeview"></div>
	</div>

	<div class="content-right container">
		<form action="" method="post" id="formId">
		<div align="center" id="alignDiv">
			<table>
				<tr>
					<td>
						<div class="alignBox" style="float: left; display: inline-block;">
							<input class="btn" id="btn1" type="button" value="선택 쪽지 삭제" onclick="btn1Clk()">
						</div>
						<div class="alignBox">
							<input class="btn" id="btn2" type="button" value="선택 쪽지 보관" onclick="btn2Clk()">
						</div>
						<script type="text/javascript">
							function btn1Clk() {
								$("#formId").attr("action", "<%=request.getContextPath()%>/deleteMsg");
								$("#formId").submit();
							}
							function btn2Clk() {
								$("#formId").attr("action", "<%=request.getContextPath()%>/saveMsg");
								$("#formId").submit();
							}
						</script>
					</td>
				</tr>
				<tr>
					<td>
						<table id="messageList" class="line" align="center">
							<% if(exist) { %>
							<tr>
								<th class="line"><input id="all" type="checkbox" value="all"></th>
								<th class="line">보낸 날짜</th>
								<th class="line">보낸 사람</th>
								<th class="line">받는 사람</th>
								<th class="line" style="width: 300px;">내용</th>
							</tr>
							<% 		for(Msg m : list) { %>
							<tr>
								<td class="line">
									<input type="checkbox" name="chkList" value="<%= m.getMsgNo() %>">&nbsp; &nbsp;<%= m.getMsgNo() %>
								</td>
								<td class="line"><%= m.getMsgSendD() %></td>
								<td class="line"><%= m.getMsgSender() %></td>
								<td class="line"><%= m.getMsgReceiver() %></td>
								<td class="line"><a href="<%=request.getContextPath()%>/myPageMessageDetail?msgno=<%= m.getMsgNo() %>" style="color: black;"><%= m.getMsgContents() %></a></td>
							</tr>
							<% 		count++; %>
							<% 		} %>
							<% } else { %>
							<tr>
								<th class="line" colspan="5"><p>받은 메세지가 없어요!</p></th>
							</tr>
							<% } %>
						</table>
					</td>
				</tr>
			</table>
			<div class="paging" align="center">
				<ul class="pagination">
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
				</ul>
			</div>
		</div>
		</form>
	</div>
</section>

<script type="text/javascript">
	// 전체선택 쿼리
	$(document).ready(function() {
		$("#all").click(function() {
			if ($("#all").prop("checked")) {
				$("input[name=chkList]").prop("checked", true);
			} else {
				$("input[name=chkList]").prop("checked", false);
			}
		});
	});
</script>
<jsp:include page="/views/layout/treeview/mypage/layout-down.jsp" />