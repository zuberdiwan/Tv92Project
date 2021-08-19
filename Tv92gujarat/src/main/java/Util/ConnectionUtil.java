package Util;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionUtil {
	public static Connection getConnection(String dta,String host) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://"+host+":3306/"+dta+"?useUnicode=yes&characterEncoding=UTF-8","root","root");
			return con;
		}catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			System.out.println("databases");
			return null;
		} 
		
	}
}
