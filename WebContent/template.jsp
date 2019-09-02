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
	String contentPage = request.getParameter("CONTENTPAGE");
	//String middle = request.getParameter("MIDDLE");

%>
<center>
<table width="1040" height="712" cellpadding="2" cellspacing="0" id="b" border="0">
<tr height="140">
	<td colspan=3>
		<jsp:include page="top.jsp" flush="false"/>
	</td>
</tr>

<tr>
	<td valign="top">
		<jsp:include page="<%= contentPage %>" flush="false"/>
	</td>
</tr>

<tr>
	<td colspan=3>
		footer
	</td>
</tr>

</table>
</center>
</body>
</html>