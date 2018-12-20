<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
	h1{
		text-align: center;
	}
	.vacation, .proof, .work{
	position: absolute;
	top: 400px;
	text-align: center;
	background-color: #205181;
	color:white;
	border-radius: 10px;
	width: 100px;
	height: 25px;
    left: 330px;
    position: absolute;
    font-size: 16px;
	}
	.proof {
    left: 590px;
	}
	.work {
    left: 850px;
	}
	#contentImgArea1, #contentImgArea2, #contentImgArea3 {
		height: 250;
		width: 250;
		border: 1px solid black;
	}
	#contentImgArea1 {
		position: relative;
		left: -50px;
	}
	#contentImgArea3 {
		position: relative;
		left: 50px;
	}
</style>
</head>
<body>
	<jsp:include page="/views/main/mainPage.jsp"/>
	<div class="btnArea">
		<a href="vacationDocument.jsp"><label class="vacation" onclick="">휴가신청서</label></a>
		<a href="proofOfEmployment.jsp"><label class="proof">재직증명서</label></a>
		<a href="workDocument.jsp"><label class="work">업무계획서</label></a>
	</div>
	<div class="outer">
			<br>
			<form action="<%= request.getContextPath() %>/insert.tn" method="post" encType="multipart/form-data">
					<table align="center">
						<tr>
							<td colspan="3"><h1>문서 양식 선택</h1></td>
						</tr>
						<tr>
							<td>
								<div id="contentImgArea1">
									<a href="vacationDocument.jsp"><img id="contentImg1" width="200" height="200" src="/semi/assets/images/approval/vacationDocument.PNG" alt="vacationDocument"></a>
								</div>
							</td>
							<td>
								<div id="contentImgArea2">
									<a href="proofOfEmployment.jsp"><img id="contentImg2" width="200" height="200" src="/semi/assets/images/approval/employeeDocument.PNG" alt="employeeDocument"></a>
								</div>
							</td>
							<td>
								<div id="contentImgArea3">
									<a href="workDocument.jsp"><img id="contentImg3" width="200" height="200" src="/semi/assets/images/approval/workDocument.PNG" alt="workDocument"></a>
								</div>
							</td>
						</tr>
					</table>
			</form>
		</div>
		<script>
		$(function() {
			$("#contentImgArea1").on({'mouseenter':function(){
				$(this).css("border-color", "red")
			}, 'mouseleave':function(){
				$(this).css("border-color", "black")
			}});
			
		});
		$(function() {
			$("#contentImgArea2").on({'mouseenter':function(){
				$(this).css("border-color", "red")
			}, 'mouseleave':function(){
				$(this).css("border-color", "black")
			}});
			
		});
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