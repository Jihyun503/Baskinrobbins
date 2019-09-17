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
if(session.getAttribute("id")==null){
	out.print("<script>alert('로그인 후에 이용해주세요');history.go(-1)</script>");
}
%>
<center>
<form action="writeProc2.jsp" method="post">
<table border="1" width="700" style="text-align:center;">
<tr>
<td width="50">제목</td>
<td><input type="text" name="title" size="85"></td> 
</tr>

<tr height="300">
<td>내용</td>
<td><textarea name="content" rows="18" cols="85"></textarea></td>
</tr>
</table>
<input type="submit" value="완료">
</form>
</center>
</body>
</html>