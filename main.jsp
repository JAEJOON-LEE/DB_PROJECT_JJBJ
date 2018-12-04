<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import = "java.sql.*" %>
<%@ page import = "dbproject.DBUtil"%>
<%@ page import = "dbproject.loginCheck"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<title>메인</title>
<script type ="text/javascript" src = "formCheck.js"></script>
</head>
<body>
<div>
<center>
<FONT FACE="Arial"> 
<%
	request.setCharacterEncoding("UTF-8");

	String id = (String)(request.getParameter("id"));
	String password = request.getParameter("pw");
	
//	session.setAttribute("id", id);
//	session.setAttribute("login", "yes");
	
//	String login = (String)session.getAttribute("login");
//	if(login != null && login.equals("yes"))
//	{
//		out.println("<script>");
//		out.println("alert('로그인 되었습니다. 환영합니다.')");
//		out.println("location.href='main_OK.jsp");
//		out.println("</script>");
//		response.sendRedirect("main_OK.jsp");
//	}
%>

<h1>환영합니다!</h1>
<h3> JJBJ_SHOP </h3>
<form action= "id_check.jsp" method = "post" onsubmit = "return loginCheck(this)">
<table>
	<%-- <tr><th colspan ="2">로그인</th></tr> --%>
	<tr>
	<td>아이디</td>
	<td><input type="text" name = "id"/></td>
	</tr>
	<tr>
	<td>비밀번호</td>
	<td><input type="password" name = "pw"/></td>
	</tr></table>


	<td colspan = "1" align = "center"><input type ="submit" value = "로그인"/></td>
	<td colspan = "1" align ="center"><input type = "button" value ="회원가입" onclick = "location.href ='joinPage.jsp'"/></td>
</form>
</FONT> <P>
</center>
</div>
</body>
</html>

---------------------------------------
	
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "dbproject.DBUtil"%>
<%@ page import = "dbproject.loginCheck"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<title>메인</title>
<script type ="text/javascript" src = "formCheck.js"></script>
</head>
<body>
<div>
<center>
<FONT FACE="Arial"> 
<%
	request.setCharacterEncoding("UTF-8");

	String id = (String)(request.getParameter("id"));
	String password = request.getParameter("pw");
%>

<h1>환영합니다!</h1>
<h3> JJBJ_SHOP </h3>
<form action= "id_check.jsp" method = "post" onsubmit = "return loginCheck(this)">
<table>
	<%-- <tr><th colspan ="2">로그인</th></tr> --%>
	<tr>
	<td>아이디</td>
	<td><input type="text" name = "id"/></td>
	</tr>
	<tr>
	<td>비밀번호</td>
	<td><input type="password" name = "pw"/></td>
	</tr></table>


	<td colspan = "1" align = "center"><input type ="submit" value = "로그인"/></td>
	<td colspan = "1" align ="center"><input type = "button" value ="회원가입" onclick = "location.href ='joinPage.jsp'"/></td>
</form>
</FONT> <P>
</center>
</div>
</body>
</html>
