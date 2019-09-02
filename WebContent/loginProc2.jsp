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
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
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
    pstmt=conn.prepareStatement("select id from CUSTOMER where id = '"+id+"' and pw = '"+pw+"'");
    rs=pstmt.executeQuery();
    
    if(rs.next())
    	chk = true;
    else
    	chk=false;
    
    if(chk){
    	session.setAttribute("id", id);
    	response.sendRedirect("index.jsp");

    }else{%>
    	<script>
    		alert("로그인 실패");
    		history.go(-1);
    	</script>
    	
    <%}
    
    conn.close();
%>
</body>
</html>