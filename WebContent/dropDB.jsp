<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>삭제</title>
</head>
<body>
<h1>테이블 지우기 OK</h1>
	<% 
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopo14","root","ykj0112");
		Statement stmt = conn.createStatement();
		stmt.execute("drop table examtable;");
		stmt.close();
		conn.close();}catch(Exception e){
	    	out.println("테이블이 없어요");
	    }
	%>
</body>
</html>