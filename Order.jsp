<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import = "java.util.TreeMap" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "dbproject.DBUtil"%>
<%@ page import="java.util.*, java.text.*"  %>
 <%! 
 	String sql = "";
 	Connection con = DBUtil.getMySQLConnection();
 	PreparedStatement pstmt = null;
 	ResultSet rs = null;
	int r;
	boolean check = true;
 %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr" />

<% request.setCharacterEncoding("UTF-8"); %>
<title>주문하기</title>
</head>
<body>
	<h4> 주문하기 </h4>
	<%
	int price_total = 0;
	String id = (String)session.getAttribute("id");
	int customer_id;
	int[] aq = new int[100];
	int[] cq = new int[100];
	String[] pn = new String[100];
	int[] ary_pid = new int[100];
	int i = 0;
	int c;
	
		
		sql = "select id from customer where id = " +id ;
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		rs.next();
		customer_id = rs.getInt(1);

		sql = "DROP view temp14";
 		pstmt = con.prepareStatement(sql);
 		r = pstmt.executeUpdate();
 		
 		sql = "create view temp14 as select DISTINCT i.PID, t.aq as AQ FROM ITEMS i, total t, shoppingBag s where i.PID = t.PID and i.PID = s.P_ID ORDER BY i.PID ASC";
		pstmt = con.prepareStatement(sql);
 		r = pstmt.executeUpdate();
 		
 		
 		sql = "select * from temp14";
		pstmt = con.prepareStatement(sql);
 		rs = pstmt.executeQuery();
 	
 		
		while(rs.next()){
			i = rs.getInt(1);
			aq[i] = rs.getInt(2);
		}
		
		
		i = 0;
		sql = "SELECT DISTINCT PID, PNAME, PRICE, P_quant FROM shoppingBag, ITEMS WHERE PID=P_ID AND C_ID = " +customer_id + " ORDER BY PID ASC";
		System.out.println(sql);
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			i++;
			ary_pid[i] = rs.getInt(1);
			cq[ary_pid[i]] = rs.getInt(4);
			pn[ary_pid[i]] = rs.getString(2);
		}
		c = i;
		
		for (i = 1; i <= c; i++){
			if (cq[ary_pid[i]] > aq[ary_pid[i]])
				check = false;
		}
		
		
		for (i = 1; i <= c; i++){
			System.out.println(aq[ary_pid[i]]);
			System.out.println(cq[ary_pid[i]]);
		}
			
		if (check == true){
			sql = "SELECT DISTINCT PID, PNAME, PRICE, P_quant FROM shoppingBag, ITEMS WHERE PID=P_ID AND C_ID = " +customer_id;
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
		
		
			while(rs.next()){			
	  			price_total += rs.getInt(3) * rs.getInt(4); // 결제할 금액 알아내기
	  			java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMdd");
				String today = formatter.format(new java.util.Date());
	  			
				sql = "insert into order_detail2 values(" + customer_id + "," + rs.getString(1) + "," + rs.getInt(4) + "," + rs.getInt(3) + ","+ today + ")";
	  			pstmt = con.prepareStatement(sql);
				r = pstmt.executeUpdate();
				
			}
			
			if (price_total == 0){
				out.println("장바구니가 비어있습니다.");
			}else{
				out.println("총가격 :" + price_total);
			}
			
			for (i = 1; i <= c; i++){
				sql = "update TOTAL set AQ = AQ - " + cq[ary_pid[i]] + " where PID = " + ary_pid[i];
				System.out.println(sql);
				pstmt = con.prepareStatement(sql);
				r = pstmt.executeUpdate();
				
			}
			
			sql = "delete from shoppingBag where c_id=" + customer_id;
			pstmt = con.prepareStatement(sql);
			r = pstmt.executeUpdate();
			
				
		}else{
			out.println("주문이 불가능합니다.");
			out.println("< 주문 불가 사유 >");
			for (i = 1; i <= c; i++){
				if (aq[i] < cq[i]){
					out.println("상품명 :" + pn[i] +"의 주문수량이 재고보다 많습니다.");
				}
			}
		}
		check = true;	
	%>
	<td colspan = "1" align = "center"><button onclick="location.href='shop.jsp'">이전</button>
</body>
</html>

-------------------------

