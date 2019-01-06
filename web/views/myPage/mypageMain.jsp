<%@page import="com.semi.common.vo.DeptEmp"%>
<%@page import="com.semi.approval.document.vo.SumEmpInfo"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.semi.myPage.model.Etc.vo.PageInfo"%>
<%@page import="com.semi.myPage.model.Msg.vo.Msg"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% 
	ArrayList<Msg> list = (ArrayList<Msg>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	HashMap<String, ArrayList<DeptEmp>> hmap = (HashMap<String, ArrayList<DeptEmp>>)request.getAttribute("map");
	ArrayList<String> deptIdList = (ArrayList<String>)request.getAttribute("deptIdList");
	
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
	width: 100px;
	height: 40px;
	margin-bottom: 20px;
}
#btn1{
	margin-right: 250px;
	margin-left: 250px;
}
#btn2{
	margin-right: 50px;
	margin-left: 100px;
}
/* .alignBox{
	position: relative;
	display: inline-block;
} */
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
/* #messageList{
	width: 700px;
}
.line{
	border: 2px solid skyblue;
	border-collapse: collapse;
	padding: 8px;
	text-align: center;
} */
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

		<div>
			<table id="myPageMainTable">
				<tr>
					<td>
						<div class="alignBox"><input class="btn" id="btn2" type="button" value="쪽지 보내기" onclick="location.href='<%=request.getContextPath()%>/showAddress'"></div>
					</td>
					<td>
						<div class="alignBox"><input class="btn" id="btn1" type="button" value="받은 쪽지함" onclick="location.href='<%=request.getContextPath()%>/myPageMessage'"></div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="white_content" id="open" style="padding-left: 50px; vertical-align: top;">
				        	<div>
				        		<dl>
				        			<% for(int i=0; i<deptIdList.size(); i++) { %>
				        			<dt style="padding: 3px;">
				        				<% if(hmap.get(deptIdList.get(i)).isEmpty()) { %>
				        				
				        				<% } else { %>
				        				<i class="fab fa-bandcamp">&nbsp;<%= hmap.get(deptIdList.get(i)).get(0).getDeptName() %></i>
				        				<% } %>
				        			</dt>
				        				<% for(int j=0; j < hmap.get(deptIdList.get(i)).size(); j++) { %>
				        				<dd class="empNo" style="padding: 3px;">
				        					&nbsp;&nbsp;&nbsp;<i class="far fa-star"></i>&nbsp;<%= hmap.get(deptIdList.get(i)).get(j).getEmpId() %>&nbsp;<%= hmap.get(deptIdList.get(i)).get(j).getEmpName() %>
				        				</dd>
				        				<% } %>
				        			<% } %>
				        		</dl>
				     	  	</div>
				    	</div>
					</td>
					<td>
						<div style="height: 235px;">
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
						</div>
						<div class="paging" align="center">
							<ul class="pagination">
								
								<% for(int p = startPage; p <= endPage; p++) {
										if(p == currentPage) {
								%>
										<li><a href="#"><%= p %></a></li>
								<%		} else { %>
										<li><a href="<%=request.getContextPath()%>/myPageMain?currentPage=<%= p %>"><%= p %></a></li>
								<%		} %>
								
								<% } %>
			
							</ul>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
</section>

<jsp:include page="/views/layout/treeview/mypage/layout-down.jsp" />