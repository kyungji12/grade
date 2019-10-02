<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ page contentType="text/html; charset=utf-8" %> --%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*" %>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.util.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopo14","root","ykj0112");
	Statement stmt = conn.createStatement();	
	
	ResultSet rset = stmt.executeQuery("select *from examtable;");
		
	out.println("[");
	while(rset.next()){
	String name = rset.getString(1);
	int studentid = rset.getInt(2);
	int kor = rset.getInt(3);
	int eng = rset.getInt(4);
	int mat = rset.getInt(5);
	out.println("{");
	out.println("\"name\": \""+name+"\",");
	out.println("\"studentid\": \""+studentid+"\",");
	out.println("\"kor\": \""+kor+"\",");
	out.println("\"eng\": \""+eng+"\",");
	out.println("\"mat\": \""+mat+"\"}");	
		if(rset.isLast()){
			out.print("]");	
		}else{
			out.print(", ");
		}
	}
	stmt.close();
	conn.close();
%>

