<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 스콥으로 저장된 변수 확인</title>
</head>
<body>
<%
String name = (String)pageContext.getAttribute("user",PageContext.SESSION_SCOPE);
out.print("Hello "+name);

String name2= (String)session.getAttribute("user");
out.print("Hello "+name2);
%>

</body>
</html>