package project1b;
import java.sql.*;
public class Query {
	private static Connection connect = null;

	public static void main(String[] args) 
	{

		try {
			//Set up connection parameters
			String userName = "coms363";
			String password = "password";
			String dbServer = "jdbc:mysql://localhost:3306/project1b";
			//String dbServer = "jdbc:mysql://mysql.cs.iastate.edu/[schema]";
			//Set up connection
			connect = DriverManager.getConnection(dbServer,userName,password);
		} catch(Exception e) {

		}

		Statement stmt = null;
		try {
			stmt = connect.createStatement();
			stmt.executeQuery("select students.snum, students.ssn from students where students.name = 'Becky';");
			stmt.executeQuery("select courses.name from courses, departments where courses.department_code = departments.code and departments.name = 'Computer Science';");
			stmt.executeQuery("select degree.name, degree.level from degree, departments where degree.department_code = departments.code and departments.name = 'Computer Science';");
			stmt.executeQuery("select students.name from minor, students where minor.snum = students.snum;");
			stmt.executeQuery("select students.name from minor, students where minor.snum = students.snum;");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try {
			
			stmt.executeBatch();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				// Close connection
				if (stmt != null) {
					stmt.close();
				}
				if (connect != null) {
					connect.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
