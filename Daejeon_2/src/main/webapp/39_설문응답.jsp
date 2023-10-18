<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
   request.setCharacterEncoding("utf-8");//인코딩 잘못 인식한 경우 utf-8로
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <%
      int jumsu = 0;
      int total = 0;
      String level = "";
      
      
   %>
   <% 
      // 반복문 갯수
      int count = Integer.parseInt(request.getParameter("mind_count"));
      for(int i = 1; i<count; i++){
         String mind = request.getParameter("mind"+i);
         
         // 이거 반복문으로 줄여보기
         if(mind.equals("sel1")){ jumsu = 5; }
         else if(mind.equals("sel2")){ jumsu = 4; }
         else if(mind.equals("sel3")){ jumsu = 3; }
         else if(mind.equals("sel4")){ jumsu = 2; }
         else { jumsu = 1; }
         
         
         total+=jumsu;
      }
      if(total < 13){
         level = "<h3>마음가짐 굿</h3>정진";
      }
      else if(total < 18){
         level = "<h3>보통이다</h3>갈고 닦아라";
      }
      else {
         level = "<h3>좋지않다</h3>밖에 나가라";
      }
   %>
   <h1>당신의 현재 심리 검사 결과</h1>
   <%=level%>
   
   <!-- 문제 -->
   <!-- Enumeration e = request.getParameterNames(); -> 문항수 -->
   <!-- while(e.hasMoreElement()) -->
   <!-- (String) e.nextElement(); -->
</body>
</html>