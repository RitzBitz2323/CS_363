<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*, java.util.*,java.sql.*" %>
<!--<%@ page import="javax.servlet.http.*, javax.servlet.*" %>-->
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert Records</title>
</head>
<body>

	<%!
	public void insertRecords(){
		String connectionURL = "jdbc:mysql://127.0.0.1:3306/?user=coms363";
		Connection connection = null;
		
		
		Statement stmt = null;
		
		try {			
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(connectionURL, "coms363", "password");
				stmt = connection.createStatement();
				
				stmt.addBatch("INSERT INTO students" + "VALUES(1001, 654651234, 'Randy', 'M', '2000/12/01','301 E Hall',5152700988, '121 Main' ,708306632)");
				stmt.addBatch("INSERT INTO students" + "VALUES(1002, 123097834, 'Victor', 'M', '2000/05/06','270 W Hall',5151234578, '702 Walnut' ,7080366333)");
				stmt.addBatch("INSERT INTO students" + "VALUES(1003, 978012431, 'John', 'M', '1999/07/08','201 W Hall',5154132805, '888 University' ,5152012011)");
				stmt.addBatch("INSERT INTO students" + "VALUES(1004, 746897816, 'Seth', 'M', '1998/12/30','199 N Hall',5158891504, '21 Green' ,5154132907)");
				stmt.addBatch("INSERT INTO students" + "VALUES(1005, 186032894, 'Nicole', 'F', '2000/04/01','178 S Hall',5158891155, '13 Gray' ,5157162071)");
				stmt.addBatch("INSERT INTO students " +"VALUES(1006, 534218752, 'Becky', 'F', '2000/05/16','12 N Hall',5157083698, '189 Clark' ,2034367632)");
				stmt.addBatch("INSERT INTO students " +"VALUES(1007, 432609519, 'Kevin', 'M', '2000/08/12','75 E Hall',5157082497, '89 National' ,7182340772)");
				
				stmt.addBatch("INSERT INTO departments" + "VALUES(401, 'Computer Science', 5152982801, 'LAS')");
				stmt.addBatch("INSERT INTO departments" + "VALUES(402, 'Mathematics', 5152982802, 'LAS')");
				stmt.addBatch("INSERT INTO departments"+"VALUES(403, 'Chemical Engineering', 5152982803, 'Engineering')");
				stmt.addBatch("INSERT INTO departments"+"VALUES(404, 'Landscape Architect', 5152982804, 'Design')");
				
				stmt.addBatch("INSERT INTO degree" + "VALUES('Computer Science', 'BS', 401)");
				stmt.addBatch("INSERT INTO degree" + "VALUES('Software Engineering', 'BS', 401)");
				stmt.addBatch("INSERT INTO degree" + "VALUES('Computer Science', 'MS', 401)");
				stmt.addBatch("INSERT INTO degree" + "VALUES('Computer Science', 'PhD', 401)");
				stmt.addBatch("INSERT INTO degree"+"VALUES('Applied Mathematics', 'MS', 402)");
				stmt.addBatch("INSERT INTO degree"+" VALUES('Chemical Engineering', 'BS', 403)");
				stmt.addBatch("INSERT INTO degree"+" VALUES('Landscape Architect', 'BS', 404)");
				
				stmt.addBatch("INSERT INTO major"+"VALUES(1001, 'Computer Science', 'BS')");
				stmt.addBatch("INSERT INTO major"+"VALUES(1002, 'Software Engineering', 'BS')");
				stmt.addBatch("INSERT INTO major" + "VALUES(1003, 'Chemical Engineering', 'BS')");
				stmt.addBatch("INSERT INTO major" + "VALUES(1004, 'Landscape Architect', 'BS')");
				stmt.addBatch("INSERT INTO major"+"VALUES(1005, 'Computer Science', 'MS')");
				stmt.addBatch("INSERT INTO major"+"VALUES(1006, 'Applied Mathematics', 'MS')");
				stmt.addBatch("INSERT INTO major"+"VALUES(1007, 'Computer Science', 'PhD')");
				
				stmt.addBatch("INSERT INTO minor"+"VALUES(1007, 'Applied Mathematics', 'MS')");
				stmt.addBatch("INSERT INTO minor"+"VALUES(1005, 'Applied Mathematics', 'MS')");
				stmt.addBatch("INSERT INTO minor"+"VALUES(1001, 'Software Engineering', 'BS')");
				
				stmt.addBatch("INSERT INTO courses(number, name, description, credithours, level, department_code )" + "VALUES(113, 'Spreadsheet', 'Microsoft Excel and Access', 3, 'Undergraduate', 401), VALUES(311, 'Algorithm', 'Design and Analysis', 3, 'Undergraduate', 401), VALUES(531, 'Theory of Computation', 'Theorem and Probability', 3, 'Graduate', 401), VALUES(363, 'Database', 'Design Principle', 3, 'Undergraduate', 401), VALUES(412, 'Water Management', 'Water Management', 3, 'Undergraduate', 404), VALUES(228, 'Special Topics', 'Interesting Topics about CE', 3, 'Undergraduate', 403), VALUES(101, 'Calculus', 'Limit and Derivative', 4, 'Undergraduate', 402)");
				
				stmt.addBatch("INSERT INTO register"+"VALUES(1001, 363, 'Fall2020', 3)");
				stmt.addBatch("INSERT INTO register"+" VALUES(1002, 311, 'Fall2020', 4)");
				stmt.addBatch("INSERT INTO register"+" VALUES(1003, 228, 'Fall2020', 4)");
				stmt.addBatch("INSERT INTO register "+"VALUES(1004, 363, 'Spring2021', 3)");
				stmt.addBatch("INSERT INTO register "+"VALUES(1005, 531, 'Spring2021', 4)");
				stmt.addBatch("INSERT INTO register "+"VALUES(1006, 363, 'Fall2020', 3)");
				stmt.addBatch("INSERT INTO register "+"VALUES(1007, 531, 'Spring2021', 4)");
			
			stmt.executeBatch();
			
			System.out.println("Tables have been inserted");
			 
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error with in insert records: "+ e.getMessage());
			e.printStackTrace();
		}
	}
	
	%>
		<%
		String button = request.getParameter("button1");
		out.println("Click Submit To Insert Records");

		if ("Submit".equals(button)) {
			insertRecords();
			String redirectURL = "InsertRecordsResult.jsp";
			response.sendRedirect(redirectURL);
		}
	%>

	<form method="post">
		<input type="submit" name="button1" value="Submit" />

	</form>
</body>
</html>