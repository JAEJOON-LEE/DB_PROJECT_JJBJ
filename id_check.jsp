<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.util.TreeMap" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "dbproject.DBUtil"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />

<% request.setCharacterEncoding("utf-8"); %>

<title>회원확인</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	TreeMap< String, String > Members = new TreeMap< String, String >();
	
	String id = request.getParameter("M_id");
	String pw = request.getParameter("M_pw");
	
	Connection conn = DBUtil.getMySQLConnection();
	
	String sql = "select * from customer where id = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, id);
	ResultSet rs = pstmt.executeQuery();
	String password;
	rs.next();
	password = rs.getString("pw");
	
	DBUtil.close(rs);
	DBUtil.close(pstmt);
	DBUtil.close(conn);
	
	if(password.equals(pw))
	{
		out.println("<script>");
		out.println("alert('로그인 되었습니다. 환영합니다.')");
		response.sendRedirect("shop.jsp");
		out.println("</script>");
	}
	else
	{
		out.println("<script>");
		out.println("alert('회원 정보가 일치하지 않습니다.')");
		response.sendRedirect("donthaveID.jsp");
		out.println("</script>");
	}
%>
</body>
</html>

------------------

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.util.TreeMap" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "dbproject.DBUtil"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />

<% request.setCharacterEncoding("UTF-8"); %>

<title>회원확인</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	//TreeMap< String, String > Members = new TreeMap< String, String >();
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	session.setAttribute("id",id);
	session.setAttribute("pw",pw);
	
	Connection conn = DBUtil.getMySQLConnection();
	
	//String sql = "select COUNT(*) from customer where id = ?";
	//PreparedStatement pstmt = conn.prepareStatement(sql);
	//pstmt.setString(1, id);
	//ResultSet rs = pstmt.executeQuery();
	//int count = Integer.parseInt(rs.getString(1));
	
	String sql = "select * from customer where id = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	boolean tmp = false;
	pstmt.setString(1, id);
	ResultSet rs = pstmt.executeQuery();
	String password;
	
	if(rs.next())
		tmp = true;
	
	if(tmp==true)
		password = rs.getString("pw");
	else
		password = "error";
	
	DBUtil.close(rs);
	DBUtil.close(pstmt);
//	DBUtil.close(rs2);
//	DBUtil.close(pstmt2);
	DBUtil.close(conn);
	
//	if(count == 0)
//	{
//		response.sendRedirect("donthaveID.jsp");
//	}
	
	if(tmp == true)
	{
	if(password.equals(pw))
	{
		//out.println("<script>");
		//out.println("alert('로그인 되었습니다. 환영합니다.')");
		//out.println("location.href='main.jsp");
		response.sendRedirect("shop.jsp");
		//out.println("</script>");
	}
	else
	{
		response.sendRedirect("donthaveID.jsp");
	}
	}
	else
	{
		response.sendRedirect("donthaveID.jsp");
	}
%>
</body>
</html>

-----------------------

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.util.TreeMap" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "dbproject.DBUtil"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />

<% request.setCharacterEncoding("UTF-8"); %>

<title>회원확인</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	//TreeMap< String, String > Members = new TreeMap< String, String >();
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	session.setAttribute("id",id);
	session.setAttribute("pw",pw);
	
	Connection conn = DBUtil.getMySQLConnection();
	
	//String sql = "select COUNT(*) from customer where id = ?";
	//PreparedStatement pstmt = conn.prepareStatement(sql);
	//pstmt.setString(1, id);
	//ResultSet rs = pstmt.executeQuery();
	//int count = Integer.parseInt(rs.getString(1));
	
	String sql = "select * from customer where id = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	boolean tmp = false;
	pstmt.setString(1, id);
	ResultSet rs = pstmt.executeQuery();
	String password;
	
	if(rs.next())
		tmp = true;
	
	if(tmp==true)
		password = rs.getString("pw");
	else
		password = "error";
	
	DBUtil.close(rs);
	DBUtil.close(pstmt);
//	DBUtil.close(rs2);
//	DBUtil.close(pstmt2);
	DBUtil.close(conn);
	
//	if(count == 0)
//	{
//		response.sendRedirect("donthaveID.jsp");
//	}
	
	if(tmp == true)
	{
	if(password.equals(pw))
	{
		if(id.equals("119"))
			response.sendRedirect("onlyManager.jsp");
		else
			response.sendRedirect("shop.jsp");
	}
	else
	{
		response.sendRedirect("donthaveID.jsp");
	}
	}
	else
	{
		response.sendRedirect("donthaveID.jsp");
	}
%>
</body>
</html>
