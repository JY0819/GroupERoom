<%@page import="com.semi.common.vo.DeptEmp"%>
<%@page import="com.semi.admin.user.model.vo.Employee"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.semi.approval.document.vo.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.semi.approval.document.vo.Document"%>
<%
	Document document = (Document)request.getAttribute("doc");
	HashMap<Integer, ArrayList<SumEmpInfo>> hmap = (HashMap<Integer, ArrayList<SumEmpInfo>>)request.getAttribute("map");
	HashMap<String, ArrayList<DeptEmp>> address=(HashMap<String, ArrayList<DeptEmp>>)request.getAttribute("address");
	ArrayList<String> deptIdList=(ArrayList<String>)request.getAttribute("deptIdList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>VacationDocument</title>
<link rel="stylesheet" type="text/css" href="/semi/assets/css/approval/document.css">

</head>
<body>

<jsp:include page="/views/main/mainPage.jsp"/>
<form class="documentForm" action="<%= request.getContextPath()  %>/insertDocument.id" method="post" encType="multipart/form-data">
<h1>휴가신청서</h1>
	<table>
		<tr>
			<td class="td">번호<input type="hidden" name="va" value="va"></td>
			<td class="content"><input type="text" name="num" value=<%= document.getManageNo()+1%>></td>
			<td rowspan="2" class="gap"></td>
			<td class="td" rowspan="3">결<br>재</td>
			<td class="td">1차</td>
			<td class="td">2차</td>
			<td class="td">3차</td>
		</tr>
		<tr>
			<td class="td">이미지첨부</td>
			<td class="content">&nbsp;<input type="file" name="file"></td>
			<td class="approvalTd" rowspan="2"></td>
			<td class="approvalTd" rowspan="2"></td>
			<td class="approvalTd" rowspan="2"></td>
		</tr>
		<tr>
			<td class="td">결재자</td>
			<td class="content"><input type="text" id="person1" name="person1"><input type="hidden" id="appr1" name="empNo1" value="">&nbsp;<a class="aTag" href="#open"><button type="button" class="appr">결재자1선택</button></a></td>
		</tr>
    	<div class="white_content" id="open">
        	<div>
        		<dl><h4>주소록</h4> 
        			<% for(int i=0; i<address.size(); i++) { 
        					if(address.get(deptIdList.get(i)).isEmpty()){
        						
        					}else{%>
        			<dt><i class="fab fa-bandcamp"><%= address.get(deptIdList.get(i)).get(0).getDeptName() %>팀</i></dt>
        				<% for(int j=0; j<address.get(deptIdList.get(i)).size(); j++) { %>
        				<dd class="empNo" onclick="choiceEmpNo();"><i class="far fa-star"></i><%= address.get(deptIdList.get(i)).get(j).getEmpId() %>&nbsp;<%= address.get(deptIdList.get(i)).get(j).getEmpName() %></dd>
        					<% } 
        						}%>
        				<% } %>
        		</dl>
            	<a class="close" href="#"><button type="button" class="saveBtn2">저장</button></a><a class="close" href="#"><button type="button" class="closeBtn2" onclick="closePopUp();">닫기</button></a>
        	</div>
    	</div>
		<tr>
			<td class="td">결재자</td>
			<td class="content"><input type="text" id="person2" name="person2"><input type="hidden" id="appr2"  name="empNo2" value="">&nbsp;<a href="#open" class="aTag"><button type="button" class="appr">결재자2선택</button></a></td>
		</tr>
		<tr>
			<td class="td">결재자</td>
			<td class="content"><input type="text" id="person3" name="person3"><input type="hidden" id="appr3"  name="empNo3" value="">&nbsp;<a href="#open" class="aTag"><button type="button" class="appr">결재자3선택</button></a></td>
		</tr>
		<tr>
			<td class="gap2" colspan="2"></td>
			<td></td>
			<td colspan="4"  class="gap3"></td>
		</tr>
		<tr>
			<td class="td">문서번호</td>
			<td class="content" colspan="2"><input type="text" name="docNum" value=<%= document.getManageDocNo()+1%>></td>
			<!--value=document.getManageDocNo()-->
			<td class="td">사원번호</td>
			<td class="content" colspan="3"><input type="text" name="empNum" value=<%= document.getManageEmpId() %>></td>
			<!--value=document.getManageNo()  --> 
		</tr>
		<tr>
			<td class="td">휴가기간</td>
			<td class="content" colspan="2"><input type="date" name="startDate"><br><input type="date" name="endDate"></td>
			<td class="td">분류</td>
			<td class="content" colspan="3">
				<select name="documentKind">
					<option>휴가신청서</option>
					<option>업무계획서</option>
					<option>재직증명서</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class="td">제목</td>
			<td class="content" colspan="2"><input type="text" name="title"></td>
			<td class="td">작성일</td>
			<td class="content" colspan="3"><input type="date" name="date"></td>
		</tr>
		<tr>
			<td class="td">사유</td>
			<td class="content" colspan="7"><input type="text" name="reason"></td>
		</tr>
		<tr>
			<td colspan="7" class="td">내용</td>
		</tr> 
		<tr>
			<td class="lastContent" colspan="7"><textarea class="contentArea" name="content"></textarea></td>
		</tr>
		<tr>
			<td class="td" colspan="7">의견</td>
		</tr>
		<tr>
			<td class="lastContentDown" colspan="7"><textarea class="contentArea" name="opinion" readonly="readonly"></textarea></td>
		</tr>
	</table>
	<button class="saveBtn" type="submit">저장</button> 
	<button class="closeBtn" type="reset" onclick="back();">닫기</button>
</form>
	<script>
	var choice;
	function popupOpen(){
		var popUrl = "test.html";	//팝업창에 출력될 페이지 URL
		var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption);
		}
		function back() {
			location.href="views/approval/taskBox/choiceDocument.jsp";
		}
		$(function() {
			$(".appr").click(function() {
				choice = $(this).text();			
			});
		});
		$(function() {
			$(".empNo").bind('mouseenter', function() {
				$(this).css({"background":"black", "color":"white"});
				$(this).css({'cursor':"pointer"});
			}).bind('mouseleave', function() {
				$(this).css({"background":"white", "color":"black"});
			});
			$(".empNo").click(function() {
				var name = $(this).text();
				if(choice == '결재자1선택'){
					$("#person1").val(name.substring(name.length-3, name.length));
					$("#appr1").val(name.substring(0, name.length-4));
				}else if(choice == '결재자2선택'){
					$("#person2").val(name.substring(name.length-3, name.length));
					$("#appr2").val(name.substring(0, name.length-4));
				}else {
					$("#person3").val(name.substring(name.length-3, name.length));
					$("#appr3").val(name.substring(0, name.length-4));
				}
			});
		});
		function closePopUp() {
			if(choice == '결재자1선택'){
				$("#person1").val("");
			}else if(choice == '결재자2선택'){
				$("#person2").val("");
			}else {
				$("#person3").val("");
			}
		} 
	</script>
</body>
</html>