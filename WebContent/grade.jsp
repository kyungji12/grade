<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*" %>
<%@ page import="java.net.URLEncoder"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적 조회</title>
</head>
<body>
<h1>총점과 평균 조회 </h1>
<% 
    try{
	String name;
    String ckey;
    int sID;
    int sum;
    double ave;
    
    	//연결
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopo14","root","ykj0112");
		Statement stmt = conn.createStatement();
		ResultSet rset = stmt.executeQuery("select * from examtable;");
	%>
	<table width=400 border=1>
		<tr>
			<td width=70 bgcolor=#9999ff><p align=center>이름</p></td>
			<td width=30 bgcolor=#9999ff><p align=center>학번</p></td>
			<td width=30 bgcolor=#9999ff><p align=center>국어</p></td>
			<td width=30 bgcolor=#9999ff><p align=center>영어</p></td>
			<td width=30 bgcolor=#9999ff><p align=center>수학</p></td>
			<td width=30 bgcolor=#9999ff><p align=center>총점</p></td>
			<td width=30 bgcolor=#9999ff><p align=center>평균</p></td>
		</tr>
	<%
		while(rset.next()){
			sID = rset.getInt(2); //학번
			name = rset.getString(1);				//이름
			ckey = URLEncoder.encode(name, "utf-8");//이름 한글 처리
			sum = (rset.getInt(3)+rset.getInt(4)+rset.getInt(5));
			ave = Math.round(((rset.getInt(3)+rset.getInt(4)+rset.getInt(5))/3.0)*100)/100.0;
			
			out.println("<tr>");
			out.println("<td width=70><p align=center>"+rset.getString(1)+"</a></a></p></td>");
			out.println("<td width=30><p align=center>"+Integer.toString(rset.getInt(2))+"</p></td>");
			out.println("<td width=30><p align=center>"+Integer.toString(rset.getInt(3))+"</p></td>");
			out.println("<td width=30><p align=center>"+Integer.toString(rset.getInt(4))+"</p></td>");
			out.println("<td width=30><p align=center>"+Integer.toString(rset.getInt(5))+"</p></td>");
			out.println("<td width=30><p align=center>"+sum+"</p></td>");
			out.println("<td width=30><p align=center>"+ave+"</p></td>");
			out.println("</tr>");
			
		}
		rset.close();
		stmt.close();
		conn.close();
    }catch(Exception e){
    	out.println("테이블이 없어요");
    }
	%>
	</table>
</body>
</html>

