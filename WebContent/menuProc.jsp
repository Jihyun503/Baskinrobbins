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
	String choice = request.getParameter("choice");
	String search = request.getParameter("search");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String name = "";
	try{
		

		String url = "jdbc:oracle:thin:@10.96.124.214:1521:xe";
		String user = "PROJECT3613";
		String pass = "1234";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pass);
		String sql = "";
		if(choice==null){
			sql = "select name, price from v_menu";
		}
		else if(choice.equals("flavor")){
			sql = "select name, price from v_menu where flavor = '"+search+"'";
		}
		else{
			sql = "select name, price from v_menu where name like '%"+search+"%'";
		}
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery(); 
%>
<center>

<form action="menu.jsp">
<select name="choice">
<option value="flavor">대표맛</option>
<option value="name">제품명</option>
</select>
<input type="text" name="search">
<input type="submit" value="검색">
</form>
<p>

	<table border="1" style="text-align:center;" width="1020">
		<tr style="background:yellow;">
		<td><h2>제품 사진</h2></td>
		<td><h2>제품명</h2></td>
		<td><h2>가격</h2></td>
		</tr>
	<%	
		int plus = 1;
		while(rs.next()){
		name = rs.getString("name");
	%>
		<tr>
		<td><a href="view2.jsp?name=<%=rs.getString("name") %>"><img src="img/menu/<%=name%>.png"></a></td>
	   	<td><h3><%=rs.getString("name") %></h3></td>
		<td><h4><%=rs.getInt("price") %></h4></td>
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

</center>
</body>
</html>