package DB;

import java.sql.*;

public class Connect {
	public static Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe", "jinhyo", "1234");
		return con;
	}
}
