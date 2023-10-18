<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("utf-8");
%>
<%
    String name = "본인의 성격";
    String bloodType = request.getParameter("test");
%>
<jsp:forward page='<%= test2 + ".jsp" %>'>
    <jsp:param name="name" value="<%= name %>" />
</jsp:forward>


