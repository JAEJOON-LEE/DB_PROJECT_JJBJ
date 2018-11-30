package dbproject;

import java.sql.*;

public class DBUtil {
	
	public String id;

	public static Connection getMySQLConnection() {
		Connection conn = null;
		
		try {
			Class.forName("org.gjt.mm.mysql.Driver");
			String url = "jdbc:mysql://127.0.0.1:3306/PROJECT_JJBJ?useUnicode=true&characterEncoding=euckr";
			String user = "root";
			String password = "wowns3303!";
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e)
		{
			System.out.println("애러!");
		}
	
		return conn;
	}
	
	public static void close(Connection conn)
	{
		try {
			if(conn != null)
			{
				conn.close();
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public static void close(Statement stmt)
	{
		try {
			if(stmt != null)
			{
				stmt.close();
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public static void close(PreparedStatement pstmt)
	{
		try {
			if(pstmt != null)
			{
				pstmt.close();
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public static void close(ResultSet rs)
	{
		try {
			if(rs != null)
			{
				rs.close();
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
