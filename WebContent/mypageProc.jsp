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
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("id");
	
	boolean chk;
	
    String url = "jdbc:oracle:thin:@10.96.124.214:1521:xe";
    String user = "PROJECT3613";
    String pass = "1234";
    Connection conn;
    Statement  stmt;
    PreparedStatement pstmt;
    ResultSet rs;
     
    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn = DriverManager.getConnection(url, user, pass);
    stmt = conn.createStatement();
    pstmt=conn.prepareStatement("select * from CUSTOMER where id = '"+id+"'");
    rs=pstmt.executeQuery();
    
    if(rs.next()){
    	System.out.println("ok");
    	System.out.println(rs.getString("name"));
    }
    
    
    String name = rs.getString("name");
	String pw = rs.getString("pw");
	String email = rs.getString("email");
	String birth = rs.getString("birth");
	String phone = rs.getString("phone");
%>

<center>
<form action="mypageProc2.jsp" method="post">
이름 : <input type="text" name="name" value="<%= name %>" maxlength="10"><p>
아이디 : <input type="text" name="id" value="<%= id %>" maxlength="8" readonly><p>
비밀번호 : <input type="text" name="pw" value="<%= pw %>" maxlength="15"><p>
생년월일 : <input type="text" name="birth" value="<%= birth %>" readonly><p>
e-mail : <input type="text" name="email" maxlength="30" value="<%= email %>"><p>
전화번호 :
<input type="text" name="phone" value="<%= phone %>" maxlength="11"><p>
<input type="button" onclick = "location.href='order.jsp'" value="주문내역">
<input type="submit" value="완료">
<input type="button" onclick = "location.href='delete.jsp?chk=2'" value="회원탈퇴">
</form>
</center>

<% conn.close(); %>


</body>
</html>