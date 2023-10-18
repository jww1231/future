<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%! int day = 3; %>
<% if(day ==1  | day == 7) {%>
	<p>오늘은 주말입니다</p>
<%} else { %>
	<p> 오늘은 주말이 아닙니다.</p>
<%}  %>
<%
	switch(day){
	case 1:
		out.println("오늘은 Sunday."); break;
	case 2:
		out.println("오늘은 Monday."); break;
	case 3:
		out.println("오늘은 Tuesday."); break;
	case 4:
		out.println("오늘은 Wednesday."); break;
	case 5:
		out.println("오늘은 Thursday."); break;
	case 6:
		out.println("오늘은 Friday."); break;
	case 7:
		out.println("오늘은 Saturday."); break;
		
	}
%>

<table border = 1> <tr>
<%
	int godhealth = 1004;
	String arr[][] = {{ "대전시","충주시","서울시"},{"주민1","주민2","주민3"}};
	for (String data[]: arr){
		out.println(data.length +"<br>");
		for( String str : data){
			%>
			<td><%=str %> </td>
			<%
		}
			%>
			</tr><tr>
			<% 
		}
 
%>
</tr></table>


</body>
</html>