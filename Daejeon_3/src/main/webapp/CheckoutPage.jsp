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
String userName = null;
String sessionID = null;
Cookie[] cookies = request.getCookies();
if(cookies !=null){
	for(Cookie cookie : cookies){
		if(cookie.getName().equals("user"))
			userName = cookie.getValue();
	}
}
%>
<h3>
	Hi
	<%=userName %>,로그아웃하려면 누르시오
</h3>
<br>
<form action = "LogoutServlet" method="post">
<input type = "submit" value="Logout">

</form>
</body>
</html>