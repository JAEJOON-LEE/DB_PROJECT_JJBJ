<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import = "java.util.TreeMap" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "dbproject.DBUtil"%>
 <%! 
 	String sql = "";
 	Connection con = DBUtil.getMySQLConnection();
 	PreparedStatement pstmt = null;
 	ResultSet rs = null;

 %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr" />

<% request.setCharacterEncoding("UTF-8"); %>
<title>장바구니 담기</title>
</head>
<body>
	<h4> 장바구니 담기 </h4>
	<%
		int r;
		String o_id = request.getParameter("order_id");
		String o_q = request.getParameter("order_q");
		String id = (String)session.getAttribute("id");
		
		int exist = 0;
		sql = "select P_ID from shoppingBag where P_id=" +o_id;
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			exist = rs.getInt(1);
		}
		
		if (exist!= 0){
			sql = "update shoppingBag set P_quant = P_quant +" + o_q + " where P_id=" + o_id;
			pstmt = con.prepareStatement(sql);
			r = pstmt.executeUpdate();
		}
		else{
			sql = "insert into shoppingBag(c_ID, P_id, P_quant) values(" + id + "," + o_id + "," + o_q + ")";
			pstmt = con.prepareStatement(sql);
			r = pstmt.executeUpdate();
		}
		
		sql = "select pname from items where PID =" + o_id;
		pstmt = con.prepareStatement(sql);
		rs= pstmt.executeQuery();
		
		rs.next();
		String o_name = rs.getString(1);
	%>
	
	<ul>
		<li>상품 이름 : <%= o_name %></li>
		<li>담은 수량 : <%= request.getParameter("order_q") %></li>
	</ul>
	<button onclick="location.href='shop.jsp'">닫기</button>

</body>
</html>