<%@page import="com.semi.admin.user.model.vo.Employee"%>
<%@page import="com.semi.myPage.model.Msg.vo.Msg"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	Msg msg = (Msg)request.getAttribute("msg");
	Employee user = (Employee)session.getAttribute("loginUser");
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
	width: 565px;
	height: 300px;
	text-align: left;
	vertical-align: top;
}
</style>



<script>
	var jsonData = treeviewJson.myPageJson;
	var nodeName = "보낸 쪽지함";
</script>
<section class="content">

	<div class="content-left">
		<div id="treeview"></div>
	</div>
	<form id="formId" action="<%=request.getContextPath()%>/sendMsg" method="post">
		<div class="content-right container">
			<div align="center" id="alignDiv">
				<table>
					<tr>
						<td colspan="4">
							<input id="btn1" type="button" value="전달" onclick="sendMsg();">
						</td>
			
						<td colspan="4">
							<input id="btn2" type="button" value="돌아가기" onclick="location.href='<%=request.getContextPath()%>/myPageMessageDetail?msgno=<%= msg.getMsgNo()%>'">
						</td>
					</tr>
					<tr>
						<td>받는 사람</td>
						<td><%= msg.getMsgSender() %>&nbsp;&nbsp;&nbsp;<a href="diary.html" onclick="window.open(this.href, '주소록','width=300, height=400, menubar=no, status=no, toolbar=no, location=no, scrollbars=no, resizable=no, fullscreen=no');return false;" target="_blank" style="color: blue;"><i class="far fa-plus-square"></i></a></td>
					</tr>
					<tr>
						<td colspan="8">
							<textarea id="txtArea" name="contents"><%= msg.getMsgContents() %></textarea>
						</td>
					</tr>
				</table>
				<input id="empNo" type="hidden" name="empNo">
				<input id="receiver" type="hidden" name="receiver">
				<script type="text/javascript">
					function sendMsg() {
						$("#empNo").attr("value", "<%=user.getEmpid()%>");
						$("#receiver").attr("value", "1001");
						// 나중에 empNo 주소록으로 설정 따로 할 것
						$("#formId").submit();
					}
				</script>
			</div>
		</div>
	</form>
</section>


<jsp:include page="/views/layout/treeview/mypage/layout-down.jsp" />