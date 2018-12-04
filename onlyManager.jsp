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

<h1>관리자 전용 페이지입니다.</h1>

<td colspan = "1" align = "center"><input type = "button" value ="재고확인" onclick = "location.href ='checkQuant.jsp'"/></td>
<td colspan = "1" align = "center"><input type = "button" value ="매출확인" onclick = "location.href ='checkSell.jsp'"/></td>
<tr>
<td colspan = "1" align = "center"><input type = "button" value ="로그아웃" onclick = "location.href ='goodbye.jsp'"/></td>
</tr>
</FONT> <P>
</center>
</div>
</body>
</html>
