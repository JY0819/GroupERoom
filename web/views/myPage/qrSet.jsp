<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<br> <br> <br> <br> <br> <br> 
		<h1>해당 QR코드를 휴대폰으로 스캔하여 출근 버튼을 눌러주세요!</h1>
		
		<%
			if(chk == 1) {
				String qrcode = request.getContextPath() + "/qrcode/image/" + fileName + ".png";
				out.print("<img src='" + qrcode + "'/><p/>");
			} else {
				out.print("잘못된 URL 입니다.<p/>");
			}
		
		%>
		
	</div>
</body>
</html>