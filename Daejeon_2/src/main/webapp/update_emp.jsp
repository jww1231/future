<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>수정</h3>
<div>
<p>
<Center>
<form action="update_emp_receive.jsp">
<table width = "40%" border="1">
<caption><h3>수정진행</h3></caption>
<tr>
<th width="30%">번호 선택</th>
<td width="70%"  align="center">
<input type="text" name="id" size="27%"/>
</td>
</tr>
<tr>
<th width="30%">수정할 이름</th>
<td width="70%" align="center">
<input type="text" name="name" size="27%"/>
</td>
</tr>
<tr>
<th width="30%">수정할 급여</th>
<td width="70%" align="center">
<input type="text" name="salary"  size="27%"/>
</td>
</tr>
</table>
<br/>
<table  width="40%">
<tr>
<td align="right">
<input type="hidden" id="action" name="action" value="insert">
<input type="submit"    value="수정처리"/>
</td>
</tr>
</table>
</form>
</center>
</div>



</body>
</html>   