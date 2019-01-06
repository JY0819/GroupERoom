<%@page import="com.semi.common.vo.DeptEmp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.semi.admin.user.model.vo.Employee"%>
<%@page import="com.semi.myPage.model.Msg.vo.Msg"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	Msg msg = (Msg)request.getAttribute("msg");
	Employee user = (Employee)session.getAttribute("loginUser");
	HashMap<String, ArrayList<DeptEmp>> hmap = (HashMap<String, ArrayList<DeptEmp>>)request.getAttribute("map");
	ArrayList<String> deptIdList = (ArrayList<String>)request.getAttribute("deptIdList");
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
.white_content {
	z-index: 1;
    position: absolute;
    top: 0;
    height: 900px;
    right: 0;
    bottom: 0;
    left: 0;
    background: rgba(0, 0, 0, 0.8);
    opacity:0;
    -webkit-transition: opacity 400ms ease-in;
    -moz-transition: opacity 400ms ease-in;
    transition: opacity 400ms ease-in;
    pointer-events: none;
}
.white_content:target {
	opacity:1;
	pointer-events: auto;
}
.white_content > div {
	position: absolute;
	top: 25%;
	left: 25%;
	width: 50%;
	height: 50%;
	padding: 16px;
	border: 16px solid #205181;
	background-color: white;
	overflow: auto;	
}
.white_content > div > .close > .closeBtn2 {
	position: absolute;
	text-align: center;
	background-color: #F1C40F;
	width: 100px;
	height: 40px;
	color:white;
	border-radius: 10px;
    font-size: 16px;
	top: 85%;
	left: 42%;
    border: 0;
    outline: 0;
}
.empNo:hover{
	background: black;
	color: white;
	cursor: pointer;
}
</style>

<script>
	var choice;
	var selectedEmp;
	$(function() {
		$(".diary").click(function() {
			choice = $(this).text();
		});
		$(".empNo").click(function() {
			var name = $(this).text();
			
			$(".selected").html(name.substring(name.length-3, name.length) + "&nbsp;&nbsp;&nbsp;<a class='diary' href='#open' style='color: #205181;'><i class='far fa-plus-square'></i></a>");
			$("#receiver").val(name.substring(0, name.length-4));
			
			$(this).css({"background":"black", "color":"white"});
			if (selectedEmp != null) {
				selectedEmp.css({"background":"white", "color":"black"});
			}
			selectedEmp = $(this);
			
		});
	});
	
	function sendMsg() {
		$("#empNo").attr("value", "<%=user.getEmpid()%>");
		if ($("#receiver").val() == 'null') {
			alert("대상을 선택해주세요!");
		} else {
			$("#formId").submit();
		}
	}
</script>

<script>
	var jsonData = treeviewJson.myPageJson;
	var nodeName = "보낸 쪽지함";
</script>
<section class="content">

	<div class="content-left">
		<div id="treeview"></div>
	</div>
	<div class="white_content" id="open" align="center">
        <div align="center" style="text-align: center;">
       		<dl>
       			<% for(int i=0; i<hmap.size(); i++) { %>
        			<% if(hmap.get(deptIdList.get(i)).isEmpty()){ %>
        			
      				<% }else{ %>
        				<dt><i class="fab fa-bandcamp"><%= hmap.get(deptIdList.get(i)).get(0).getDeptName() %>팀</i></dt>
        				<% for(int j=0; j<hmap.get(deptIdList.get(i)).size(); j++) { %>
        				<dd class="empNo"><i class="far fa-star"></i><%= hmap.get(deptIdList.get(i)).get(j).getEmpId() %>&nbsp;<%= hmap.get(deptIdList.get(i)).get(j).getEmpName() %></dd>
        				<% } %>
        			<% } %>
        		<% } %>
        	</dl>
            <a class="close" href="#"><button type="button" class="closeBtn2" style="background: rgb(0, 154, 200);">닫기</button></a>
        </div>
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
						<td class="selected"><%= msg.getMsgSender() %>&nbsp;&nbsp;&nbsp;<a class="diary" href="#open" style="color: #205181;"><i class="far fa-plus-square"></i></a></td>
					</tr>
					<tr>
						<td colspan="8">
							<textarea id="txtArea" name="contents"><%= msg.getMsgContents() %></textarea>
						</td>
					</tr>
				</table>
				<input id="empNo" type="hidden" name="empNo">
				<input id="receiver" type="hidden" name="receiver" value="<%= msg.getMsgSenderID() %>">
			</div>
		</div>
	</form>
</section>


<jsp:include page="/views/layout/treeview/mypage/layout-down.jsp" />