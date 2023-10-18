<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.* , com.student.mariadb.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	ArrayList<StuDTO> vec = new ArrayList<StuDTO>();
	vec = (ArrayList<StuDTO>) request.getAttribute("datal");
	%>
	<h3>주소록</h3>
	<a href = "http://localhost:8080/Daejeon_2/StuMenu.html">메뉴로 돌아가기</a>
	<table border=1>
		<tr>
			<th>이름</th>
			<th>국어</th>
			<th>영어</th>
			<th>수학</th>
		</tr>
		<%
		Iterator iterator = vec.iterator();
		while (iterator.hasNext()){
		StuDTO dto = (StuDTO) iterator.next();
		%>
		<tr>
		<td><%=dto.getName() %></td>
		<td><%=dto.getKor() %></td>
		<td><%=dto.getEng() %></td>
		<td><%=dto.getMat() %></td>
 		</tr>
<% 
		}
%>
	</table>


</body>
</html>