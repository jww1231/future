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
	out.println("환영합니다 : " + request.getParameter("uname"));
%>
<ul>
<li><p><b>이름:</b>
	<%=request.getParameter("name") %></p>
	<li>
</ul>
<% // 입출력되는 숫자는 모두 문자열로 됨 모든 데이터와 네트워크 전송데이터가 문자열임
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	int num3 = num1+num2;
	out.println("두수의 합은 = " + num3);
		%>
</body>
</html>