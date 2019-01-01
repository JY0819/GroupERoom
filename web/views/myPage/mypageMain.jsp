<%@page import="com.semi.myPage.model.Msg.vo.Msg"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
	width: 100px;
	height: 40px;
}
#btn1{
	margin-right: 250px;
	margin-left: 250px;
}
#btn2{
	margin-right: 50px;
	margin-left: 100px;
}
.alignBox{
	position: relative;
	display: inline-block;
}
.diary{
	border: 2px solid skyblue;
	border-radius: 15px;
	width: 200px;
	height: 300px;
	padding-left: 20px;
	padding-right: 0;
	padding-top: 20px;
}
.sub{
	text-indent: 1em;
}
#myPageMainTable{
	position: relative; 
	top: 100px;
	margin-bottom: 200px;
}
#messageList{
	width: 700px;
}
.line{
	border: 2px solid skyblue;
	border-collapse: collapse;
	padding: 8px;
	text-align: center;
}
</style>

<script>
	var jsonData = treeviewJson.myPageJson;
	var nodeName = "마이페이지";
</script>

<section class="content">

	<div class="content-left">
		<div id="treeview"></div>
	</div>

	<div class="content-right container">

		<div align="center">
			<table id="myPageMainTable" align="center">
				<tr>
					<td>
						<div class="alignBox"><input class="btn" id="btn1" type="button" value="받은 쪽지함" onclick="location.href='<%=request.getContextPath()%>/myPageMessage'"></div>
					</td>
					<td>
						<div class="alignBox"><input class="btn" id="btn2" type="button" value="주소록"></div>
					</td>
				</tr>
				<tr>
					<td>
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
								<td class="line"><a href="<%=request.getContextPath()%>/myPageMessageDetail?msgno=<%= m.getMsgNo() %>&sendList=false" style="color: black;"><%= m.getMsgContents() %></a></td>
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
					<td>
						<div class="diary" style="margin-left: 50px;">
						<table align="center">
							<tr>
								<td>즐겨찾기</td>
							</tr>
								<tr>
									<td class="sub">관리자</td>
								</tr>
								<tr>
									<td class="sub">가나다(팀장)</td>
								</tr>
							<tr>
								<td>인사회계팀</td>
							</tr>
							<tr>
								<td>마케팅팀</td>
							</tr>
							<tr>
								<td>개발팀</td>
							</tr>
								<tr>
									<td class="sub">가나다</td>
								</tr>
								<tr>
									<td class="sub">카카오(팀장)</td>
								</tr>
								<tr>
									<td class="sub">관리자</td>
								</tr>
								<tr>
									<td class="sub">가나다(팀장)</td>
								</tr>
							<tr>
								<td>디자인팀</td>
							</tr>
						</table>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
</section>

<jsp:include page="/views/layout/treeview/mypage/layout-down.jsp" />