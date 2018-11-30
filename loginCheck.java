package dbproject;

import java.sql.*;

public class loginCheck {
	
	public static boolean pass(String id, String password)
	{
		String pw;
		
		Connection conn = DBUtil.getMySQLConnection();
		
		String sql = "select * from customer where id = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			pw = rs.getString("pw");
			DBUtil.close(rs);
			DBUtil.close(pstmt);
			DBUtil.close(conn);
			if(pw.equals(password))
				return true;
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return false;
	}

}
