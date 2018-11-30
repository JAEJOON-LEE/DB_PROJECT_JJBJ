<%@ page import = "java.sql.*"%>
<%@ page import = "dbproject.DBUtil"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	int id = Integer.parseInt(request.getParameter("u_id"));
	String password = request.getParameter("pwd");
	String phone = request.getParameter("C_hp");
	String address = request.getParameter("C_ad");
	String sex = request.getParameter("C_sex");
	int age = Integer.parseInt(request.getParameter("C_age"));
	String job = request.getParameter("C_job");
	String ip = request.getParameter("ip");
	
	Connection conn = DBUtil.getMySQLConnection();
	
	//아이디 비번 주소 성별 나이 직업 매장번
	String sql = "insert into customer (id, pw, hp, address, sex, age, job, order_count, retailer_num) values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setInt(1, id);
	pstmt.setString(2, password);
	pstmt.setString(3, phone);
	pstmt.setString(4, address);
	pstmt.setString(5, sex);
	pstmt.setInt(6, age);
	pstmt.setString(7, job);
	pstmt.setInt(8, 0);
	pstmt.setInt(9, 1);
	
	pstmt.executeUpdate();

	DBUtil.close(pstmt);
	DBUtil.close(conn);

%>

</body>
</html>

--------------------

<%@ page import = "java.sql.*"%>
<%@ page import = "dbproject.DBUtil"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	int id = Integer.parseInt(request.getParameter("u_id"));
	String password = request.getParameter("pwd");
	String phone = request.getParameter("C_hp");
	String address = request.getParameter("C_ad");
	String sex = request.getParameter("C_sex");
	int age = Integer.parseInt(request.getParameter("C_age"));
	String job = request.getParameter("C_job");
	
	session.setAttribute("C_age", age);
	
	Connection conn = DBUtil.getMySQLConnection();
	
	//아이디 비번 주소 성별 나이 직업 매장번
	String sql = "insert into customer (id, pw, hp, address, sex, age, job, order_count, retailer_num) values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setInt(1, id);
	pstmt.setString(2, password);
	pstmt.setString(3, phone);
	pstmt.setString(4, address);
	pstmt.setString(5, sex);
	pstmt.setInt(6, age);
	pstmt.setString(7, job);
	pstmt.setInt(8, 0);
	pstmt.setInt(9, 1);
	
	pstmt.executeUpdate();

	DBUtil.close(pstmt);
	DBUtil.close(conn);

	response.sendRedirect("main.jsp");
%>

</body>
</html>
