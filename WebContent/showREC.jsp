<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적 조회후 정정/삭제용 조회</title>
</head>
<body>
	<h1>성적 조회 후 정정/삭제</h1>
	
	<% 
	try{
	String searchID = request.getParameter("searchID");
	int searchKey = Integer.parseInt(searchID);
	
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopo14","root","ykj0112");
		Statement stmt = conn.createStatement();
		ResultSet rset = stmt.executeQuery("select * from examtable where studentid ='"+searchKey+"';");
		

	while(rset.next()){
		
		out.println("<FORM METHOD=POST action='inputForm2.html'>");
		out.println("<table border=0 cellspacing=0 cellpadding=5>");
		out.println("<tr><td width=240></td>");
		out.println("<td align=right><input type='submit' value='뒤로가기'></td>");
		out.println("</tr></table>");
		out.println("<table border=1 cellspacing=0 cellpadding=5><tr>");
		out.println("<td bgcolor='#9999ff'>이름</td>");
		out.println("<td><input type='hidden' name='sName' size='35' maxlength='30' value='"+rset.getString(1)+"'>"+rset.getString(1)+"</td>");
		out.println("</tr><tr>");
		out.println("<td bgcolor=#9999ff>학번</td>");
		out.println("<td><input type=hidden name='showID' size=35 maxlength=30 value='"+Integer.toString(rset.getInt(2))+"'>"+Integer.toString(rset.getInt(2))+"</td>");
		out.println("</tr><tr>");
		out.println("<td bgcolor=#9999ff>국어</td>");
		out.println("<td><input type=number name=korean size=35 min=0 max=100 value='"+Integer.toString(rset.getInt(3))+"'></td>");
		out.println("</tr><tr>");
		out.println("<td bgcolor=#9999ff>영어</td>");
		out.println("<td><input type=number name=english size=35 min=0 max=100 value='"+Integer.toString(rset.getInt(4))+"'></td>");
		out.println("</tr><tr>");
		out.println("<td bgcolor=#9999ff>수학</td>");
		out.println("<td><input type=number name=mathematics size=35 min=0 max=100 value='"+Integer.toString(rset.getInt(5))+"'></td>");
		out.println("</tr></table>");
		out.println("<table border=0 cellspacing=0 cellpadding=5>");
		out.println("<td width=220></td>");
		out.println("<td><input type='submit' formaction='updateDB.jsp' value='수정'></td>");
		out.println("<td><input type='submit' formaction='deleteDB.jsp' value='삭제'></td>");
		out.println("</table></FORM>");
				
	}
	 rset.close();
	stmt.close();
	conn.close();
	}catch (Exception e){ 
	out.println("해당학번이없습니다.");}%>
	</body>
</html>