<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*, java.util.*,java.sql.*" %>
<!--<%@ page import="javax.servlet.http.*, javax.servlet.*" %>-->
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Tables</title>
</head>
<body>

	<%!
	public void createTable(){
		String connectionURL = "jdbc:mysql://127.0.0.1:3306/?user=coms363";
		Connection connection = null;
		
		
		Statement stmt = null;
		
		try {			
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(connectionURL, "coms363", "password");
			stmt = connection.createStatement();
			stmt.addBatch("drop database if exists project1;");
			stmt.addBatch("create database project1;");
			stmt.addBatch("create table students (\r\n" +
					"  snum integer UNIQUE,\r\n " + 
				    "  ssn integer PRIMARY KEY,\r\n" +
				    "name varchar(10),\r\n" +
				    "gender varchar(1),\r\n" + 
				    "dob datetime, \r\n" +
				    "c_addr varchar(20),\r\n" + 
				    "c_phone varchar(10),\r\n" + 
				    "p_addr varchar(20),\r\n" +
				    "p_phone varchar(10)\r\n" +
				");");

				stmt.addBatch("create table departments(\r\n" +
					"code integer PRIMARY KEY,\r\n"+ 
				    "name varchar(50) UNIQUE,\r\n"+
				    "phone varchar(10),\r\n"+
				    "college varchar(20)\r\n"+
				 ");");

				stmt.addBatch("create table degree(\r\n"+
					"name varchar(50),\r\n"+
					"level varchar(5),\r\n"+
				    "department_code integer,\r\n"+
				    "primary key(name, level),\r\n"+
				    "foreign key(department_code) references departments(code)\r\n"+
				");");

				stmt.addBatch("create table courses(\r\n"+
					"number integer PRIMARY KEY,\r\n"+
				    "name varchar(50) UNIQUE,\r\n"+
				    "description varchar(50),\r\n"+
				    "credithours integer,\r\n"+ 
				    "level varchar(20),\r\n"+
				    "department_code integer,\r\n"+
				    "foreign key(department_code) references departments(code)\r\n"+
				    "ON DELETE CASCADE\r\n"+
				");");

				stmt.addBatch("create table register(\r\n"+
					"snum integer,\r\n"+ 
				    "course_number integer,\r\n"+ 
				    "regtime varchar(20),\r\n"+ 
				    "grade integer,\r\n"+
				    "primary key(snum, course_number),\r\n"+
				    "foreign key(snum) references students(snum),\r\n"+ 
				    "foreign key(course_number) references courses(number)\r\n"+
				");");

				stmt.addBatch("create table major(\r\n"+
					"snum integer,\r\n"+
				    "name varchar(50),\r\n"+
				    "level varchar(5),\r\n"+
				    "primary key(name, level, snum),\r\n"+
				    "foreign key (name, level) references degree(name, level),\r\n"+
				    "foreign key(snum) references students(snum)\r\n"+
				");");

				stmt.addBatch("create table minor(\r\n"+
						"snum integer,\r\n"+
					    "name varchar(50),\r\n"+
					    "level varchar(5),\r\n"+
					    "primary key(name, level, snum),\r\n"+
					    "foreign key (name, level) references degree(name, level),\r\n"+
					    "foreign key(snum) references students(snum)\r\n"+
					");");
			
			stmt.executeBatch();
			
			System.out.println("Tables are created");
			 
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error with in create table: "+ e.getMessage());
			e.printStackTrace();
		}
	}
	
	%>
		<%
		String button = request.getParameter("button1");
		out.println("Click Submit To Make Tables");

		if ("Submit".equals(button)) {
			createTable();
			String redirectURL = "CreateTablesResult.jsp";
			response.sendRedirect(redirectURL);
		}
	%>

	<form method="post">
		<input type="submit" name="button1" value="Submit" />

	</form>
</body>
</html>