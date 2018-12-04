<%@ page import = "java.sql.*"%>
<%@ page import = "dbproject.DBUtil"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<title>SEARCH RESULT</title>
</head>
<body>
<div>
<center>
<FONT FACE="Arial"> 

<%
	request.setCharacterEncoding("UTF-8");

	String col = request.getParameter("col");
	String part = request.getParameter("search");
	
	Connection conn = DBUtil.getMySQLConnection();
	String sql;
	ResultSet rs = null;
	
	if(col.equals("name"))
	{
		sql = "select pname, price, quant from items where pname like '%" + part + "%'";
	}
	else
	{
		sql = "select pname, price, quant from items where pid = " + part;
	}
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.executeQuery();
	
		try{
 			pstmt = conn.prepareStatement(sql);
 			rs = pstmt.executeQuery();
 			%>
 			<h1>검색 결과에 해당하는 상품입니다.</h1>
 			<%
 		
 		out.println("<table border=\"1\" width=\"930px\" align=\"center\">");
 		ResultSetMetaData rsmd = rs.getMetaData();
 		int cnt = rsmd.getColumnCount();
 		for (int i = 1; i <=cnt; i++){
 			out.println("<th>" + rsmd.getColumnName(i)+"</th>");
 		}
 			out.println("<th>" + "Order_Quant" + "</th>");
 			out.println("<th>" + "CART" + "</th>");
 		while(rs.next()){
  			out.println("<tr>");
  			out.println("<td align = center>" +rs.getString(1)+ "</td>");
  			out.println("<td align = center>" +rs.getInt(2)+ "</td>");
  			out.println("<td align = center>" +rs.getInt(3)+ "</td>");
  		//	out.println("<td>" +rs.getInt(4)+ "</td>");
  			%>
  			<td align = center><input type="text" name="order_q" id="order_q"/> </td>
  			<td align = center><input type="submit" value="담기"/></td>
  			<% 
				out.println("</tr>");
 		}
 		
 		out.println("</table>");
 		pstmt.close();
 		conn.close();
 		
		}catch(Exception e){
 		e.printStackTrace();
		}finally{
 		if(rs!=null)try{rs.close();}catch(SQLException sqle){}
 		if(pstmt!=null)try{pstmt.close();}catch(SQLException sqle){}
 		if(conn!=null)try{conn.close();}catch(SQLException sqle){}
		}
	
	DBUtil.close(pstmt);
	DBUtil.close(conn);
%>
<td colspan = "2" align = "center"><input type = "button" value ="돌아가기" onclick = "location.href ='shop.jsp'"/></td>
      
</FONT> <P>
</center>
</div>
</body>
</html>
	
	
_________________________________________________________________________________________________________________________
<2018.12.04 수정완료>	
	
	<%@ page import = "java.sql.*"%>
