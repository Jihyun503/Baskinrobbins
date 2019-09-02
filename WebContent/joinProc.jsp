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
<form action="joinProc2.jsp" method="post">
이름 : <input type="text" name="name" maxlength="10"><p>
아이디 : <input type="text" name="id" maxlength="8"><p>
비밀번호 : <input type="password" name="pw" maxlength="15"><p>
생년월일 : <input type="date" name="birth"><p>
e-mail : <input type="text" name="email" maxlength="30"><p>
전화번호 :
<select name="local">
	<option value="x">없음</option>
	<option value="010">010</option>
	<option value="016">016</option>
	<option value="011">011</option>
</select>
- 
<input type="text" name="tel1" pattern="\d{4}" maxlength="4">
- 
<input type="text" name="tel2" pattern="\d{4}" maxlength="4"> <p>
<input type="submit" value="가입">
</form>
</center>
</body>
</html>