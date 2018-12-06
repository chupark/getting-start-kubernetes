<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>
<%@ page import = "java.sql.*" %>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	Connection conn = null;
	Statement stmt = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		
		String url = "jdbc:mysql://" + System.getenv("DB_URL");
		String id = System.getenv("DB_USER");
		String password = System.getenv("DB_PW");
		
		String animal = request.getParameter("animal");
		
		conn = DriverManager.getConnection(url,id,password);
		stmt = conn.createStatement();
		
		String sql = "INSERT INTO vote (" + animal + ") VALUES ('1')";
		stmt.execute(sql);			
		stmt.close();
		conn.close();
	} catch (SQLException se) {
		se.printStackTrace();
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (stmt != null ) { stmt.close(); }
		if (conn != null ) { conn.close(); }
	}
%>
</body>
</html>