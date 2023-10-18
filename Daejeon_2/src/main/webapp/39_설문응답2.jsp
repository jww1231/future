<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Enumeration" %>
<!DOCTYPE html>
<%
request.setCharacterEncoding("utf-8"); // 인코딩 잘못 인식한 경우 utf-8로
%>
<html>
<head>
<meta charset="UTF-8">
<title>심리 검사 결과</title>
</head>
<body>
	<%
	int jumsu = 0;
	int total = 0;
	String level = "";
	%>
	<%
	request.setCharacterEncoding("utf-8");
	Enumeration<String> e = request.getParameterNames(); // 제네릭 사용을 권장
	while (e.hasMoreElements()) {
		String name = e.nextElement();
		String[] values = request.getParameterValues(name);

		for (String value : values) {
			if (value.equals("sel1")) { // 값을 확인할 변수를 수정
				jumsu = 5;
			} else if (value.equals("sel2")) { // 값을 확인할 변수를 수정
				jumsu = 4;
			} else if (value.equals("sel3")) { // 값을 확인할 변수를 수정
				jumsu = 3;
			} else if (value.equals("sel4")) { // 값을 확인할 변수를 수정
				jumsu = 2;
			} else {
				jumsu = 1;
			}

			total += jumsu;
		}
	}

	if (total < 13) {
		level = "<h3>마음가짐 굿</h3>정진";
	} else if (total < 18) {
		level = "<h3>보통이다</h3>갈고 닦아라";
	} else {
		level = "<h3>좋지 않다</h3>밖에 나가라";
	}
	%>
	<h1>당신의 현재 심리 검사 결과</h1>
	<%= level %>
	<%= total %>
</body>
</html>
