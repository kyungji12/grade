<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>성적입력</title>
	</head>
	
	<body>
	<h1>성적 입력 추가</h1>
	
	<% 
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopo14","root","ykj0112");
		Statement stmt = conn.createStatement();
		
		int max=0;
		
		ResultSet rset = stmt.executeQuery("select * from examtable where studentid='209901';");
	    if(rset.next()){
         rset = stmt.executeQuery("select min(studentid+1) from examtable where (studentid+1) not in (select studentid from examtable);");
         rset.next();
         max = rset.getInt(1);
        }else{
	         max = 209901;
	      }
		
		//int NewId=0;
		
		//ResultSet rset = stmt.executeQuery("select max(studentid) from examtable;");
		//rset.next();
		//NewId=rset.getInt(1)+1; //가장 큰 학번 더하기 : 자동부여
		
		String iname = request.getParameter("insertName");
		String hanName = new String(iname.getBytes("8859_1"),"UTF-8"); 
		
		stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values('"+
					hanName+"',"+max+","+request.getParameter("korean")+
					","+request.getParameter("english")+","+request.getParameter("mathematic")+");");
		
		
		ResultSet rset2 = stmt.executeQuery("select * from examtable where studentid ='"+max+"';");
		rset2.next();
	%>
		<FORM METHOD=POST action='inputForm1.html' min="0" max="100">
		<table border=0 cellspacing=0 cellpadding=5>
			<tr>
			<td width=240></td>
			<td align=right><input type="submit" value="뒤로가기"></td>
			</tr>
		</table>
				
		<table border=1 cellspacing=0 cellpadding=5>
			<tr>
			<td bgcolor=#9999ff>이름</td>
			<td><input type=text name=sName size=30 maxlength=30 value=<%=rset2.getString(1)%>></td>
		</tr>
		<tr>
			<td bgcolor=#9999ff>학번</td>
			<td><input type=number name=NewId size=30 maxlength=30 value=<%=Integer.toString(rset2.getInt(2)) %>></td>
		</tr>
		<tr>
			<td bgcolor=#9999ff>국어</td>
			<td><input type=number name=korean size=30 min="0" max="100" value=<%=Integer.toString(rset2.getInt(3)) %>></td>
		</tr>
		<tr>
			<td bgcolor=#9999ff>영어</td>
			<td><input type=number name=english size=30 min="0" max="100" value=<%=Integer.toString(rset2.getInt(4)) %>></td>
		</tr>
		<tr>
			<td bgcolor=#9999ff>수학</td>
			<td><input type=number name=mathematics size=30 min="0" max="100" value=<%=Integer.toString(rset2.getInt(5)) %>></td>
		</tr>
		
		</FORM>
		</table>
	<%rset.close();
	stmt.close();
	conn.close();}catch(Exception e){
    	out.println("오류오류오류");
    } %>
	</body>
</html>