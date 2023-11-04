<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*, java.util.*,java.sql.*" %>
<!--<%@ page import="javax.servlet.http.*, javax.servlet.*" %>-->
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Modify Records</title>
</head>
<body>

	<%!
	public void modifyRecords(){
		String connectionURL = "jdbc:mysql://127.0.0.1:3306/?user=coms363";
		Connection connection = null;
		
		
		Statement stmt = null;
		
		try {			
			stmt = connection.createStatement();
			stmt.executeQuery("select * from students where ssn = '746897816';\r\n" +"update students set name = 'Scott' where ssn = '746897816';");
			
			
			stmt.executeBatch();
			
			System.out.println("Tables are modified");
			 
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error with in modify records: "+ e.getMessage());
			e.printStackTrace();
		}
	}
	
	%>
		<%
		String button = request.getParameter("button1");
		out.println("Click Submit To Modify Records");

		if ("Submit".equals(button)) {
			modifyRecords();
			String redirectURL = "ModifyRecordResult.jsp";
			response.sendRedirect(redirectURL);
		}
	%>

	<form method="post">
		<input type="submit" name="button1" value="Submit" />

	</form>
</body>
</html>