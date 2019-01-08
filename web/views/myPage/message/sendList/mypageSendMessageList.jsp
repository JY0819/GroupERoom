<%@page import="com.semi.myPage.model.Etc.vo.PageInfo"%>
<%@page import="com.semi.myPage.model.Msg.vo.Msg"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% 
	ArrayList<Msg> list = (ArrayList<Msg>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();

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
/* .line{
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
} */
</style>

<script>
	var jsonData = treeviewJson.myPageJson;
	var nodeName = "보낸 쪽지함";
</script>

<section class="content">

	<div class="content-left">
		<div id="treeview"></div>
	</div>

	<div class="content-right container">
		<div id="title">
			<h1 align="left">보낸 쪽지함</h1>
		</div>
		<hr>
		
		<form action="" method="post" id="formId">
		<div align="center" id="alignDiv">
			<table class="table table-striped" id="listArea" align="center">
				<% if(exist) { %>
				<tr>
					<th class="line"></th>
					<th class="line">보낸 날짜</th>
					<th class="line">보낸 사람</th>
					<th class="line">받는 사람</th>
					<th class="line" style="width: 300px;">내용</th>
				</tr>
				<% 		for(Msg m : list) { %>
				<tr>
					<td class="line"><%= listCount - m.getRnum() + 1 %></td>
					<td class="line"><%= m.getMsgSendD() %></td>
					<td class="line"><%= m.getMsgSender() %></td>
					<td class="line"><%= m.getMsgReceiver() %></td>
					<td class="line" width="500px"><a href="<%=request.getContextPath()%>/myPageSendMessageDetail?msgno=<%= m.getMsgNo() %>&sendList=true" style="color: black;"><%= m.getMsgContents() %></a></td>
				</tr>
				<% 		count++; %>
				<% 		} %>
				<% } else { %>
				<tr>
					<th class="line" colspan="5"><p>받은 메세지가 없어요!</p></th>
				</tr>
				<% } %>
			</table>
			<div class="paging" align="center">
				<ul class="pagination">
					
					<% for(int p = startPage; p <= endPage; p++) {
							if(p == currentPage) {
					%>
							<li><a href="#"><%= p %></a></li>
					<%		} else { %>
							<li><a href="<%=request.getContextPath()%>/myPageSendMessage?currentPage=<%= p %>"><%= p %></a></li>
					<%		} %>
					
					<% } %>
					
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
	$(function () {
		console.log("알람을 " + <%=request.getAttribute("sendAlarm")%> + "에게 전송 시도합니다.");
		var AlarmId = "" + <%=request.getAttribute("sendAlarm")%>;
		setTimeout(function() {
			console.log('대기...');
			if(isNull(AlarmId)) {
		 		console.log(AlarmId + ",msg")
				sendAlarm(AlarmId + ",msg");
			} else {
		 		
			}
		}, 3000);
	});
</script>
<jsp:include page="/views/layout/treeview/mypage/layout-down.jsp" />