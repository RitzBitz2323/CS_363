package project1b;
import java.sql.*;
public class CreateTables {
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
