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
	String name = request.getParameter("name");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int price = 0;
	
	try{
		String url = "jdbc:oracle:thin:@10.96.124.214:1521:xe";
		String user = "PROJECT3613";
		String pass = "1234";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pass);
		String sql = "select price, flavor, to_char(releasedate, 'YYYY/MM/DD') from PRODUCT where name = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			price = rs.getInt("price");
		%>
			
			<tr>
				<td><img src="img/menu/<%=name%>.png"></td>
			</tr>
			<tr>
				<td width=50><h3><%=name %></h3></td>
			</tr>
			<tr>
				<td width=50>가격 : <%=price %></td>
			</tr>
			<tr>
				<td width=300>대표맛 : <%=rs.getString("flavor") %></td>
			</tr>
			<%
			if(rs.getString(3)!=null){
			%>
			<tr>
				<td width=300>출시일 : <%=rs.getString(3) %></td>
			</tr>
			<%
			}
			if(session.getAttribute("id")!=null){
			%>
			<tr>
				<td width=300>
				<form action="buy.jsp" method="post">
				주문수량 : <input type="number" name="amount" value="1" min="1" max="9">
				<input type="hidden" name="name" value="<%=name%>">
				<input type="hidden" name="price" value="<%=price%>">
				<input type="submit" value="구매하기">
				</form>
				</td>
			</tr>
			<%
			}

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

<button onclick="location.href='menu.jsp'">목록</button>

</center>
</body>
</html>