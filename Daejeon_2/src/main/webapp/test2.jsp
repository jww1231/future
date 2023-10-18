<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
    <form method="post" action="36_2_respone.jsp">
        <% 
        // 문자열 배열을 선언하고 초기화
        String[] questions = {
            "1. 다른 사람들에게 자신을 소개하는 것을 어려워합니다.",
            "2. 종종 주변을 무시하거나 잊어 버리는 생각에 빠지곤 합니다.",
            "3. 이메일에 가능한 빨리 회신하려고 하고 지저분한 편지함을 참을 수 없습니다.",
            "4. 중압감을 받을 때에도 쉽게 침착하게 집중력을 유지할 수 있습니다.",
            "5. 보통 대화를 먼저 시작하지 않습니다.",
            "6. 순전히 호기심 때문에 행동을 하는 경우는 거의 없습니다."
        };

        // 단순 for 루프를 사용하여 HTML 폼 요소 생성
        for (int i = 0; i < questions.length; i++) {
        %>
        <p><%= (i + 1) + ". " + questions[i] %></p>
        <input type="radio" name="survey<%= i + 1 %>" value="5"><label for="<%= i + 1 %>">매우그렇다(5)</label>
        <input type="radio" name="survey<%= i + 1 %>" value="4"><label for="<%= i + 1 %>">그렇다(4)</label>
        <input type="radio" name="survey<%= i + 1 %>" value="3"><label for="<%= i + 1 %>">보통이다(3)</label>
        <input type="radio" name="survey<%= i + 1 %>" value="2"><label for="<%= i + 1 %>">아니다(2)</label>
        <input type="radio" name="survey<%= i + 1 %>" value="1"><label for="<%= i + 1 %>">매우아니다(1)</label>
        <% } %>
        <input type="submit" value="설문조사 제출하기">
    </form>
</body>
</html>


