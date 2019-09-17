<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try{
		String url = "jdbc:oracle:thin:@10.96.124.214:1521:xe";
		String user = "PROJECT3613";
		String pass = "1234";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pass);
		pstmt = conn.prepareStatement("insert into REVIEW (writer, title, content) values(?, ?, ?)");
		pstmt.setString(1, (String)session.getAttribute("id"));
		pstmt.setString(2, title);
		pstmt.setString(3, content);
		pstmt.executeUpdate();

	}
	catch(Exception e){
		e.printStackTrace();
	}
	finally{
		if(pstmt!=null){ try{ pstmt.close(); } catch(Exception e) {} }//if
		if(conn!=null){ try{ conn.close(); }catch(Exception e) {} }//if 
	}
	response.sendRedirect("board.jsp");
%>
</body>
</html>