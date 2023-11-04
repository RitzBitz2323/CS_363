<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*, java.util.*,java.sql.*" %>
<!--<%@ page import="javax.servlet.http.*, javax.servlet.*" %>-->
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Drop Records</title>
</head>
<body>

	<%!
	public void dropTables(){
		String connectionURL = "jdbc:mysql://127.0.0.1:3306/?user=coms363";
		Connection connection = null;
		
		
		Statement stmt = null;
		
		try {			
			stmt.addBatch("drop database project1a;\r\n");
			stmt.addBatch("create database if not exists project1a;");
			
			stmt.executeBatch();
			
			System.out.println("Tables are dropped");
			 
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error with in drop table: "+ e.getMessage());
			e.printStackTrace();
		}
	}
	
	%>
		<%
		String button = request.getParameter("button1");
		out.println("Click Submit To Drop Tables");

		if ("Submit".equals(button)) {
			dropTables();
		}
	%>

	<form method="post">
		<input type="submit" name="button1" value="Submit" />
		

	</form>
</body>
</html>