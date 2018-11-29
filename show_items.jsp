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
