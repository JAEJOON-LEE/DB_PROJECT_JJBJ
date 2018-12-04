<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
  <%@ page import = "java.sql.*" %>
    <%@ page import = "dbproject.DBUtil"%>
 <%!
 	String sql = "";
 	
 	Connection con = DBUtil.getMySQLConnection();
 	PreparedStatement pstmt = null;
 	PreparedStatement pstmt2 = null;
 	int r;
 	ResultSet rs = null;
 	ResultSet rs2 = null;
 	
 	int customer_id;
 %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
고객님의 과거 주문내역 입니다.
       <table border="1" width="930px" align="center">
		<tr>
			<th>상품ID</th>
			<th>상품수량</th>
			<th>가격</th>
			<th>구매날짜</th>
			<%
				String id = (String)session.getAttribute("id");
				
				sql = "SELECT P_ID, P_quant, P_price, order_date FROM ORDER_DETAIL2 WHERE C_ID = " + id;
				System.out.println(sql);
				pstmt2 = con.prepareStatement(sql);
				rs2 = pstmt2.executeQuery();
				
				 while(rs2.next()){
 	     			out.println("<tr>");
 	     			out.println("<td>" +rs2.getInt(1)+ "</td>");
 	     			out.println("<td>" +rs2.getInt(2)+ "</td>");
 	     			out.println("<td>" +rs2.getInt(3)+ "</td>");
 	     			out.println("<td>" +rs2.getDate(4)+ "</td>");
 	     			out.println("</tr>");
				} 
			
			
				 pstmt2.close();
			%>
			
			
			
		</tr>
		</table>
		<td colspan = "1" align ="center"><input type = "button" value ="돌아가기" onclick = "location.href ='shop.jsp'"/></td>
</body>
</html>