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
	String sql;
	Connection conn = DBUtil.getMySQLConnection();
	PreparedStatement pstmt;
	
	String id = (String)session.getAttribute("id");
	String password = request.getParameter("pwd");
	String pwcheck = request.getParameter("pwd_check");
	
	String phone = request.getParameter("C_hp");
	
	String address = request.getParameter("C_ad");
	
	String sex = request.getParameter("C_sex");
	
	String age = request.getParameter("C_age");
	
	String job = request.getParameter("C_job");
	
	if(password.length() > 0 && pwcheck.length() > 0)
	{
  		if(password.equals(pwcheck))
		{
		  sql = "update customer set pw = '" + password + "' where id =" + id;
		  pstmt = conn.prepareStatement(sql);
		  pstmt.executeUpdate();
		}
  		else
  		{
  			out.println("비밀번호를 확인해주세요.");
  		}
	}
	if(phone.length() > 0)
	{
	  sql = "update customer set hp = '" + phone + "' where id =" + id;
	  pstmt = conn.prepareStatement(sql);
	  pstmt.executeUpdate();
	}
	if(address.length() > 0)
	{
	  sql = "update customer set address = '" + address + "' where id =" + id;
	  pstmt = conn.prepareStatement(sql);
	  pstmt.executeUpdate();
	}
	if(sex.length() > 0)
	{
	  sql = "update customer set sex = '" + sex + "' where id =" + id;
	  pstmt = conn.prepareStatement(sql);
	  pstmt.executeUpdate();
	}
	if(age.length() > 0)
	{
	  sql = "update customer set age = '" + age + "' where id =" + id;
	  pstmt = conn.prepareStatement(sql);
	  pstmt.executeUpdate();
	}
	if(job.length() > 0)
	{
	  sql = "update customer set job = '" + job + "' where id =" + id;
	  pstmt = conn.prepareStatement(sql);
	  pstmt.executeUpdate();
	}
  
	DBUtil.close(conn);

	response.sendRedirect("main_OK.jsp");
%>

</body>
</html>

------------------------------

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
	String sql;
	Connection conn = DBUtil.getMySQLConnection();
	PreparedStatement pstmt;
	
	String id = (String)session.getAttribute("id");
	String password = request.getParameter("pwd");
	String pwcheck = request.getParameter("pwd_check");
	
	String phone = request.getParameter("C_hp");
	
	String address = request.getParameter("C_ad");
	
	String sex = request.getParameter("C_sex");
	
	String age = request.getParameter("C_age");
	
	String job = request.getParameter("C_job");
	
	if(!password.equals(pwcheck))
	{
		response.sendRedirect("notequalsUpdate.jsp");
	}
	else
	{
	if(password.length() > 0 && pwcheck.length() > 0)
	{
  		if(password.equals(pwcheck))
		{
		  sql = "update customer set pw = '" + password + "' where id =" + id;
		  pstmt = conn.prepareStatement(sql);
		  pstmt.executeUpdate();
		}
  		else
  		{
  			out.println("비밀번호를 확인해주세요.");
  		}
	}
	if(phone.length() > 0)
	{
	  sql = "update customer set hp = '" + phone + "' where id =" + id;
	  pstmt = conn.prepareStatement(sql);
	  pstmt.executeUpdate();
	}
	if(address.length() > 0)
	{
	  sql = "update customer set address = '" + address + "' where id =" + id;
	  pstmt = conn.prepareStatement(sql);
	  pstmt.executeUpdate();
	}
	if(sex.length() > 0)
	{
	  sql = "update customer set sex = '" + sex + "' where id =" + id;
	  pstmt = conn.prepareStatement(sql);
	  pstmt.executeUpdate();
	}
	if(age.length() > 0)
	{
	  sql = "update customer set age = '" + age + "' where id =" + id;
	  pstmt = conn.prepareStatement(sql);
	  pstmt.executeUpdate();
	}
	if(job.length() > 0)
	{
	  sql = "update customer set job = '" + job + "' where id =" + id;
	  pstmt = conn.prepareStatement(sql);
	  pstmt.executeUpdate();
	}
  
	DBUtil.close(conn);

	response.sendRedirect("main_OK.jsp");
	}
%>

</body>
</html>
