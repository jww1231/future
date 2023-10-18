
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
p{text-decoration: underline;}
</style>
</head>
<body>
<%! int i= 10 ; %>
<% out.println(" 빅데이터 과정<br>"); %>
<% out.println("자바와 동일한데 패키지 처리만 달라짐<br> "); %>
<% System.out.println("어디에 출력되냐?"+ i); %>
JSP의 시작입니다.
변수 i에 들어 있는 값은 <%= i %> 입니다.
<script>
    console.log("브라우저에 출력합니다.");
</script>

<%!
	int a;
	int b;
	public int sum(int a, int b){
		return a+b;
	}
%>
<%
	a=10;
	b=20;
	out.println(sum(a,b));
%>
	<p> 표현식 : 가시성도 좋고 변수 메쏘드의 결과값을 출력하는것이 가능</p>
	<div> 결과는 = <%= sum(a,b) %></div>
	
<% int g = 60; int k = 40; int r= 20; %>
	모두를 더한 계산 결과는 <%=g+k+r %> 입니다.
<jsp:include page = "age.jsp"/>
</body>
</html>