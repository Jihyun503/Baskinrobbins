<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String url = "jdbc:oracle:thin:@10.96.124.214:1521:xe";
	String user = "PROJECT3613";
	String pass = "1234";
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	 
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, user, pass);
	pstmt=conn.prepareStatement("select num, writer, CUSTOMER.name, title, count from REVIEW, CUSTOMER where REVIEW.writer = CUSTOMER.id");
	rs=pstmt.executeQuery(); 
%>
<center>
<table border="1" style="text-align:center;" width="1020">
	<tr style="background:lightblue;">
	<td><h4>번호</h4></td>
	<td><h4>제목</h4></td>
	<td><h4>작성자</h4></td>
	<td><h4>조회수</h4></td>
	</tr>
<%	
	while(rs.next()){
%>
	<tr>
	<td><%=rs.getInt("num")%></td>
	<td><%=rs.getString("title") %></td>
   	<td><%=rs.getString("name")+" ("+rs.getString("writer")+")" %></td>
	<td><%=rs.getString("count") %></td>
	</tr>
<%
	}
	
%>
</table>
</center>
</body>
</html>