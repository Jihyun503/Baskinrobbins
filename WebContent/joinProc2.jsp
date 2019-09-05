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
	String birth = request.getParameter("birth");
	String phone;
	
	if(request.getParameter("local").equals("x")){
		phone = null;
	}
	else{
		phone = request.getParameter("local")+request.getParameter("tel1")+request.getParameter("tel2");
	}
	
	try{
		String url = "jdbc:oracle:thin:@10.96.124.214:1521:xe";
	    String user = "PROJECT3613";
	    String pass = "1234";
	    Connection conn;
	    PreparedStatement pstmt;
	     
	    Class.forName("oracle.jdbc.driver.OracleDriver");
	    conn = DriverManager.getConnection(url, user, pass);
	    pstmt=conn.prepareStatement("INSERT INTO CUSTOMER(id, pw, name, phone, birth, email)  VALUES('"+id+"','"+pw+"','"+name+"','"+phone+"','"+birth+"','"+email+"')");
		//INSERT into member(id,name,pwd,email) VALUES ('id','name','pwd','email') 쿼리문
		  pstmt.executeUpdate();
		  pstmt.close();
		  conn.close();
		 }
		 catch(Exception e){
		  out.println( e );
		 }
		 out.print("<script>alert('회원가입이 완료되었습니다')</script>");
		 response.sendRedirect("index.jsp"); 
%>
</body>
</html>