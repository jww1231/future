<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<%
String name = "본인의 이름";
String bloodType = request.getParameter("bloodType");
%>
<jsp:forward page='<%=bloodType + ".jsp"%>'>
	<jsp:param name="name" value="<%=name%>" />
</jsp:forward>


