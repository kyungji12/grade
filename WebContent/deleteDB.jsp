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
<h1>레코드 삭제 완료</h1>
	<% 
	try{
	String deleteID = request.getParameter("showID");
	int deleteKey = Integer.parseInt(deleteID);
	
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopo14","root","ykj0112");
		Statement stmt = conn.createStatement();
		stmt.execute("delete from examtable where studentid = '"+deleteKey+"' ;");
		
		ResultSet rset = stmt.executeQuery("select * from examtable;");
	%>
	<table cellspacing=1 width=600 border=1>
		<tr>
			<td width=50 bgcolor=#9999ff><p align=center>이름</p></td>
			<td width=50 bgcolor=#9999ff><p align=center>학번</p></td>
			<td width=50 bgcolor=#9999ff><p align=center>국어</p></td>
			<td width=50 bgcolor=#9999ff><p align=center>영어</p></td>
			<td width=50 bgcolor=#9999ff><p align=center>수학</p></td>
		</tr>
	<%
		while(rset.next()){
			
			out.println("<tr>");
			out.println("<td width=50><p align=center>"+rset.getString(1)+"</p></td>");
			out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(2))+"</p></td>");
			out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(3))+"</p></td>");
			out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(4))+"</p></td>");
			out.println("<td width=50><p align=center>"+Integer.toString(rset.getInt(5))+"</p></td>");
			out.println("</tr>");
			
		}
		rset.close();
		stmt.close();
		conn.close();}catch(Exception e){
	    	out.println("테이블이 없어요");
	    }
	%>
	</table>
</body>
</html>