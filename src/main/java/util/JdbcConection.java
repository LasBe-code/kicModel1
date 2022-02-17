package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JdbcConection {
	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@kic_medium?TNS_ADMIN=/Users/lasbe/Wallet_kic";
			String user = "ADMIN";
			String password = "Thtlakstp0339";
			con = DriverManager.getConnection(url, user, password);
			
		} catch(Exception e){
			e.printStackTrace();
		}
		return con;
	}
	
	public static void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
		try {
			if(con != null) {
				con.close();
			}
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
//String url = "jdbc:oracle:thin:@kic_medium?TNS_ADMIN=/Users/lasbe/Wallet_kic";