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
	int chk = Integer.parseInt(request.getParameter("chk"));
	String sql = "";
	System.out.println("chk 들어옴"+chk);
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try{
		String url = "jdbc:oracle:thin:@10.96.124.214:1521:xe";
		String user = "PROJECT3613";
		String pass = "1234";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pass);
		if(chk==1){
			int num = Integer.parseInt(request.getParameter("num"));
			sql = "delete from REVIEW where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
		}
		else if(chk==2){
			sql = "delete from CUSTOMER where id = '"+((String)session.getAttribute("id")).trim()+"'";
			pstmt = conn.prepareStatement(sql);
			session.removeAttribute("id");
		}
		
		pstmt.executeUpdate();
	}
	catch(Exception e){
		e.printStackTrace();
	}
	
	finally{
		if(pstmt!=null){ try{ pstmt.close(); } catch(Exception e) {} }//if
		if(conn!=null){ try{ conn.close(); }catch(Exception e) {} }//if
	}

	if(chk==1){
		response.sendRedirect("board.jsp"); 
	}
	else{
		response.sendRedirect("index.jsp"); 
	}
%>

</body>
</html>