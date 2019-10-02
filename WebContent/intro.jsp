<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		<h2>JSP Database 실습1</h2>
		<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopo14","root","ykj0112");
		Statement stmt = conn.createStatement();
		
		stmt.execute("update counter set cntcnt=(cntcnt+1);");
		
		ResultSet rset = stmt.executeQuery("select * from counter;");
		while(rset.next()){
			out.println("<br>현재 홈페이지 방문 조회수는 ["+rset.getInt(1)+"]입니다.</br>");
		}
		%>
	<br></br>
	<img src="http://n.sinaimg.cn/sinacn20/523/w440h4083/20180411/1de3-fyzeyqa6778411.jpg">
	
	</body>
</html>


