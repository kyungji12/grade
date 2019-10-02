<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*" %>
<%@ page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등수 조회</title>
</head>
<body>
<h1>등수 조회 </h1>
<% 
    try{
	String name;
    String ckey;
    int sID;
    	//연결
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopo14","root","ykj0112");
		Statement stmt = conn.createStatement();
		ResultSet rset = stmt.executeQuery("select name, studentid, kor, eng, mat, (kor+eng+mat)AS sum, ROUND(((kor+eng+mat)/3),2) AS avg, rank "+
                "from (select name, studentid, kor, eng, mat, (kor+eng+mat), ROUND(((kor+eng+mat)/3),2), "+ 
                "CASE WHEN @prev_value = ROUND(((kor+eng+mat)/3),2) "+
                "THEN @vRank "+
                "WHEN @prev_value := ROUND(((kor+eng+mat)/3),2) "+
                "THEN @vRank := @vRank + 1 END AS rank "+
                "FROM "+
                "examtable AS p, "+
                "(SELECT @vRank := 0, @prev_value := NULL) AS r "+
                "ORDER BY ROUND(((kor+eng+mat)/3),2) DESC) AS CNT;");
		
		
	%>
	<table width=300 border=1>
		<tr>
			<td width=40 bgcolor=#9999ff><p align=center>이름</p></td>
			<td width=30 bgcolor=#9999ff><p align=center>학번</p></td>
			<td width=30 bgcolor=#9999ff><p align=center>등수</p></td>
	<%
		while(rset.next()){
			sID = rset.getInt(2); //학번
			name = rset.getString(1);				//이름
			ckey = URLEncoder.encode(name, "utf-8");//이름 한글 처리
			
			out.println("<tr>");
			out.println("<td width=40><p align=center>"+rset.getString(1)+"</p></td>");
			out.println("<td width=30><p align=center>"+Integer.toString(rset.getInt(2))+"</p></td>");
			out.println("<td width=30><p align=center>"+rset.getInt(8)+"</p></td>");
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

