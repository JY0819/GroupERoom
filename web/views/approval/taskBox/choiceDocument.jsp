<%@page import="com.sun.org.apache.xml.internal.security.utils.resolver.ResourceResolverException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.semi.admin.user.model.vo.*"%>
<%
	Employee emp = (Employee)session.getAttribute("loginUser");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/semi/assets/css/approval/choiceDocument.css">
</head>
<body>
	<jsp:include page="/views/main/mainPage.jsp"/>
	<!--문서 선택 버튼 영역-->
	<div class="btnArea">
		<label class="vacation">휴가신청서</label>
		<label class="proof">업무계획서</label>
		<label class="work">재직증명서</label>
	</div>
	<!--미리보기 문서영역-->
	<div class="outer">
			<br>
					<table align="center">
						<tr>
							<td colspan="3"><h1>문서 양식 선택</h1></td>
						</tr>
						<tr>
							<td>
								<div id="contentImgArea1">
									<img oncl id="contentImg1" width="200" height="200" src="/semi/assets/images/approval/vacationDocument.PNG" alt="vacationDocument">
								</div>
							</td>
							<td>
								<div id="contentImgArea2">
									<img id="contentImg2" width="200" height="200" src="/semi/assets/images/approval/employeeDocument.PNG" alt="employeeDocument">
								</div>
							</td>
							<td>
								<div id="contentImgArea3">
									<img id="contentImg3" width="200" height="200" src="/semi/assets/images/approval/workDocument.PNG" alt="workDocument">
								</div>
							</td>
						</tr>
					</table>
					
					<button class="closeBtn" onclick="back();">닫기</button>
		</div>
		<script>
		
		function back() {
			 location.href="/semi/selectDocument.sd"; 			
		}
		
		/*문서 선택시 빨간 테두리  */
		$(function() {
			$("#contentImgArea1").on({'mouseenter':function(){
				$(this).css("border-color", "red")
			}, 'mouseleave':function(){
				$(this).css("border-color", "black")
			}});
			
		});
		/*문서 선택시 빨간 테두리  */
		$(function() {
			$("#contentImgArea2").on({'mouseenter':function(){
				$(this).css("border-color", "red")
			}, 'mouseleave':function(){
				$(this).css("border-color", "black")
			}});
			
		});
		/*문서 선택시 빨간 테두리  */
		$(function() {
			$("#contentImgArea3").on({'mouseenter':function(){
				$(this).css("border-color", "red")
			}, 'mouseleave':function(){
				$(this).css("border-color", "black")
			}});
		});
	    $(function() {
			$("#contentImgArea1").click(function() {
				var id = <%=emp.getEmpid() %> + "va";
				location.href="<%= request.getContextPath()%>/selectDocumentNum.sdn?id=" + id;
			});
		}); 
	    $(function() {
			$("#contentImgArea2").click(function() {
				var id = <%=emp.getEmpid() %> + "em";
				location.href="<%= request.getContextPath()%>/selectDocumentNum.sdn?id=" + id;
			});
		}); 
	    $(function() {
			$("#contentImgArea3").click(function() {
				var id = <%=emp.getEmpid() %> + "wo";
				location.href="<%= request.getContextPath()%>/selectDocumentNum.sdn?id=" + id;
			}); 
		});  
		</script>
</body>
</html>