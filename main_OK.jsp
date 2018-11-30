<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*" %>
<%@ page import = "dbproject.DBUtil"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
</head>
<body>
<div>
<center>
<FONT FACE="Arial"> 
<%
	request.setCharacterEncoding("UTF-8");
	////아이디 비번 주소 성별 나이 직업 매장번호	
	String id = (String)session.getAttribute("id");
	String address;
	String password;
	String job;
	String sex;
	String phone;
	int age;
	
	Connection conn = DBUtil.getMySQLConnection();
	String sql = "select * from customer where id = ?";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	password = rs.getString(2);
	phone = rs.getString(3);
	address = rs.getString(4);
	sex = rs.getString(5);
	age = rs.getInt(6);
	job = rs.getString(7);
	
	DBUtil.close(rs);
	DBUtil.close(pstmt);
	DBUtil.close(conn);
%>
<h2>안녕하세요. <%=id%>번 고객님!	</h2><br/>
<h3>고객님의 회원 정보입니다.</h3>
<table width ="300" border ="1">
	<tr><th colspan ="2">ID : <%=id %></th></tr>
	<tr>
		<td align ="center">비밀번호</td>
		<td align ="center"><%=password %></td>
	</tr>
	<tr>
		<td align ="center">휴대폰번호</td>
		<td align ="center"><%=phone %></td>
	</tr>
	<tr>
		<td align ="center">주소</td>
		<td align ="center"><%=address %></td>
	</tr>
	<tr>
		<td align ="center">성별</td>
		<td align ="center"><%=sex %></td>
	</tr>
	<tr>
		<td align ="center">나이</td>
		<td align ="center"><%=age %></td>
	</tr>
	<tr>
		<td align ="center">직업</td>
		<td align ="center"><%=job %></td>
	</tr>
	<td colspan = "1" align ="center
	"><input type = "button" value ="정보수정" onclick = "location.href ='updateMinfo.jsp'"/></td>
	<td colspan = "1" align ="center"><input type = "button" value ="돌아가기" onclick = "location.href ='shop.jsp'"/></td>
	</table>
</FONT> <P>
</center>
</div>
</body>
</html>
