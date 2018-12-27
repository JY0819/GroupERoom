<%@page import="com.semi.myPage.model.vo.Msg"%>
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
	var nodeName = "휴가 관리";
</script>

<section class="content">

	<div class="content-left">
		<div id="treeview"></div>
	</div>

	<div class="content-right container">
		<form action="" method="post" id="formId">
		<div align="center" id="alignDiv">
			<table id="messageList" class="line" align="center">
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
					<td class="line"><%= m.getMsgNo() %></td>
					<td class="line"><%= m.getMsgSendD() %></td>
					<td class="line"><%= m.getMsgSender() %></td>
					<td class="line"><%= m.getMsgReceiver() %></td>
					<td class="line"><%= m.getMsgContents() %></td>
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