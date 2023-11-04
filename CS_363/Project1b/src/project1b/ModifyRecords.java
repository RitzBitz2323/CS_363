package project1b;
import java.sql.*;
public class ModifyRecords {
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
			stmt.executeQuery("select * from students where ssn = '746897816';\r\n" +"update students set name = 'Scott' where ssn = '746897816';");
			stmt.executeQuery("select * from register where regtime = 'Spring2020';\r\n" +"delete from register where regtime = 'Spring2020';");
			stmt.executeQuery("SET SQL_SAFE_UPDATES=0;");
			stmt.executeQuery("select snum from students where ssn = '746897816';\r\n" +"update major set name = 'Computer Science';\r\n"+"update major set level = 'MS';" );
		
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
