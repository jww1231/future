<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.lang.*, com.emp.mariadb.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
   /*table :is(th,td) { padding:10px; }*/
</style>
</head>
<body>
<%
   EmpDAO dao = new EmpDAO();
   ArrayList<EmpDTO> vec = new ArrayList<EmpDTO>();
   vec = dao.getRecords(1, 10);
%>
   <center>
      <h3>주소록</h3>
      <div class="container mt-3"> 
      <table border=1 table class="table">
         <tr>
            <th>번호</th> 
            <th>이름</th>
            <th>급여</th>
         </tr>
         <%
            Iterator iterator = vec.iterator();
            while(iterator.hasNext()){
               EmpDTO dto = (EmpDTO) iterator.next();
               %>
                  <tr>
                     <td><%=dto.getId() %></td>
                     <td><%=dto.getName() %></td>
                     <td><%=dto.getSalary() %></td>
                  </tr>
               <%
            }
         %>
      </table>
    
      </div>
   </center>
   
</body>
</html>