<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>레코드 정정 완료</title>
	</head>
	
	<body>
		<h1>레코드 정정 완료</h1>
		<%
		try{
		//연결
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopo14","root","ykj0112");
		Statement stmt = conn.createStatement();
		
		//값 받아오기
		String uName = request.getParameter("sName");
		String uName2 = new String(uName.getBytes("8859_1"),"UTF-8");
		
		String uID = request.getParameter("showID");
		int uID2 = Integer.parseInt(uID);
		
		String uKor = request.getParameter("korean");
		int uKor2 = Integer.parseInt(uKor);
		
		String uEng = request.getParameter("english");
		int uEng2 = Integer.parseInt(uEng);
		
		String uMat = request.getParameter("mathematics");
		int uMat2 = Integer.parseInt(uMat);
		
		//수정 처리
		stmt.execute("UPDATE examtable SET kor = "+uKor2+", eng = "+uEng2+", mat = "+ uMat2+" where studentid ="+ uID2 +";");
		
		//자료 조회
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
			if(rset.getInt(2) == uID2){
				out.println("<tr bgcolor=lavender>");
			}else{
			out.println("<tr>");}
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