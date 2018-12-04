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
 	int r;
	boolean check = false;
	String d_name;
 %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr" />

<% request.setCharacterEncoding("UTF-8"); %>
</head>
<body>
	<%
		String d_id;
		d_id = request.getParameter("delete_id");
		if (!(d_id.equals(null))){
			
		}
		sql = "select P_ID from shoppingBag where P_ID = " + d_id;
		pstmt = con.prepareStatement(sql);
		rs= pstmt.executeQuery();
	
		while(rs.next()){
			check = true;
		}
	
		sql = "select pname from ITEMS, shoppingBag where P_ID= " +d_id + " and P_ID = PID";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			d_name = rs.getString(1);
		}
		

        if (check == true){
            out.println("상품명 : " + d_name);
            out.println("상품번호 : "+ d_id);
            out.println("상품이 정상적으로 삭제되었습니다.");
            sql = "delete from shoppingBag where P_ID = " + d_id;
            pstmt = con.prepareStatement(sql);
            r= pstmt.executeUpdate();
        }
		else {
			out.println("상품이 장바구니에 담겨있지 않습니다.");
		}
		check = false;
	%>
	<button onclick="location.href='shop.jsp'">닫기</button>
</body>
</html>
