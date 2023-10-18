<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("utf-8");
    %>
    <%
    String name = request.getParameter("name");
    String bloodType = request.getParameter("bloodType");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>A형 성격 특징</title>
</head>
<body>

	당신의 이름은 <%=name %> 이고요<br>
	혈액형 <b><%=bloodType %></b>형이고<br>
	
	정확한 판단력을 가진 합리주의, 소심하고 세심 배려형 <br>
	짱이에요!

</body>
</html>