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

	Connection conn = DBUtil.getMySQLConnection();
	
	//아이디 비번 주소 성별 나이 직업 매장번
	String sql = "update TOTAL set AQ = AQ + 100";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.executeUpdate();

	DBUtil.close(pstmt);
	DBUtil.close(conn);

	response.sendRedirect("checkQuant.jsp");
%>

</body>
</html>
