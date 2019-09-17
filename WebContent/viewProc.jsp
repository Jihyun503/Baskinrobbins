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
		String sql = "select * from REVIEW where num = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			int number = rs.getInt("num");
			writer = rs.getString("writer").trim();
			String title = rs.getString("title");
			String content = rs.getString("content");
			int count = rs.getInt("count") + 1;%>
			
			<tr>
				<td width=50><%=number %></td>
				<td width=300><%=title %></td>
				<td width=100><%=writer %></td>
				<td width=50><%=count %></td>
			</tr>
			<tr>
				<td colspan="4"><%=content %></td>
			</tr>	
			
			
<%		
			sql = "update REVIEW set count=count+1 where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		}//if

		
		
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

<button onclick="location.href='board.jsp'">목록</button>
<%
String id = "";
if(session.getAttribute("id")!=null){
 	id = (String)session.getAttribute("id");
}
 if (id.equals(writer)){
%>
 	 
	<button onclick="location.href='modify.jsp?num=<%=num%>'">수정</button>
	<button onclick="location.href='delete.jsp?num=<%=num%>&chk=1'">삭제</button>
<%
	}
%>
</center>
</body>
</html>