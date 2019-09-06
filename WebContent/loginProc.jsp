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
if(session.getAttribute("id")!=null){
	out.print("<script>alert('이미 로그인이 완료되었습니다');history.go(-1)</script>");
}
%>
<center>
<img src="img/biglogo.png" width="400">
<form method="post" action="loginProc2.jsp">
아이디 : <input type="text" name="id" size=10> <br>
비밀번호 : <input type="password" name="pw" size=10> <p>
<input type="submit" value="로그인">
</form>
</center>
</body>
</html>