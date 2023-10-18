<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	Cookie cookie = null;
	Cookie[] cookies = null;
	cookies = request.getCookies();

	if (cookies != null) {
		out.println("<h2> 쿠키의 내용 </h2>");

		for (int i = 0; i < cookies.length; i++) {
			cookie = cookies[i];
			if ((cookie.getName()).compareTo("inname") == 0) {
		cookie.setMaxAge(0);
		response.addCookie(cookie);
		out.print("쿠키삭제: " + cookie.getName( ) + "<br/>");

			}
			out.print("Name : " + cookie.getName( ) + ", ");
			out.print("Value: " + cookie.getValue( ) + " <br/>");
		}
	} else {
		out.println("<h2>쿠키를 찾을 수 없습니다. </h2>");
	}
	%>


</body>
</html>