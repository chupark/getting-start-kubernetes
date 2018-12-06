<%@ page language="java" contentType="application/json; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>
<%@ page import ="java.sql.*" %>
<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rset = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://" + System.getenv("DB_URL");
		String id = System.getenv("DB_USER");
		String password = System.getenv("DB_PW");
		conn = DriverManager.getConnection(url,id,password);
		stmt = conn.createStatement();
		String sql = "SELECT SUM(cat), SUM(DOG) FROM vote";
		rset = stmt.executeQuery(sql);
		StringBuffer sb = new StringBuffer();
		while(rset.next()) {
			sb.append("{\"cat\":" + rset.getInt(1));
			sb.append(",");
			sb.append("\"dog\":" + rset.getInt(2) + "}");
		}
		out.println(sb.toString());
		rset.close();
		stmt.close();
		conn.close();
	} catch (SQLException se) {
		se.printStackTrace();
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (rset != null) { rset.close(); }
		if (stmt != null) { stmt.close(); }
		if (conn != null) { conn.close(); }
	}
%>