<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>입력</title>
</head>
<body>
<h1>데이터 입력 완료</h1>
	<% 
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopo14","root","ykj0112");
		Statement stmt = conn.createStatement();
		stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values('경지',209901,95,100,95);");
		stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values('루비',209902,95,95,95);");
		stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values('까망',209903,100,100,100);");
		stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values('삐삐',209904,100,90,95);");
		stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values('쫑이',209905,80,100,70);");
		stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values('맹구',209906,100,100,70);");
		stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values('아슬란',209907,70,70,70);");
		stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values('파우수트스',209908,80,90,85);");
		stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values('망고',209909,88,85,95);");
		stmt.close();
		conn.close();
	}catch(Exception e){
		out.println("오류오류오류~");
	}
	%>

</body>
</html>