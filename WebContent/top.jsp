<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
}

.navbar {
  overflow: hidden;
  background-color: lightpink;
  height: 100px; 
  width: 1250px;

}

.navbar a {
  float: left;
  font-size: 16px;
  color: gray;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

.dropdown {
  float: left;
  overflow: hidden;
}

.dropdown .dropbtn {
  font-size: 16px;  
  border: none;
  outline: none;
  color: gray;
  padding: 14px 16px;
  background-color: lightpink;
  font-family: inherit;
  margin: 0;
}

.navbar a:hover, .dropdown:hover .dropbtn {
  background-color: white;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  float: none;
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown-content a:hover {
  background-color: #ddd;
}

.dropdown:hover .dropdown-content {
  display: block;
}
</style>
</head>
<body>
<center>
<a href="index.jsp"><img src="img/logo.png"></a>
</center>
<div class="navbar" align="center">
  <a href="join.jsp">JOIN</a>
  <a href="login.jsp">LOGIN</a>
  <div class="dropdown">
    <button class="dropbtn"><a href="menu.jsp">MENU</a> 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="icecream.jsp">ICECREAM</a>
      <a href="drink.jsp">DRINK</a>
      <a href="etc.jsp">ETC.</a>
    </div>
    </div>
    <a href="board.jsp">BOARD</a>
 
<% if(session.getAttribute("id")!=null){
	  	out.print("<h4 style='text-align:right'>"+session.getAttribute("id")+"님 환영합니다");
%>
	<form action="logout.jsp">
	<input type="submit" value="로그아웃">
	<input type="button" value="내 정보" onclick="location.href='mypage.jsp'">
	</h4>
<% 	
  		}
	  
%>
</form>
</div>
</body>
</html>