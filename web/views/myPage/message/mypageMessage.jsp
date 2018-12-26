<%@page import="com.semi.myPage.model.vo.Msg"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% 
	ArrayList<Msg> list = (ArrayList<Msg>)request.getAttribute("list");
	int count = 1;
	boolean exist = false;
	if(list != null){
		exist = true;
	}else{
		exist = false;
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
}
/* .btn{
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
.alignBox{
	position: relative;
	display: inline-block;
}
#messageList{
	width: 600px;
}
.line{
	border: 2px solid skyblue;
	border-collapse: collapse;
	text-align: center;
	vertical-align: middle;
	height: 60px;
}
#alignDiv{
	margin-top: 80px;
}
#alignPtag{
	vertical-align: middle;
	padding : 10px;
} */
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

		<div align="center" id="alignDiv">
			<table>
				<tr>
					<td>
						<div class="alignBox" style="float: left; display: inline-block;">
							<input class="btn" id="btn1" type="button" value="선택 쪽지 삭제">
						</div>
						<div class="alignBox">
							<input class="btn" id="btn2" type="button" value="선택 쪽지 보관">
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<table id="messageList" class="line" align="center">
							<% if(exist) { %>
							<tr>
								<th class="line"><p id="alignPtag"><input id="all" type="checkbox"
									name="chkList" value="all"></p></th>
								<th class="line"><p id="alignPtag" style="font-weight: bold; ">보낸 날짜</p></th>
								<th class="line"><p id="alignPtag">보낸 사람</p></th>
								<th class="line"><p id="alignPtag">받는 사람</p></th>
								<th class="line"><p id="alignPtag" style="width: 180px;">내용</p></th>
								<th class="line"><p id="alignPtag">읽은 날짜</p></th>
							</tr>
							<% 		for(Msg m : list) { %>
							<tr>
								<td class="line"><p id="alignPtag"><input type="checkbox" name="chkList"
									value="<%= count %>"><%= count %></p></td>
								<td class="line"><p id="alignPtag"><%= m.getMsgSendD() %></p></td>
								<td class="line"><p id="alignPtag"><%= m.getMsgSender() %></p></td>
								<td class="line"><p id="alignPtag"><%= m.getMsgReceiver() %></p></td>
								<td class="line"><p id="alignPtag"><%= m.getMsgContents() %></p></td>
								<td class="line"><p id="alignPtag"><%= m.getMsgReceiveD() %></p></td>
							</tr>
							<% 		count++; %>
							<% 		} %>
							<% } else { %>
							<tr>
								<th class="line" colspan="6"><p>받은 메세지가 없어요!</p></th>
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