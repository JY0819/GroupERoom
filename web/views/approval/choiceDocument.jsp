<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
<style>
	h2{
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
    left: 380px;
    position: absolute;
    font-size: 16px;
	}
	.proof {
    left: 580px;
	}
	.work {
    left: 790px;
	}

</style>
</head>
<body>
	<jsp:include page="/views/main/mainPage.jsp"/>
	<div class="btnArea">
		<a href="vacationDocument.jsp"><label class="vacation">휴가신청서</label></a>
		<a href="proofDocument.jsp"><label class="proof">재직증명서</label></a>
		<a href="workDocument.jsp"><label class="work">업무계획서</label></a>
	</div>
	<div class="outer">
			<br>
			<form action="<%= request.getContextPath() %>/insert.tn" method="post" encType="multipart/form-data">
				<div class="insertArea">
					<table align="center">
						<tr>
							<td colspan="3"><h2>문서 양식 선택</h2></td>
						</tr>
						<tr>
							<td>
								<div id="contentImgArea1">
									<img id="contentImg1" width="200" height="200">
								</div>
							</td>
							<td>
								<div id="contentImgArea2">
									<img id="contentImg2" width="200" height="200">
								</div>
							</td>
							<td>
								<div id="contentImgArea3">
									<img id="contentImg3" width="200" height="200">
								</div>
							</td>
						</tr>
					</table>
				</div>
			</form>
		</div>
</body>
</html>