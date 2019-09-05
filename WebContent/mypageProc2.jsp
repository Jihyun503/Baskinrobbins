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
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	
	System.out.print(phone);
	
	Connection conn = null;
	String url = "jdbc:oracle:thin:@10.96.124.214:1521:xe";
    String user = "PROJECT3613";
    String pass = "1234";
	try{
	    
	    Statement  stmt;
	    PreparedStatement pstmt;
	    ResultSet rs;
	     
	    Class.forName("oracle.jdbc.driver.OracleDriver");
	    conn = DriverManager.getConnection(url, user, pass);
	      
	      stmt = conn.createStatement();

		  String query = "UPDATE CUSTOMER SET pw="+"'"+pw+"'"+", name="+"'"+name+"'"+", phone="+"'"+phone+"'"+", email="+"'"+email+"'"+" where id="+"'"+id+"'";
		  stmt.executeUpdate(query);
	      
	      conn.commit();
	      stmt.close();
	      //pstmt.close();
		  conn.close();
		 }
		 catch(Exception e){
		  out.println( e );
		  conn.rollback();
		 }
		 out.print("<script>alert('수정이 완료되었습니다')</script>");
		 response.sendRedirect("index.jsp"); 
%>
</body>
</html>