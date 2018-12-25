<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<a href="../DocumentList/vacationDocument.jsp"><label class="vacation" onclick="">휴가신청서</label></a>
		<a href="../DocumentList/employmentDocument.jsp"><label class="proof">재직증명서</label></a>
		<a href="../DocumentList/workDocument.jsp"><label class="work">업무계획서</label></a>
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
									<a href="../DocumentList/vacationDocument.jsp"><img id="contentImg1" width="200" height="200" src="/semi/assets/images/approval/vacationDocument.PNG" alt="vacationDocument"></a>
								</div>
							</td>
							<td>
								<div id="contentImgArea2">
									<a href="../DocumentList/employmentDocument.jsp"><img id="contentImg2" width="200" height="200" src="/semi/assets/images/approval/employeeDocument.PNG" alt="employeeDocument"></a>
								</div>
							</td>
							<td>
								<div id="contentImgArea3">
									<a href="../DocumentList/workDocument.jsp"><img id="contentImg3" width="200" height="200" src="/semi/assets/images/approval/workDocument.PNG" alt="workDocument"></a>
								</div>
							</td>
						</tr>
					</table>
		</div>
		<script>
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
		</script>
</body>
</html>