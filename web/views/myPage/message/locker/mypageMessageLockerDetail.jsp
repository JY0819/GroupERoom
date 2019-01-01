<%@page import="com.semi.myPage.model.Msg.vo.Msg"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	Msg msg = (Msg)request.getAttribute("msg");
%>

<jsp:include page="/views/layout/treeview/mypage/layout-up.jsp" />

<style>
#alignDiv{
	margin-top: 80px;
	margin-bottom: 100px;
}
#alignDiv > table > tbody > tr > td{
	padding: 10px;
}
#btn1{
	text-align: center;
	background-color: #205181;
	padding: 5px;
	color:white;
	border-radius: 10px;
	width: 60px;
	height: 40px;
	margin-left: 5px;
	margin-right: 5px;
	float: left;
}
#btn2{
	text-align: center;
	background-color: #205181;
	padding: 5px;
	color:white;
	border-radius: 10px;
	width: 100px;
	height: 40px;
	margin-left: 5px;
	margin-right: 5px;
	float: right
}
#txtArea{
	width: 100%;
	height: 300px;
	text-align: left;
	vertical-align: top;
}
</style>

<script>
	var jsonData = treeviewJson.myPageJson;
	var nodeName = "쪽지 보관함";
</script>
<section class="content">

	<div class="content-left">
		<div id="treeview"></div>
	</div>

	<div class="content-right container">
		<div align="center" id="alignDiv">
			<table>
				<tr>
					<td colspan="4">
						<input id="btn1" type="button" value="답장" onclick="location.href='<%=request.getContextPath()%>/replyLockerMessage?replymsgNo=<%=msg.getMsgNo()%>'">
						<input id="btn1" type="button" value="전달" onclick="location.href='<%=request.getContextPath()%>/relayLockerMsg?msgNo=<%=msg.getMsgNo()%>'">
						<input id="btn1" type="button" value="삭제" onclick="location.href='<%=request.getContextPath()%>/deleteLockerMsgOne?msgNo=<%=msg.getMsgNo()%>'">
					</td>
					<td>
						<input id="btn2" type="button" value="돌아가기" onclick="location.href='<%=request.getContextPath()%>/myPageMessage'">
					</td>
				</tr>
				<tr>
					<td>보낸 사람</td>
					<td><%= msg.getMsgSender() %></td>
					<td>보낸 날짜</td>
					<td><%= msg.getMsgSendD() %></td>
				</tr>
				<tr>
					<td>받는 사람</td>
					<td><%= msg.getMsgReceiver() %></td>
					<td>읽은 날짜</td>
					<td><%= msg.getMsgReceiveD()%></td>
				</tr>
				<tr>
					<td colspan="5">
						<textarea id="txtArea" readonly><%= msg.getMsgContents() %></textarea>
					</td>
				</tr>
			</table>
		</div>
	</div>
</section>

<jsp:include page="/views/layout/treeview/mypage/layout-down.jsp" />