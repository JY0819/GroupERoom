<%@page import="java.util.ArrayList"%>
<%@page import="com.semi.approval.document.vo.SumEmpInfo"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	HashMap<Integer, ArrayList<SumEmpInfo>> hmap = (HashMap<Integer, ArrayList<SumEmpInfo>>)request.getAttribute("map");
%>
<jsp:include page="/views/layout/treeview/mypage/layout-up.jsp" />

<style>
.diary {
	border: 2px solid skyblue;
	border-radius: 15px;
	width: 600px;
	padding: 20px;
}

.sub {
	text-indent: 1em;
}

#sendMessagePop {
	width: 250px;
	height: 200px;
	margin-left: 50px;
}

#messageArea {
	width: 100%;
	height: 125px;
	border-radius: 5px;
	resize: none;
	overflow-x: hidden;
}

.btn{
	text-align: center;
	background-color: #205181;
	padding: 5px;
	color:white;
	border-radius: 10px;
	width: 55px;
	height: 30px;
}

#sendObject {
	border-radius: 5px;
	width: 100%;
	height: 30px;
}
.empNo:hover{
	background: black;
	color: white;
}
</style>

<script>
	var jsonData = treeviewJson.myPageJson;
	var nodeName = "주소록";
</script>

<section class="content">

	<div class="content-left">
		<div id="treeview"></div>
	</div>

	<div class="content-right container">
		<div align="center" style="margin-top: 50px; margin-bottom: 100px;">
			<div class="diary">
				<form action="">
				<table style="margin-top: 30px;">
					<tr>
						<td style="float: left;">
							<div class="white_content" id="open">
				        		<dl>
				        			<% for(int i=0; i < hmap.size(); i++) { %>
				        			<dt>
				        				<i class="fab fa-bandcamp">&nbsp;<%= hmap.get(i).get(0).getDeptName() %>팀</i>
				        			</dt>
				        				<% for(int j=0; j<hmap.get(i).size(); j++) { %>
				        				<dd class="empNo" onclick="choiceEmpNo();">&nbsp;&nbsp;&nbsp;<i class="far fa-star"></i>&nbsp;<%= hmap.get(i).get(j).getEmpNo() %>&nbsp;<%= hmap.get(i).get(j).getEmpName() %></dd>
				        				<% } %>
				        			<% } %>
				        		</dl>
					    	</div>
						</td>
						<td style="float: left;">
							<table id="sendMessagePop">
								<tr>
									<td>
										<input type="text" id="sendObject" value="받는 사람" readonly>
										<input type="hidden" name="receiveEmpid" value="">
									</td>
								</tr>
								<tr>
									<td><textarea id="messageArea">보낼 내용</textarea></td>
								</tr>
								<tr>
									<td style="text-align: center;">
										<input type="submit" class="btn" value="전송">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<button class="btn">삭제</button>
									</td>
								</tr>
							</table>
				    	</td>
					</tr>
				</table>
				</form>
			</div>
		</div>
	</div>
</section>

<script type="text/javascript">
	function choiceEmpNo() {
		$(".empNo").click(function() {
			var name = $(this).text();
			console.log(name);
			$("#sendObject").val(name.substring(name.length-3, name.length));
			$("#receiveEmpid").val(name.substring(0, name.length-4));
		});
	}
</script>

<jsp:include page="/views/layout/treeview/mypage/layout-down.jsp" />