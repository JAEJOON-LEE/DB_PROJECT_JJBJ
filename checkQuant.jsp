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

	Connection conn = DBUtil.getMySQLConnection();
	String sql, sql2;
	ResultSet rs = null;
	ResultSet rs2 = null;
	
	sql = "select distinct pname, price, pid from items";
	
	
	
	//	try{
 			PreparedStatement pstmt = conn.prepareStatement(sql);
 			rs = pstmt.executeQuery();
 			%>
 			<h1>판매중인 상품목록입니다.</h1>
 			<%
 		
 		out.println("<table border=\"1\" width=\"930px\" align=\"center\">");
 		ResultSetMetaData rsmd = rs.getMetaData();
 		int cnt = rsmd.getColumnCount();
 		for (int i = 1; i <cnt; i++){
 			out.println("<th>" + rsmd.getColumnName(i)+"</th>");
 		}
			out.println("<th>" + "Quant "+"</th>");
 		while(rs.next()){
  			out.println("<tr>");
  			
  			sql2 = "select AQ from TOTAL where pid = " + rs.getInt(3) ;	
  			PreparedStatement pstmt2 = conn.prepareStatement(sql2);
  			rs2 = pstmt2.executeQuery();
  			rs2.next();
  			out.println("<td align = center>" +rs.getString(1)+ "</td>");
  			out.println("<td align = center>" +rs.getInt(2)+ "</td>");
  			out.println("<td align = center>" +rs2.getInt(1)+ "</td>");
  			%>
  			<% 
				out.println("</tr>");
 		}
 		out.println("</table>");
 		
	
	
	//	try{
 			pstmt = conn.prepareStatement(sql);
 			rs = pstmt.executeQuery();
 			%>
 		<h1>재고가 없는 상품들의 목록입니다.</h1>
 		<%
 		out.println("</table>");
 		
 		out.println("<table border=\"1\" width=\"930px\" align=\"center\">");
 		rsmd = rs.getMetaData();
 		cnt = rsmd.getColumnCount();
 		for (int i = 1; i <cnt; i++){
 			out.println("<th>" + rsmd.getColumnName(i)+"</th>");
 		}
			out.println("<th>" + "Quant "+"</th>");
 		while(rs.next()){
 				sql2 = "select AQ from TOTAL where pid = " + rs.getInt(3) ;	
  				PreparedStatement pstmt2 = conn.prepareStatement(sql2);
  				rs2 = pstmt2.executeQuery();
  				rs2.next();
				int tmp = rs2.getInt(1);
				
 			if (tmp == 0){
 				out.println("<tr>");
  				out.println("<td align = center>" +rs.getString(1)+ "</td>");
  				out.println("<td align = center>" +rs.getInt(2)+ "</td>");
  				out.println("<td align = center>" +tmp+ "</td>");
				out.println("</tr>");
 			}
 		}
 		
 		out.println("</table>");
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

<td colspan = "1" align = "center"><input type = "button" value ="재고증가" onclick = "location.href ='addQuant.jsp'"/></td>
<td colspan = "2" align = "center"><input type = "button" value ="돌아가기" onclick = "location.href ='onlyManager.jsp'"/></td>
      
</FONT> <P>
</center>
</div>
</body>
</html>
