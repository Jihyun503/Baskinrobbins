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
	request.setCharacterEncoding("utf-8");
	String cata = (String)request.getParameter("cata");
	System.out.println(cata);
	String url = "jdbc:oracle:thin:@10.96.124.214:1521:xe";
	String user = "PROJECT3613";
	String pass = "1234";
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	 
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, user, pass);
	pstmt=conn.prepareStatement("select name, price from v_menu where categoryid = '"+cata+"'");
	rs=pstmt.executeQuery(); 
%>
<center>
<table border="1" style="text-align:center;" width="1020">
	<tr style="background:yellow;">
	<td><h2>제품 사진</h2></td>
	<td><h2>제품명</h2></td>
	<td><h2>가격</h2></td>
	</tr>
<%	
	int plus = 1;
	while(rs.next()){
	String name = rs.getString("name");
%>
	<tr>
	<td><a href="view2.jsp?name=<%=rs.getString("name") %>"><img src="img/menu/<%=name%>.png"></a></td>
   	<td><h3><%=rs.getString("name") %></h3></td>
	<td><h4><%=rs.getInt("price") %></h4></td>
	</tr>
<%
	plus++;
	}
%>
</table>
</center>
</body>
</html>