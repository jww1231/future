<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% // 설정할때는 하나씩, 쿠키를 가져올 때는 한꺼번에
Cookie cookie = null;
Cookie[] cookies = null;
cookies = request.getCookies();

if(cookies != null){ // 'cookie'가 아닌 'cookies'로 수정
	out.println("<h2> 쿠키의 내용 </h2>");
	
	for (int i = 0; i < cookies.length; i++){
		cookie = cookies[i];
		out.print("Name : " + cookie.getName()+", ");
		out.print("Value: " + cookie.getValue()+" <br/>");
	}
}else{
	out.println("<h2>쿠키를 찾을 수 없습니다. </h2>");
}

%>

</body>
</html>
