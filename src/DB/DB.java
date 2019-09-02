package DB;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DB {
	public static Connection getConn() throws SQLException{
		Connection conn=null;
		try {
			 Class.forName("oracle.jdbc.driver.OracleDriver");
			 String url = "jdbc:oracle:thin:@10.96.124.214:1521:xe";
			 conn = DriverManager.getConnection(url, "PROJECT3613", "1234");
			 System.out.println("Oracle jdbc test: connect ok!!");
		     return conn;
			} catch(Exception e) {
			  System.out.println(e.getMessage());
			  return null;
			}//catch
	}
}
