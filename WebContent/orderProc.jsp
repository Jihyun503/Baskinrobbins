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
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("id");

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	

	String url = "jdbc:oracle:thin:@10.96.124.214:1521:xe";
	String user = "PROJECT3613";
	String pass = "1234";
	
	String name = "";
	String sql = "";
	try{
	
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pass);
		sql = "select pname, totalprice, amount from BUY where id ='" + ((String)session.getAttribute("id")).trim() + "'";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery(); 

%>
<center>
<h2>주문 내역</h2>
<p>
	<table border="1" style="text-align:center;" width="1020">
		<tr style="background:yellow;">
		<td><h4>제품 사진</h4></td>
		<td><h4>제품명</h4></td>
		<td><h4>수량</h4></td>
		<td><h4>가격</h4></td>
		</tr>
	<%	
		while(rs.next()){
		name = rs.getString("pname");
	%>
		<tr>
		<td><a href="view2.jsp?name=<%=rs.getString("pname") %>"><img src="img/menu/<%=name%>.png"></a></td>
	   	<td><h5><%=rs.getString("pname") %></h5></td>
	   	<td><h5><%=rs.getInt("amount") %></h5></td>
		<td><h5><%=rs.getInt("totalprice") %></h5></td>
		</tr>
	<%
		}
	}//try
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
<%
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pass);
		sql = "select sum(totalprice) from BUY where id ='" + ((String)session.getAttribute("id")).trim() + "'";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery(); 
		if(rs.next()){
%>
	<p>
	<p>
	<div>
	<h2 style="text-align:right;">총 합계 : <%=rs.getString(1) %>원</h2>
<%
		}
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

</div>
</center>
</body>
</html>