<%@ page import = "java.sql.*"%>
<%@ page import = "dbproject.DBUtil"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	String driver = "org.gjt.mm.mysql.Driver";
	String url = "jdbc:mysql://localhost:3306/mysql?useUnicode=true&characterEncoding=euckr";
	String dbID = "root";
	String dbPW = "6523qudwn";
	String query = "";
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

		<table border="1" width="930px" align="center">
		<tr>
			<th>ID</th>
			<th>이름</th>
			<th>가격</th>
			<th>수량</th>
		</tr>
		</table>
		
		<%
    
        
    		String big = request.getParameter("BIG");
			  String small;
	
			if (big.equals("drink")){
			small = request.getParameter("SUB1");
			}else if(big.equals("fruits")){
			small = request.getParameter("SUB2");
			}else{
			small = request.getParameter("SUB3");
			}
    
    
    		String sql = "SELECT PID, PNAME, PRICE, QUANT FROM ITEMS WHERE CATEGORY_BIG = '" 
						+ big + "' AND CATEGORY_SMALL ='" + small + "'";
    
    		System.out.println(sql);		
  		%>
  	

</body>
</html>

----------------------------

<%@ page import = "java.sql.*"%>
<%@ page import = "dbproject.DBUtil"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	String sql = "";
	
	Connection conn = DBUtil.getMySQLConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리별 상품검색</title>
</head>
<body>
<div>
<center>
<FONT FACE="Arial"> 
		
		<%
		try{
    
    		String big = request.getParameter("BIG");
			String small;
	
			if (big.equals("drink")){
			small = request.getParameter("small1");
			}else if(big.equals("fruits")){
			small = request.getParameter("small2");
			}else{
			small = request.getParameter("small3");
			}
    
    		System.out.println(big);
    		System.out.println(small);
    		
    		sql =  "SELECT DISTINCT PID, PNAME, PRICE, (SELECT SUM(QUANT) FROM ITEMS t WHERE i.PID = t.PID AND CATEGORY_BIG = '" + big + "' and CATEGORY_SMALL = '" + small + "') \"AQ\""
    	    		+ "FROM ITEMS i WHERE CATEGORY_BIG = '" + big + "' and CATEGORY_SMALL = '" + small + "'";	
    		pstmt = conn.prepareStatement(sql);
    		rs = pstmt.executeQuery();
    
    		out.println("<table border=\"1\">");
    		ResultSetMetaData rsmd = rs.getMetaData();
    		int cnt = rsmd.getColumnCount();
    		for (int i = 1; i <=cnt; i++){
    			out.println("<th>" + rsmd.getColumnName(i)+"</th>");
    		}
    			out.println("<th>" + "Order_Quant" + "</th>");
    			out.println("<th>" + "CART" + "</th>");
    		while(rs.next()){
     			out.println("<tr>");
     			out.println("<td align = center>" +rs.getInt(1)+ "</td>");
     			out.println("<td align = center>" +rs.getString(2)+ "</td>");
     			out.println("<td align = center>" +rs.getInt(3)+ "</td>");
     			out.println("<td align = center>" +rs.getInt(4)+ "</td>");
     			%>
     			<td><input type="text" name="order_q" id="order_q"/> </td>
     			<td><input type="submit" value="담기"/></td>
     			<% 
  				out.println("</tr>");
    		}
    		out.println("</table>");
    		pstmt.close();
    		conn.close();
    	}
   		catch(Exception e){
    		e.printStackTrace();
   		}finally{
    		if(rs!=null)try{rs.close();}catch(SQLException sqle){}
    		if(pstmt!=null)try{pstmt.close();}catch(SQLException sqle){}
    		if(conn!=null)try{conn.close();}catch(SQLException sqle){}
   		}
  		%>
  		
  		<button onclick="location.href='shop.jsp'">이전</button>
 </FONT> <P>
</center>
</div>
</body>
</html>
	
--------------------
	
	<%@ page import = "java.sql.*"%>
<%@ page import = "dbproject.DBUtil"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리별 상품검색</title>
</head>
<body>
<div>
<center>
<FONT FACE="Arial"> 
		<form action = "AddItemToCartResult.jsp" method = "post">
		
		<%
		//try{
			
		String sql = "";
	
		Connection con = DBUtil.getMySQLConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
    
    		String big = request.getParameter("BIG");
			String small;
	
			if (big.equals("drink")){
			small = request.getParameter("small1");
			}else if(big.equals("fruits")){
			small = request.getParameter("small2");
			}else{
			small = request.getParameter("small3");
			}
    
    		System.out.println(big);
    		System.out.println(small);
    		
    		sql =  "select distinct t.pid, i.pname, i.price, t.aq from items i, total t where t.pid=i.pid and i.category_big = '" +big+"' and i.category_small = '" + small+"';";
	
    		pstmt = con.prepareStatement(sql);
    		rs = pstmt.executeQuery();
    
    		out.println("<table border=\"1\">");
    		ResultSetMetaData rsmd = rs.getMetaData();
    		int cnt = rsmd.getColumnCount();
    		for (int i = 1; i <=cnt; i++){
    			out.println("<th>" + rsmd.getColumnName(i)+"</th>");
    		}
    		while(rs.next()){
     			out.println("<tr>");
     			out.println("<td align = center>" +rs.getInt(1)+ "</td>");
     			out.println("<td align = center>" +rs.getString(2)+ "</td>");
     			out.println("<td align = center>" +rs.getInt(3)+ "</td>");
     			out.println("<td align = center>" +rs.getInt(4)+ "</td>");
     			%>
     			<% 
  				out.println("</tr>");
    		}
    		out.println("</table>");
    		//pstmt.close();
    		con.close();
    	/* }
   		catch(Exception e){
    		e.printStackTrace();
   		}finally{
    		if(rs!=null)try{rs.close();}catch(SQLException sqle){}
    		if(pstmt!=null)try{pstmt.close();}catch(SQLException sqle){}
    		if(con!=null)try{con.close();}catch(SQLException sqle){}
   		} */
  		%>
  		상품번호 : <td colspan = "1" align = "center"><td><input type = "text" name = "order_id" id = "order_id"></td>
 	    상품수량 : <td colspan = "1" align = "center"><td><input type = "text" name = "order_q" id = "order_q"></td>
     	<td colspan = "1" align = "center"><td><input type="submit" value="담기"/></td>
  		<td colspan = "1" align ="center"><input type = "button" value ="이전" onclick = "location.href ='shop.jsp'"/></td>
  		</form>
 </FONT> <P>
</center>
</div>
</body>
</html>

