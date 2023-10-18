<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.* , com.emp.mariadb.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	ArrayList<EmpDTO> vec = new ArrayList<EmpDTO>();
	vec = (ArrayList<EmpDTO>) request.getAttribute("datal");
	%>
	<h3>주소록</h3>
	<a href = "http://localhost:8080/Daejeon_2/43_EmpMenu.html">메뉴로 돌아가기</a>
	<table border=1>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>급여</th>
		</tr>
		<%
		Iterator iterator = vec.iterator();
		while (iterator.hasNext()){
		EmpDTO dto = (EmpDTO) iterator.next();
		%>
		<tr>
		<td><%=dto.getId() %></td>
		<td><%=dto.getName() %></td>
		<td><%=dto.getSalary() %></td>
 		</tr>
<% 
		}
%>
	</table>


</body>
</html>