<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 16px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  -webkit-transition-duration: 0.4s; /* Safari */
  transition-duration: 0.4s;
  cursor: pointer;
}
.button4 {
  background-color: white;
  color: black;
  border: 2px solid #e7e7e7;
}

.button4:hover {background-color: #e7e7e7;}

</style>
</head>
<body>
<center>
<button class="button button4" onclick="location.href='admin2.jsp'">회원</button>
<div>
<h1>인기 제품 순위</h1>	<p><p>
<%
if(!((String)session.getAttribute("id")).equals("admin")){
	out.print("<script>alert('관리자 전용 페이지 입니다.');history.go(-1)</script>");
}

	request.setCharacterEncoding("utf-8");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String name = "";
	String url = "jdbc:oracle:thin:@10.96.124.214:1521:xe";
	String user = "PROJECT3613";
	String pass = "1234";
	
	//순위구하기
	try{
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pass);
		String sql = "SELECT pname, sum(amount), RANK() OVER (ORDER BY sum(amount) DESC) FROM buy group by pname";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery(); 	
			while(rs.next()){
%>
		<h4><%= rs.getInt(3) %>위 : <%= rs.getString("pname") %> (<%= rs.getInt(2) %>개)</h4><br>
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
</div>
<hr>

<div>
<h1>항목별 판매된 제품</h1> <p><p>
<div style="float: left; width: 33%;">
<table border="1" style="text-align:center;" width="300">
	<tr style="background:yellow;">
	<td><h3>아이스크림</h3></td>
	</tr>
	<tr>
	<td>
<%

try{
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pass);
		String sql = "select name from product where categoryid = 'I' INTERSECT select pname from buy";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery(); 
		
			while(rs.next()){
%>
		<h5><%=rs.getString(1) %></h5><br>
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
</td></tr>
</table>
</div>

<div style="float: left; width: 33%;">
<table border="1" style="text-align:center;" width="300">
	<tr style="background:yellow;">
	<td><h3>음료</h3></td>
	</tr>
	<tr>
	<td>
<%

try{
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pass);
		String sql = "select name from product where categoryid = 'B' INTERSECT select pname from buy";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery(); 
		
			while(rs.next()){
%>
		<h5><%=rs.getString(1) %></h5><br>
		
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
</td></tr>
</table>
</div>

<div style="float: left; width: 33%;">
<table border="1" style="text-align:center;" width="300">
	<tr style="background:yellow;">
	<td><h3>etc.</h3></td>
	</tr>
	<tr>
	<td>
<%

try{
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pass);
		String sql = "select name from product where categoryid = 'D' INTERSECT select pname from buy";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery(); 
		
			while(rs.next()){
%>
		<h5><%=rs.getString(1) %></h5><br>
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
</td></tr>
</table>
</div>
</div>
</center>

</body>
</html>