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
String user = (String) session.getAttribute("user");
String userName = null;
String sessionID = null;
Cookie[] cookies = request.getCookies();
if(cookies !=null){
	for (Cookie cookie : cookies){
		if(cookie.getName().equals("user"))
			userName = cookie.getValue();
		if(cookie.getName().equals("JSESSIONID"))
			sessionID = cookie.getValue();
	}
		
 
	
}
%>
<h3>
	축하합니다!
	<%=userName %>,<br> Login 성공. 당신의 Session ID = <%=sessionID %> 입니다.
</h3>
<br> User=<%=user %>
<br> 
<a href = "CheckoutPage.jsp">Checkout Page</a>
<form action="LogoutServlet" method="post">

</form>
</body>
</html>