<%@ page import = "dbproject.DBUtil"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<title>SEARCH RESULT</title>
</head>
<body>
<div>
<center>
<FONT FACE="Arial"> 

	<form action = "AddItemToCartResult.jsp" method = "post">
	<%
	request.setCharacterEncoding("UTF-8");

	String col = request.getParameter("col");
	String part = request.getParameter("search");
	//session.setAttribute("search", part);
	
	Connection conn = DBUtil.getMySQLConnection();
	String sql, sql2;
	ResultSet rs = null;
	ResultSet rs2 = null;
	
	if(col.equals("name"))
	{
		sql = "select distinct pid, pname, price from items where pname like '%" + part + "%'";
		sql2 = "select DISTINCT t.AQ from TOTAL t, items i where i.PID = t.pid and i.pname like '%" + part + "%'" ;
	}
	else if(col.equals("none"))
	{
		sql = "select distinct pid, pname, price from items order by pid ASC";
		sql2 = "select distinct AQ from TOTAL" ;
	}
	else
	{
		sql = "select distinct pid, pname, price from items where pid = " + part;
		sql2 = "select distinct AQ from TOTAL where pid = " + part;
	}
	PreparedStatement pstmt2 = conn.prepareStatement(sql2);
	rs2 = pstmt2.executeQuery();
	
 	PreparedStatement pstmt = conn.prepareStatement(sql);
 	rs = pstmt.executeQuery();
 	%>
 	<h1>검색 결과에 해당하는 상품입니다.</h1>
 	<%
 		
 		out.println("<table border=\"1\" width=\"930px\" align=\"center\">");
 		ResultSetMetaData rsmd = rs.getMetaData();
 		int cnt = rsmd.getColumnCount();
 		for (int i = 1; i <=cnt; i++){
 			out.println("<th>" + rsmd.getColumnName(i)+"</th>");
 		}
			out.println("<th>" + "Quant "+"</th>");
 			
 		while(rs.next() && rs2.next()){
  			out.println("<tr>");
  			out.println("<td align = center>" +rs.getString(1)+ "</td>");
  			out.println("<td align = center>" +rs.getString(2)+ "</td>");
  			out.println("<td align = center>" +rs.getInt(3)+ "</td>");
  			out.println("<td align = center>" +rs2.getInt(1)+ "</td>"); 
			out.println("</tr>");
 		}
 		
 		out.println("</table>");
 		%>
 		상품번호 : <td colspan = "1" align = "center"><td><input type = "text" name = "order_id" id = "order_id"></td>
 	    상품수량 : <td colspan = "1" align = "center"><td><input type = "text" name = "order_q" id = "order_q"></td>
     	<td colspan = "1" align = "center"><td><input type="submit" value="담기"/></td>
 		<%
 		pstmt.close();
 		conn.close();
 		
	//	}catch(Exception e){
 	//	e.printStackTrace();
	//	}finally{
 	//	if(rs!=null)try{rs.close();}catch(SQLException sqle){}
 	//	if(pstmt!=null)try{pstmt.close();}catch(SQLException sqle){}
 	//	if(conn!=null)try{conn.close();}catch(SQLException sqle){}
	//	}
	
	DBUtil.close(pstmt);
	DBUtil.close(conn);
%>
<td colspan = "2" align = "center"><input type = "button" value ="돌아가기" onclick = "location.href ='shop.jsp'"/></td>
</form>
</FONT> <P>
</center>
</div>
</body>
</html>

-------------------------
	
<%@ page import = "java.sql.*"%>
<%@ page import = "dbproject.DBUtil"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<title>SEARCH RESULT</title>
</head>
<body>
<div>
<center>
<FONT FACE="Arial"> 

	<form action = "AddItemToCartResult.jsp" method = "post">
	<%
	request.setCharacterEncoding("UTF-8");

	String col = request.getParameter("col");
	String part = request.getParameter("search");
	//session.setAttribute("search", part);
	
	Connection conn = DBUtil.getMySQLConnection();
	String sql, sql2;
	ResultSet rs = null;
	ResultSet rs2 = null;
	
	if(col.equals("name"))
	{
		sql = "select distinct pid, pname, price from items where pname like '%" + part + "%'";
		sql2 = "select DISTINCT t.AQ from TOTAL t, items i where i.PID = t.pid and i.pname like '%" + part + "%'" ;
	}
	else if(col.equals("none"))
	{
		sql = "select distinct pid, pname, price from items order by pid ASC";
		sql2 = "select distinct AQ from TOTAL" ;
	}
	else
	{
		sql = "select distinct pid, pname, price from items where pid = " + part;
		sql2 = "select distinct AQ from TOTAL where pid = " + part;
	}
	PreparedStatement pstmt2 = conn.prepareStatement(sql2);
	rs2 = pstmt2.executeQuery();
	
 	PreparedStatement pstmt = conn.prepareStatement(sql);
 	rs = pstmt.executeQuery();
 	%>
 	<h1>검색 결과에 해당하는 상품입니다.</h1>
 	<%
 		
 		out.println("<table border=\"1\" width=\"930px\" align=\"center\">");
 		ResultSetMetaData rsmd = rs.getMetaData();
 		int cnt = rsmd.getColumnCount();
 		for (int i = 1; i <=cnt; i++){
 			out.println("<th>" + rsmd.getColumnName(i)+"</th>");
 		}
			out.println("<th>" + "Quant "+"</th>");
 			
 		while(rs.next() && rs2.next()){
  			out.println("<tr>");
  			out.println("<td align = center>" +rs.getString(1)+ "</td>");
  			out.println("<td align = center>" +rs.getString(2)+ "</td>");
  			out.println("<td align = center>" +rs.getInt(3)+ "</td>");
  			out.println("<td align = center>" +rs2.getInt(1)+ "</td>"); 
			out.println("</tr>");
 		}
 		
 		out.println("</table>");
 		%>
 		상품번호 : <td colspan = "1" align = "center"><td><input type = "text" name = "order_id" id = "order_id"></td>
 	    상품수량 : <td colspan = "1" align = "center"><td><input type = "text" name = "order_q" id = "order_q"></td>
     	<td colspan = "1" align = "center"><td><input type="submit" value="담기"/></td>
 		<%
 		pstmt.close();
 		conn.close();
 		
	//	}catch(Exception e){
 	//	e.printStackTrace();
	//	}finally{
 	//	if(rs!=null)try{rs.close();}catch(SQLException sqle){}
 	//	if(pstmt!=null)try{pstmt.close();}catch(SQLException sqle){}
 	//	if(conn!=null)try{conn.close();}catch(SQLException sqle){}
	//	}
	
	DBUtil.close(pstmt);
	DBUtil.close(conn);
