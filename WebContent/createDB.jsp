<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>생성</title>
</head>
<body>
<h1>테이블 만들기</h1>
	<% 
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopo14","root","ykj0112");
		Statement stmt = conn.createStatement();
		stmt.execute("create table examtable("+
											"name varchar(20),"+
											"studentid int not null primary key,"+
											"kor int,"+
											"eng int,"+
											"mat int) DEFAULT CHARSET=utf8;");
		stmt.close();
		conn.close();
	}catch(Exception e){
		out.println("테이블이 이미 생성되어있습니다.");
	}
		%>
		
</body>
</html>