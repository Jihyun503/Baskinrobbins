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
<center>
<form action="modifyProc2.jsp">
<table border=1 style="text-align:center">
<%
	request.setCharacterEncoding("utf-8");
	int num = Integer.parseInt(request.getParameter("num"));
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String writer = "";
	
	try{
		String url = "jdbc:oracle:thin:@10.96.124.214:1521:xe";
		String user = "PROJECT3613";
		String pass = "1234";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pass);
		pstmt = conn.prepareStatement("select * from REVIEW where num = ?");
		pstmt.setInt(1, num);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			int number = rs.getInt("num");
			writer = rs.getString("writer").trim();
			String title = rs.getString("title");
			String content = rs.getString("content");
			int count = rs.getInt("count");%>
			
			<tr>
				<td width=50><input type="text" name="num" readonly value="<%=number %>"></td>
				<td width=300><input type="text" name="title" value="<%=title %>"></td>
				<td width=100><input type="text" disabled value="<%=writer %>"></td>
				<td width=50><input type="text" disabled value="<%=count %>"></td>
			</tr>
			<tr height="300">
				<td colspan="4"><textarea name="content" rows="18" cols="85"><%=content %></textarea></td>
			</tr>	
			
			
<%		}//if

	}
	catch(Exception e){
		e.printStackTrace();
	}
	finally{
		if(rs!=null){ try{ rs.close(); } catch(Exception e) {} }//if
		if(pstmt!=null){ try{ pstmt.close(); } catch(Exception e) {} }//if
		if(conn!=null){ try{ conn.close(); }catch(Exception e) {} }//if
	}
%>
</table>
<br>
<input type="submit" value="수정">
</form>
</center>
</body>
</html>