%>
<td colspan = "2" align = "center"><input type = "button" value ="돌아가기" onclick = "location.href ='shop.jsp'"/></td>
</form>
</FONT> <P>
</center>
</div>
</body>
</html>

	-------------------
	
	<%@ page import = "java.sql.*"%>
<%@ page import = "dbproject.DBUtil"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<title>SEARCH RESULT</title>
</head>
<body>
<div>
<center>
<FONT FACE="Arial"> 

	<form action = "AddItemToCartResult.jsp" method = "post">
	<%
	request.setCharacterEncoding("UTF-8");

	String col = request.getParameter("col");
	String part = request.getParameter("search");
	//session.setAttribute("search", part);
	
	Connection conn = DBUtil.getMySQLConnection();
	String sql, sql2;
	ResultSet rs = null;
	ResultSet rs2 = null;
	
	sql = "select distinct pid, pname, price from items";
	
	
	//	try{
 			PreparedStatement pstmt = conn.prepareStatement(sql);
 			rs = pstmt.executeQuery();
 			%>
 			<h1>판매중인 상품목록입니다.</h1>
 			<%
 		
 		out.println("<table border=\"1\" width=\"930px\" align=\"center\">");
 		ResultSetMetaData rsmd = rs.getMetaData();
 		int cnt = rsmd.getColumnCount();
 		for (int i = 1; i <=cnt; i++){
 			out.println("<th>" + rsmd.getColumnName(i)+"</th>");
 		}
			out.println("<th>" + "Quant "+"</th>");
 		while(rs.next()){
  			out.println("<tr>");
  			
  			sql2 = "select AQ from TOTAL where pid = " + rs.getInt(1) ;	
  			PreparedStatement pstmt2 = conn.prepareStatement(sql2);
  			out.println("<td align = center>" +rs.getInt(1)+ "</td>");
  			rs2 = pstmt2.executeQuery();
  			rs2.next();
  			out.println("<td align = center>" +rs.getString(2)+ "</td>");
  			out.println("<td align = center>" +rs.getInt(3)+ "</td>");
  			out.println("<td align = center>" +rs2.getInt(1)+ "</td>");
  			%>
  			<% 
				out.println("</tr>");
 		}
 		out.println("</table>");
 		%>
 		상품번호 : <td colspan = "1" align = "center"><td><input type = "text" name = "order_id" id = "order_id"></td>
 	    상품수량 : <td colspan = "1" align = "center"><td><input type = "text" name = "order_q" id = "order_q"></td>
     	<td colspan = "1" align = "center"><td><input type="submit" value="담기"/></td>
 		<%
 		pstmt.close();
 		conn.close();
 		
	//	}catch(Exception e){
 	//	e.printStackTrace();
	//	}finally{
 	//	if(rs!=null)try{rs.close();}catch(SQLException sqle){}
 	//	if(pstmt!=null)try{pstmt.close();}catch(SQLException sqle){}
 	//	if(conn!=null)try{conn.close();}catch(SQLException sqle){}
	//	}
	
	DBUtil.close(pstmt);
	DBUtil.close(conn);
%>
<td colspan = "2" align = "center"><input type = "button" value ="돌아가기" onclick = "location.href ='shop.jsp'"/></td>
</form>
</FONT> <P>
</center>
</div>
</body>
</html>
