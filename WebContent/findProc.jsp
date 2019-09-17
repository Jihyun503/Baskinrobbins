<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
<h4 style="color:red;">가입 시 이메일을 입력했을 경우에만 가능합니다</h4><p>
<form method="post" action="findProc2.jsp">
<% if(request.getParameter("chk").equals("1")){ %>
이름 : <input type="text" name="name" size=10> <br>
<%}
else {
%>
아이디 : <input type="id" name="id" size=10> <p>
<%}%>
이메일 : <input type="text" name="email" size=10> <p>
<input type="submit" value="찾기">
</form>
</center>
</body>
</html>