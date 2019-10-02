<meta http-equiv="Content-Type" content="text/8html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*" %>
<%@ page import="java.net.URLDecoder"%>

<!DOCTYPE html>
<html>
<head>
<title>특정자료 조회</title>
</head>
<body>
	<%
	try{
    String ckey = request.getParameter("member");
    String ckey2= URLDecoder.decode(ckey); 
    String sName= new String(ckey2.getBytes("8859_1"),"utf-8");
    String sKeyTemp = request.getParameter("studentID") ;
    int sKey = Integer.parseInt(sKeyTemp);
	
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopo14","root","ykj0112");
		Statement stmt = conn.createStatement();
		ResultSet rset = stmt.executeQuery("select * from examtable where studentid = '"+sKey+"' ;");
		
	%>
<%-- 	<h1>[<%=sName%>]자료 조회</h1> --%>
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
		conn.close();
	}catch(Exception e){
		out.println("데이터가 없어요");
	}
	%>
	</table>

</body>
</html>