<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import = "java.util.TreeMap" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "dbproject.DBUtil"%>
<%@ page import="java.util.*, java.text.*"  %>
 <%! 
 	String sql = "";
 	Connection con = DBUtil.getMySQLConnection();
 	PreparedStatement pstmt = null;
 	ResultSet rs = null;
	int r;
	boolean check = true;
 %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr" />

<% request.setCharacterEncoding("UTF-8"); %>
<title>주문하기</title>
</head>
<body>
	<h4> 주문하기 </h4>
	<%
	int price_total = 0;
	String id = (String)session.getAttribute("id");
	int customer_id;
	int[] aq = new int[100];
	int[] cq = new int[100];
	String[] pn = new String[100];
	int[] ary_pid = new int[100];
	int i = 0;
	int c;
	
		
		sql = "select id from customer where id = " +id ;
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		rs.next();
		customer_id = rs.getInt(1);

		sql = "DROP view temp14";
 		pstmt = con.prepareStatement(sql);
 		r = pstmt.executeUpdate();
 		
 		sql = "create view temp14 as select DISTINCT i.PID, t.aq as AQ FROM ITEMS i, total t, shoppingBag s where i.PID = t.PID and i.PID = s.P_ID ORDER BY i.PID ASC";
		pstmt = con.prepareStatement(sql);
 		r = pstmt.executeUpdate();
 		
 		
 		sql = "select * from temp14";
		pstmt = con.prepareStatement(sql);
 		rs = pstmt.executeQuery();
 	
 		
		while(rs.next()){
			i = rs.getInt(1);
			aq[i] = rs.getInt(2);
		}
		c = i;
		
		
		i = 0;
		sql = "SELECT DISTINCT PID, PNAME, PRICE, P_quant FROM shoppingBag, ITEMS WHERE PID=P_ID AND C_ID = " +customer_id + " ORDER BY PID ASC";
		System.out.println(sql);
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			i++;
			ary_pid[i] = rs.getInt(1);
			cq[ary_pid[i]] = rs.getInt(4);
			pn[ary_pid[i]] = rs.getString(2);
		}
		
		for (i = 1; i <= c; i++){
			if (cq[ary_pid[i]] > aq[ary_pid[i]])
				check = false;
		}
		
		
		for (i = 1; i <= c; i++){
			System.out.println(aq[ary_pid[i]]);
			System.out.println(cq[ary_pid[i]]);
		}
			
		if (check == true){
			sql = "SELECT DISTINCT PID, PNAME, PRICE, P_quant FROM shoppingBag, ITEMS WHERE PID=P_ID AND C_ID = " +customer_id;
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
		
		
			while(rs.next()){			
	  			price_total += rs.getInt(3) * rs.getInt(4); // 결제할 금액 알아내기
	  			java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMdd");
				String today = formatter.format(new java.util.Date());
	  			
				sql = "insert into order_detail2 values(" + customer_id + "," + rs.getString(1) + "," + rs.getInt(4) + "," + rs.getInt(3) + ","+ today + ")";
	  			pstmt = con.prepareStatement(sql);
				r = pstmt.executeUpdate();
				
			}
			
			if (price_total == 0){
				out.println("장바구니가 비어있습니다.");
			}else{
				out.println(price_total + "원이 정상적으로 결제되었습니다.");
			}
			
			for (i = 1; i <= c; i++){
				sql = "update TOTAL set AQ = AQ - " + cq[ary_pid[i]] + " where PID = " + ary_pid[i];
				System.out.println(sql);
				pstmt = con.prepareStatement(sql);
				r = pstmt.executeUpdate();
				
			}
			
			sql = "delete from shoppingBag where c_id=" + customer_id;
			pstmt = con.prepareStatement(sql);
			r = pstmt.executeUpdate();
			
				
		}else{
			out.println("주문이 불가능합니다.");
			out.println("< 주문 불가 사유 >");
			for (i = 1; i <= c; i++){
				if (aq[i] < cq[i]){
					out.println("상품명 :" + pn[i] +"의 주문수량이 재고보다 많습니다.");
				}
			}
		}
		check = true;	
	%>
	<td colspan = "1" align = "center"><button onclick="location.href='shop.jsp'">확인</button>
</body>
</html>
