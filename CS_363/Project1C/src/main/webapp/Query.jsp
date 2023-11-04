<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*, java.util.*,java.sql.*" %>
<!--<%@ page import="javax.servlet.http.*, javax.servlet.*" %>-->
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Query</title>
</head>
<body>

	<%!
	public void modifyRecordsOne(){
		String connectionURL = "jdbc:mysql://127.0.0.1:3306/?user=coms363";
		Connection connection = null;
		
		
		Statement stmt = null;
		
		try {			
			stmt = connection.createStatement();
			stmt.executeQuery("select students.snum, students.ssn from students where students.name = 'Becky';");
			ResultSet resultset = stmt.executeQuery("select students.snum, students.ssn from students where students.name = 'Becky';");
			stmt.executeBatch();
			
			
			System.out.println("Tables are modified");
			 
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error with in create table: "+ e.getMessage());
			e.printStackTrace();
		}
		
	}
	
	%>
	
	<%!
	public void modifyRecordsTwo(){
		String connectionURL = "jdbc:mysql://127.0.0.1:3306/?user=coms363";
		Connection connection = null;
		
		
		Statement stmt = null;
		
		try {			
			stmt = connection.createStatement();
			stmt.executeQuery("select degree.name, degree.level from degree, departments where degree.department_code = departments.code and departments.name = 'Computer Science';");
			 ResultSet resultset = stmt.executeQuery("select degree.name, degree.level from degree, departments where degree.department_code = departments.code and departments.name = 'Computer Science';");
			stmt.executeBatch();
			
			System.out.println("Tables are modified");
			 
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error with in create table: "+ e.getMessage());
			e.printStackTrace();
		}
	}
	
	%>
	
	<%!
	public void modifyRecordsThree(){
		String connectionURL = "jdbc:mysql://127.0.0.1:3306/?user=coms363";
		Connection connection = null;
		
		
		Statement stmt = null;
		
		try {			
			stmt = connection.createStatement();
			stmt.executeQuery("select degree.name, degree.level from degree, departments where degree.department_code = departments.code and (departments.name = 'Computer Science' or departments.name = 'Landscape Architect.');");
			ResultSet resultSet=stmt.executeQuery("select degree.name, degree.level from degree, departments where degree.department_code = departments.code and (departments.name = 'Computer Science' or departments.name = 'Landscape Architect.');");
			
			stmt.executeBatch();
			
			System.out.println("Tables are modified");
			 
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error with in create table: "+ e.getMessage());
			e.printStackTrace();
		}
	}
	
	%>
		<%
		String button1 = request.getParameter("button1");
		out.println("Click Submit To Modify Records");

		if ("Submit".equals(button1)) {
			modifyRecordsOne();
			String redirectURL = "QueryResult1.jsp";
			response.sendRedirect(redirectURL);
			
		}
	%>
	

	<form method="post">
		<input type="submit" name="button1" value="Submit" />
		
        <TABLE BORDER="1">
            <TR>
                <TH>ID</TH>
                <TH>Name</TH>
                <TH>City</TH>
                <TH>State</TH>
                <TH>Country</TH>
            </TR>
            <% while(resultset.next()){ %>
            <TR>
                <TD> <%= resultset.getString(1) %></td>
                <TD> <%= resultset.getString(2) %></TD>
                <TD> <%= resultset.getString(3) %></TD>
                <TD> <%= resultset.getString(4) %></TD>
                <TD> <%= resultset.getString(5) %></TD>
            </TR>
            <% } %>
	<%	
		String button2 = request.getParameter("button2");
		out.println("Click Submit To Modify Records");

		if ("Submit".equals(button2)) {
			modifyRecordsTwo();
			String redirectURL = "QueryResult2.jsp";
			response.sendRedirect(redirectURL);
		}
	%>

	<form method="post">
		<input type="submit" name="button2" value="Submit" />
		
	<%	String button3 = request.getParameter("button3");
		out.println("Click Submit To Modify Records");

		if ("Submit".equals(button3)) {
			modifyRecordsThree();
			String redirectURL = "QueryResult3.jsp";
			response.sendRedirect(redirectURL);
		}
	%>

	<form method="post">
		<input type="submit" name="button3" value="Submit" />

	</form>
</body>
</html>