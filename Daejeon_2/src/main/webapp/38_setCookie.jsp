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
	//필요한 데이터를 웹브라우저에 저장했다가 다음에 같은 사이트에 접근시 자동으로 가지고 감
	//서버가 종료가 되더라도 저장되어 있음
	//session(세션이 끝날때 사이트를 떠날때), Application(서버가 종료될 때까지 유지)
	Cookie inname = new Cookie("inname", request.getParameter("inname"));
	Cookie inaddr = new Cookie("inaddr", request.getParameter("inaddr"));

	inname.setMaxAge(60 * 60 * 24); // 1일 저장
	inaddr.setMaxAge(60 * 60 * 24);
	// require (get 함수들만)

	response.addCookie(inname); // header 파일 : 포멧, 정보, 쿠키 (set함수))
	response.addCookie(inaddr);
	%>
	<ul>
		<li><p>
				<b>이름:</b>
				<%=request.getParameter("inname")%>
			</p></li>
		<li><p>
				<b>주소:</b>
				<%=request.getParameter("inaddr")%>
			</p></li>
	</ul>
</body>
</html>