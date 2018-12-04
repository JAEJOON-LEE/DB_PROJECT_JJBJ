<%@ page import = "java.sql.*"%>
<%@ page import = "dbproject.DBUtil"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.io.*"%>
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
	
	PreparedStatement pstmt2 = null;
 	PreparedStatement pstmt = null;
 	
 	int sum = 0;
 	int sum_month = 0;
 	int sum_today = 0;
 	
 	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
	String today = formatter.format(new java.util.Date());
	
	java.text.SimpleDateFormat formatter2 = new java.text.SimpleDateFormat("yyyy-MM");
	String month = formatter2.format(new java.util.Date());
	
 			%>
 			<table border="1" width="930px" align="center">
		<tr>
 			<h1>매출 내역입니다.</h1>
 			<tr>
 			<th>고객ID</th>
			<th>상품ID</th>
			<th>상품명</th>
			<th>가격</th>
			<th>수량</th>
			<th>구매날짜</th>
			<%
				String id = (String)session.getAttribute("id");
			
				
				sql = "SELECT P_ID, P_quant, P_price, order_date, C_ID FROM ORDER_DETAIL2";
				System.out.println(sql);
				pstmt2 = conn.prepareStatement(sql);
				rs2 = pstmt2.executeQuery();
				
				
				 while(rs2.next()){
 	     			out.println("<tr>");
 	     			out.println("<td align = center>" +rs2.getInt(5)+ "</td>");
 	     			out.println("<td align = center>" +rs2.getInt(1)+ "</td>");
 	     			
 	     			sql = "SELECT PNAME from items where pid = "+ rs2.getInt(1);
 					pstmt = conn.prepareStatement(sql);
 					rs = pstmt.executeQuery();

 					rs.next();
 	     			out.println("<td align = center>" +rs.getString(1)+ "</td>");
 	     			out.println("<td align = center>" +rs2.getInt(3)+ "</td>");
 	     			out.println("<td align = center>" +rs2.getInt(2)+ "</td>");
 	     			out.println("<td align = center>" +rs2.getDate(4)+ "</td>");
 	     			out.println("</tr>");
 	     			
 	     			sum = sum + rs2.getInt(2) * rs2.getInt(3);
 	     			
 	     			if(rs2.getString(4).equals(today))
 	     			{
 	     				sum_today = sum_today + rs2.getInt(2) * rs2.getInt(3);
 	     			}
 	     			
 	     			if(rs2.getString(4).contains(month))
 	     			{
 	     				sum_month = sum_month + rs2.getInt(2) * rs2.getInt(3);
 	     			}
				} 
			
				 pstmt2.close();
			%>
			</tr>
 		</table>
 		
 	
 		<% 
 		out.println("총 매출은 " +sum +"원 / ");
 		out.println("이번 달 매출은 " +sum_month +"원 / ");
 		out.println("오늘의 매출은 " +sum_today +"원 입니다.");
 		
 		conn.close();
 		
	
	DBUtil.close(pstmt);
	DBUtil.close(conn);
%>

<tr>
<td colspan = "2" align = "center"><input type = "button" value ="돌아가기" onclick = "location.href ='onlyManager.jsp'"/></td>
      </tr>
</FONT> <P>
</center>
</div>
</body>
</html>
