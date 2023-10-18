<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String name = request.getParameter("uname");
out.print("Welcome " + name);

pageContext.setAttribute("user",name,pageContext.SESSION_SCOPE);
%>

</body>
</html>