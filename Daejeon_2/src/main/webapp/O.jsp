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
<title>O형 성격 특징</title>
</head>
<body>

	당신의 이름은 <%=name %> 이고요<br>
	혈액형 <b><%=bloodType %></b>형이고<br>
	
	할때 하고... 놀때 놀자. ㅋㅋ
	코로나에 강하다.<br> 

</body>
</html>