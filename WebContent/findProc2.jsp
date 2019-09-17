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
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String save = "";
	boolean chk;
	
    String url = "jdbc:oracle:thin:@10.96.124.214:1521:xe";
    String user = "PROJECT3613";
    String pass = "1234";
    String sql = "";
    Connection conn;
    PreparedStatement pstmt;
    ResultSet rs;
     
    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn = DriverManager.getConnection(url, user, pass);
    if(id==null){
    	sql = "select id from CUSTOMER where name = '" + name + "' and email = '" + email + "'";
    }
    else{
    	sql = "select pw from CUSTOMER where id = '" + id + "' and email = '" + email + "'";
    }
    pstmt=conn.prepareStatement(sql);
    rs=pstmt.executeQuery();
    
    if(rs.next()){
    	save = rs.getString(1);
    	out.println("<script>alert('당신의 아이디(비밀번호)는 " + save + "');history.go(-1);</script>");
 %>
    	<%
    }else{
    %>
    	<script>
    		alert("로그인 실패");
    		history.go(-1);
    	</script>
    	
    <%}
    
    conn.close();
%>
</body>
</html>