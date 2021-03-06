<%@page import="com.semi.approval.approve.model.vo.ApprLine"%>
<%@page import="com.semi.board.Free.model.vo.Attachment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.semi.approval.approve.model.vo.DetailDoc"%>
<%@page import="com.semi.common.vo.Attachments"%>
<%@page import="com.semi.admin.user.model.vo.Employee"%>
<%@page import="com.semi.approval.document.vo.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.semi.approval.document.vo.Document"%>
  
    
<%
	DetailDoc d = (DetailDoc)request.getAttribute("d");
	/* ArrayList<Attachment> fileList = (ArrayList<Attachment>)request.getAttribute("fileList");*/
	ArrayList<Attachment> fileList = (ArrayList<Attachment>)request.getAttribute("fileList");
	ArrayList<ApprLine> lineList = (ArrayList<ApprLine>)request.getAttribute("linelist");
	 Employee employee = (Employee)session.getAttribute("loginUser");
	 Attachment img = fileList.get(0);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>DetailDocument</title>
<link rel="stylesheet" type="text/css" href="/semi/assets/css/approval/document.css">

</head>
<body>

<jsp:include page="/views/layout/layout-up.jsp"/>
	<%if(d.getManageclass() == 1){ %>
	<table class="detailDoc">
		
		<tr>
			<td class="td">분류<input type="hidden" name="va" value="va"></td>
			<td class="content"><input type="text" name="num" value="휴가계획서" disabled="disabled"></td>
			<td rowspan="2" class="gap"></td>
			<td class="td" rowspan="3">결<br>재</td>
			<td class="td">1차 결재 확인</td>
			<td class="td">2차 결재 확인</td>
			<td class="td">3차 결재 확인</td>
		</tr>
		
			
		
		<tr>
		<!--이미지 태그넣기  -->
			<td class="td">첨부파일</td>
			<%if(d.getAttachno() == 0) {%>
			<td class="content">&nbsp;</td>
			<%} else{%>
			<td class="content">&nbsp;<img id="titleImg" src="<%= request.getContextPath()%>/assets/images/approval/approvalUpload/<%= img.getChangeName()%>"></td>
			<%} %>
			<%if(lineList.size()>=1 && lineList.size()<4){ %>
			<td class="approvalTd" rowspan="2"><input type="text" name="approve1" value="<%=lineList.get(0).getApprName()%>" disabled="disabled"></td>
			<%}else{ %>
			<td class="approvalTd" rowspan="2"><input type="text" name="approve1"></td>
			<%} %>
			<%if(lineList.size()>=2 && lineList.size()<4){ %>
			<td class="approvalTd" rowspan="2"><input type="text" name="approve2" value="<%=lineList.get(1).getApprName()%>" disabled="disabled"></td>
			<%}else{ %>
			<td class="approvalTd" rowspan="2"><input type="text" name="approve2"></td>
			<%} %>
			<%if(lineList.size()>=3 && lineList.size()<4){ %>
			<td class="approvalTd" rowspan="2"><input type="text" name="approve3" value="<%=lineList.get(2).getApprName()%>" disabled="disabled"></td>
			<%}else{ %>
			<td class="approvalTd" rowspan="2"><input type="text" name="approve3"></td>
			<%} %>
		</tr>
		<%if(lineList.size()>=1 && lineList.size()<4){ %>
		<tr>
			<td class="td">1차<br>결재자</td>
			<td class="content"><%=lineList.get(0).getApprName()%><input type="hidden" id="appr1" name="empNo1" ></td>
		</tr>
		<%}else{ %>
		
		<tr>
			<td class="td">1차<br>결재자</td>
			<td class="content"><input type="text" id="person1" name="person1" ><input type="hidden" id="appr1" name="empNo1" ></td>
		</tr>
		<%} %>
		<%if(lineList.size()>=2 && lineList.size()<4){ %>
		<tr>
			<td class="td">2차<br>결재자</td>
			<td class="content"><%=lineList.get(1).getApprName()%><input type="hidden" id="appr2"  name="empNo2" value=""></td>
		</tr>
		<%}else {%>
		<tr>
			<td class="td">2차<br>결재자</td>
			<td class="content"><input type="text" id="person2" name="person2" ><input type="hidden" id="appr2"  name="empNo2" value=""></td>
		</tr>
		<%} %>
		<%if(lineList.size()>=3 && lineList.size()<4){ %>
		<tr>
			<td class="td">3차<br>결재자</td>
			<td class="content"><%=lineList.get(2).getApprName()%><input type="hidden" id="appr3"  name="empNo3" value=""></td>
		</tr>
		<%}else{ %>
		
		<tr>
			<td class="td">3차<br>결재자</td>
			<td class="content"><input type="text" id="person3" name="person3" ><input type="hidden" id="appr3"  name="empNo3" value=""></td>
		</tr>
		<%} %>
		<tr>
			<td class="gap2" colspan="2"></td>
			<td></td>
			<td colspan="4"  class="gap3"></td>
		</tr>
		<tr>
			<td class="td">문서번호</td>
			<td class="content" colspan="2"><input type="text" name="docNum" value="<%=d.getManagedocno()%>" disabled="disabled"></td>
			<!--value=document.getManageDocNo()-->
			<td class="td">사원번호</td>
			<td class="content" colspan="3"><input type="text" name="empNum" value="<%=d.getManageempid()%>" disabled="disabled"></td>
			<!--value=document.getManageNo()  --> 
		</tr>
		<tr>
			<td class="td">휴가기간</td>
			<td class="content" colspan="2"><input type="text" name="startDate" value="<%=d.getVacStart()%>"disabled="disabled"><br><input type="text" name="endDate" value="<%=d.getVarEnd()%>"disabled="disabled"></td>
			<td class="td">사유</td>
			<td class="content" colspan="7"><%=d.getVacReason()%></td>
		</tr>
		<tr>
			<td class="td">제목</td>
			<td class="content" colspan="2"><%=d.getTitle()%></td>
			<td class="td">작성일</td>
			<td class="content" colspan="3"><%=d.getManageDay()%></td>
		</tr>
		
		<tr>
			<td colspan="7" class="td">내용</td>
		</tr> 
		<tr>
			<td class="lastContent" colspan="7"><%=d.getContents() %></td>
		</tr>
		
		
		
	</table>
	<%}%>
	<%if(d.getManageclass() ==2){ %>
	<table class="detailDoc">
		
		<tr>
			<td class="td">분류<input type="hidden" name="va" value="va"></td>
			<td class="content"><input type="text" name="num" value="재직증명서" disabled="disabled"></td>
			<td rowspan="2" class="gap"></td>
			<td class="td" rowspan="3">결<br>재</td>
			<td class="td">1차 결재 확인</td>
			<td class="td">2차 결재 확인</td>
			<td class="td">3차 결재 확인</td>
		</tr>
		<tr>
		<!--이미지 태그넣기  -->
			<td class="td">첨부파일</td>
			<%if(d.getAttachno() == 0) {%>
			<td class="content">&nbsp;</td>
			<%} else{%>
			<td class="content">&nbsp;<img id="titleImg" src="<%= request.getContextPath()%>/assets/images/approval/approvalUpload/<%= img.getChangeName()%>"></td>
			<%} %>
			<%if(lineList.size()>=1 && lineList.size()<4){ %>
			<td class="approvalTd" rowspan="2"><input type="text" name="approve1" value="<%=lineList.get(0).getApprName()%>"disabled="disabled"></td>
			<%}else{ %>
			<td class="approvalTd" rowspan="2"><input type="text" name="approve1"></td>
			<%} %>
			<%if(lineList.size()>=2 && lineList.size()<4){ %>
			<td class="approvalTd" rowspan="2"><input type="text" name="approve2" value="<%=lineList.get(1).getApprName()%>"disabled="disabled"></td>
			<%}else{ %>
			<td class="approvalTd" rowspan="2"><input type="text" name="approve2"></td>
			<%} %>
			<%if(lineList.size()>=3 && lineList.size()<4){ %>
			<td class="approvalTd" rowspan="2"><input type="text" name="approve3" value="<%=lineList.get(2).getApprName()%>"disabled="disabled"></td>
			<%}else{ %>
			<td class="approvalTd" rowspan="2"><input type="text" name="approve3"></td>
			<%} %>
		</tr>
		<%if(lineList.size()>=1 && lineList.size()<4){ %>
		<tr>
			<td class="td">1차<br>결재자</td>
			<td class="content"><%=lineList.get(0).getApprName()%><input type="hidden" id="appr1" name="empNo1" ></td>
		</tr>
		<%}else{ %>
		
		<tr>
			<td class="td">1차<br>결재자</td>
			<td class="content"><input type="text" id="person1" name="person1" ><input type="hidden" id="appr1" name="empNo1" ></td>
		</tr>
		<%} %>
		<%if(lineList.size()>=2 && lineList.size()<4){ %>
		<tr>
			<td class="td">2차<br>결재자</td>
			<td class="content"><%=lineList.get(1).getApprName()%><input type="hidden" id="appr2"  name="empNo2" value=""></td>
		</tr>
		<%}else {%>
		<tr>
			<td class="td">2차<br>결재자</td>
			<td class="content"><input type="text" id="person2" name="person2" ><input type="hidden" id="appr2"  name="empNo2" value=""></td>
		</tr>
		<%} %>
		<%if(lineList.size()>=3 && lineList.size()<4){ %>
		<tr>
			<td class="td">3차<br>결재자</td>
			<td class="content"><%=lineList.get(2).getApprName()%><input type="hidden" id="appr3"  name="empNo3" value=""></td>
		</tr>
		<%}else{ %>
		
		<tr>
			<td class="td">3차<br>결재자</td>
			<td class="content"><input type="text" id="person3" name="person3" ><input type="hidden" id="appr3"  name="empNo3" value=""></td>
		</tr>
		<%} %>
		<tr>
			<td class="gap2" colspan="2"></td>
			<td></td>
			<td colspan="4"  class="gap3"></td>
		</tr>
		<tr>
			<td class="td" >문서번호</td>
			<td class="content" colspan="2"><input type="text" name="docNum" value="<%=d.getManagedocno()%>" disabled="disabled"></td>
			<!--value=document.getManageDocNo()-->
			<td class="td" >사원번호</td>
			<td class="content" colspan="3"><input type="text" name="empNum" value="<%=d.getManageempid()%>" disabled="disabled"></td>
			<!--value=document.getManageNo()  --> 
		</tr>
		<tr>
			<td class="td">입사기간</td>
			<td class="content" colspan="2"><input type="text" name="startDate" value="<%=d.getEntryDay()%>"disabled="disabled"></td>
		</tr>
		<tr>
			<td class="td">제목</td>
			<td class="content" colspan="2"><%=d.getTitle()%></td>
			<td class="td">작성일</td>
			<td class="content" colspan="3"><%=d.getManageDay()%></td>
		</tr>
		
		<tr>
			<td colspan="7" class="td">내용</td>
		</tr> 
		<tr>
			<td class="lastContent" colspan="7"><%=d.getContents() %></td>
		</tr>
		
		
	</table>
	<%} %>
	<%if(d.getManageclass() ==3){ %>
	<table class="detailDoc">
		
		<tr>
			<td class="td">분류<input type="hidden" name="va" value="va"></td>
			<td class="content"><input type="text" name="num" value="업무계획서" disabled="disabled"></td>
			<td rowspan="2" class="gap"></td>
			<td class="td" rowspan="3">결<br>재</td>
			<td class="td">1차 결재 확인</td>
			<td class="td">2차 결재 확인</td>
			<td class="td">3차 결재 확인</td>
		</tr>
		<tr>
		<!--이미지 태그넣기  -->
			<td class="td">첨부파일</td>
			<%if(d.getAttachno() == 0) {%>
			<td class="content">&nbsp;</td>
			<%} else{%>
			<td class="content">&nbsp;<img id="titleImg" src="<%= request.getContextPath()%>/assets/images/approval/approvalUpload/<%= img.getChangeName()%>"></td>
			<%} %>
			<%if(lineList.size()>=1 && lineList.size()<4){ %>
			<td class="approvalTd" rowspan="2"><input type="text" name="approve1" value="<%=lineList.get(0).getApprName()%>"disabled="disabled"></td>
			<%}else{ %>
			<td class="approvalTd" rowspan="2"><input type="text" name="approve1"></td>
			<%} %>
			<%if(lineList.size()>=2 && lineList.size()<4){ %>
			<td class="approvalTd" rowspan="2"><input type="text" name="approve2" value="<%=lineList.get(1).getApprName()%>"disabled="disabled"></td>
			<%}else{ %>
			<td class="approvalTd" rowspan="2"><input type="text" name="approve2"></td>
			<%} %>
			<%if(lineList.size()>=3 && lineList.size()<4){ %>
			<td class="approvalTd" rowspan="2"><input type="text" name="approve3" value="<%=lineList.get(2).getApprName()%>"disabled="disabled"></td>
			<%}else{ %>
			<td class="approvalTd" rowspan="2"><input type="text" name="approve3"></td>
			<%} %>
		</tr>
		<%if(lineList.size()>=1 && lineList.size()<4){ %>
		<tr>
			<td class="td">1차<br>결재자</td>
			<td class="content"><%=lineList.get(0).getApprName()%><input type="hidden" id="appr1" name="empNo1" ></td>
		</tr>
		<%}else{ %>
		
		<tr>
			<td class="td">1차<br>결재자</td>
			<td class="content"><input type="text" id="person1" name="person1" ><input type="hidden" id="appr1" name="empNo1" ></td>
		</tr>
		<%} %>
		<%if(lineList.size()>=2 && lineList.size()<4){ %>
		<tr>
			<td class="td">2차<br>결재자</td>
			<td class="content"><%=lineList.get(1).getApprName()%><input type="hidden" id="appr2"  name="empNo2" value=""></td>
		</tr>
		<%}else {%>
		<tr>
			<td class="td">2차<br>결재자</td>
			<td class="content"><input type="text" id="person2" name="person2" ><input type="hidden" id="appr2"  name="empNo2" value=""></td>
		</tr>
		<%} %>
		<%if(lineList.size()>=3 && lineList.size()<4){ %>
		<tr>
			<td class="td">3차<br>결재자</td>
			<td class="content"><%=lineList.get(2).getApprName()%><input type="hidden" id="appr3"  name="empNo3" value=""></td>
		</tr>
		<%}else{ %>
		
		<tr>
			<td class="td">3차<br>결재자</td>
			<td class="content"><input type="text" id="person3" name="person3" ><input type="hidden" id="appr3"  name="empNo3" value=""></td>
		</tr>
		<%} %>
		<tr>
			<td class="gap2" colspan="2"></td>
			<td></td>
			<td colspan="4"  class="gap3"></td>
		</tr>
		<tr>
			<td class="td">문서번호</td>
			<td class="content" colspan="2"><input type="text" name="docNum" value="<%=d.getManagedocno()%>" disabled="disabled"></td>
			<!--value=document.getManageDocNo()-->
			<td class="td">사원번호</td>
			<td class="content" colspan="3"><input type="text" name="empNum" value="<%=d.getManageempid()%>" disabled="disabled"></td>
			<!--value=document.getManageNo()  --> 
		</tr>
		<tr>
			
			
		</tr>
		<tr>
			<td class="td">제목</td>
			<td class="content" colspan="2"><%=d.getTitle()%></td>
			<td class="td">작성일</td>
			<td class="content" colspan="3"><%=d.getManageDay() %></td>
		</tr>
		
		<tr>
			<td colspan="7" class="td">내용</td>
		</tr> 
		<tr>
			<td class="lastContent" colspan="7"><%=d.getContents() %></td>
		</tr>
		
		
	</table>

	<%} %>
	<button class="finishoneclose" onclick="back();">닫기</button>
	
  
  
	<script>
		function back() {
			location.href = "/semi/finishappr.fi";
		}
	</script>


  
<jsp:include page="/views/layout/layout-down.jsp"/>