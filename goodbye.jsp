<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "dbproject.DBUtil"%>
<%@ page import = "dbproject.loginCheck"%>
<%@ page import = "java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<title></title>
</head>
<body>
<div>
<center>
<FONT FACE="Arial"> 
<%
	request.setCharacterEncoding("UTF-8");
%>

<h1>이용해주셔서 감사합니다!</h1>
<h3> JJBJ_SHOP </h3>
<form action= "main.jsp" method = "post" onsubmit = "return loginCheck(this)">

	<td colspan = "1" align = "center"><input type ="submit" value = "로그인"/></td>

</form>
</FONT> <P>
</center>
</div>
</body>
</html>
	
--------------
	
	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "dbproject.DBUtil"%>
<%@ page import = "dbproject.loginCheck"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<title></title>
</head>
<body>
<div>
<center>
<FONT FACE="Arial"> 
<%
	request.setCharacterEncoding("UTF-8");
%>

<h1>이용해주셔서 감사합니다!</h1>
<h3> JJBJ_SHOP </h3>
<form action= "main.jsp" method = "post" onsubmit = "return loginCheck(this)">

	<td colspan = "1" align = "center"><input type ="submit" value = "로그인"/></td>

</form>
</FONT> <P>
</center>
</div>
</body>
</html>
