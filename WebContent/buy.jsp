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
if(session.getAttribute("id")==null){
	System.out.println(session.getAttribute("id"));
	out.print("<script>alert('로그인 후에 이용해주세요');history.go(-1)</script>");
}

	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	int amount = Integer.parseInt(request.getParameter("amount"));
	int price = Integer.parseInt(request.getParameter("price"));

	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try{
		String url = "jdbc:oracle:thin:@10.96.124.214:1521:xe";
		String user = "PROJECT3613";
		String pass = "1234";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pass);
		pstmt = conn.prepareStatement("insert into BUY (id, pname, totalprice, amount) values(?, ?, ?, ?)");
		pstmt.setString(1, (String)session.getAttribute("id"));
		pstmt.setString(2, name);
		pstmt.setInt(3, amount*price);
		pstmt.setInt(4, amount);

		pstmt.executeUpdate();

	}
	catch(Exception e){
		e.printStackTrace();
	}
	finally{
		if(pstmt!=null){ try{ pstmt.close(); } catch(Exception e) {} }//if
		if(conn!=null){ try{ conn.close(); }catch(Exception e) {} }//if 
	}
	response.sendRedirect("menu.jsp");
%>
</body>
</html>