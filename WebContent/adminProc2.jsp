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
<button class="button button4" onclick="location.href='admin.jsp'">제품</button>
<div>
<h1>회원 구매 현황</h1>	<p><p>

<table border="1" style="text-align:center;" width="700">
		<tr style="background:lightblue;">
		<td><h4>아이디</h4></td>
		<td><h4>제품명</h4></td>
		<td><h4>수량</h4></td>
		<td><h4>가격</h4></td>
		</tr>
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
	
	try{
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pass);
		String sql = "select id, pname, sum(amount), sum(totalprice) from BUY group by rollup(id, pname)";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery(); 	
			while(rs.next()){
%>
		<tr>
		<td><h4><%= rs.getString(1) %></h4></td>
		
<% if(rs.getString(2)==null) {
		
	%>	
		<td><h4>합계</h4></td>	
<% 
}
else{%>
		<td><h4><%= rs.getString(2) %></h4></td>
<%} %>
		<td><h4><%= rs.getInt(3) %></h4></td>
		<td><h4><%= rs.getInt(4) %></h4></td>
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
</div>
<hr>
<div>
<h1>게시물 현황</h1>	<p><p>

<table border="1" style="text-align:center;" width="700">
		<tr style="background:lightblue;">
		<td><h4>이름</h4></td>
		<td><h4>아이디</h4></td>
		<td><h4>게시물 수</h4></td>
		</tr>
<%		
		try{
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pass);
		String sql = "select distinct name, id, count(review.title) from customer, review where id in (select review.writer from review) and customer.id = review.writer group by name, id";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery(); 	
			while(rs.next()){
%>
		<tr>
		<td><h4><%= rs.getString("name") %></h4></td>
		<td><h4><%= rs.getString("id") %></h4></td>
		<td><h4><%= rs.getInt(3) %></h4></td>
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
</div>
<hr>

<div>
<h1>회원 등급</h1>	<p>
<div style="float:right;">
<h5 style="color:red;">기본회원 : 브론즈 <br> 50000원 이상 구매 : 실버 <br> 200000원 이상 구매 : 골드</h5>
</div>
<p>
<table border="1" style="text-align:center;" width="700">
		<tr style="background:lightblue;">
		<td><h4>아이디</h4></td>
		<td><h4>등급</h4></td>
		</tr>
<%		
		try{
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pass);
		String sql = "select id, customer_grade(sum(totalprice)) from buy group by id";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery(); 	
			while(rs.next()){
%>
		<tr>
		<td><h4><%= rs.getString("id") %></h4></td>
		<td><h4><%= rs.getString(2) %></h4></td>
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
</div>
</center>
</body>
</html>