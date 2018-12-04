<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
   
   <% request.setCharacterEncoding("utf-8"); %>
   
   <title>tab example</title>
   <style>
      #container {
         width:960px;
         margin:0 auto;
         text-align:center;
      }
      .tab {
         list-style: none;
         margin: 0;
         padding: 0;
         overflow: hidden;
      }

      .tab li {
         float: left;
      }
     
      .tab li a {
         display: inline-block;
         color: #000;
         text-align: center;
         text-decoration: none;
         padding: 14px 16px;
         font-size: 17px;
         transition:0.3s;
      }
   
      .tabcontent {
         display: none;
         background-color:rgb(0,154,200);
         padding: 6px 12px;
         color:#fff;
      }
      ul.tab li.current{
         background-color: rgb(0,154,200);
         color: #222;
      }
      .tabcontent.current {
         display: block;
      }
   </style>
   <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
</head>
<body>
   <div id="container">
      <h2>Welcome to JJBJ_SHOP</h2>
      <ul class="tab">
         <li class="current" data-tab="tab1"><a href="#">MAIN</a></li>
         <li data-tab="tab2"><a href="#">SEARCH</a></li>
         <li data-tab="tab3"><a href="#">ITEMS</a></li>
         <li data-tab="tab4"><a href="#">MYPAGE</a></li>
         <li data-tab="tab5"><a href="#">MYCART</a></li>
         
      </ul>

      <div id="tab1" class="tabcontent current">
      
    
      반갑습니다. 고객님 !<br>
      <br>
      고객님을 위한 추천상품입니다. 
			<table border="1" width="930px" align="center">
		<tr>
			<th>이름</th>
			<th>설명</th>
			<th>가격</th>
			<th>수량</th>
			
		</tr>
		</table>
       
      </div>

      <div id="tab2" class="tabcontent">
		<DIV class='aside_menu'>
  <FORM name='frm' method='GET' action='./list.jsp'>
    <ASIDE style='float: right;'>
      <SELECT name='col'> <!-- 검색 컬럼 -->
        <OPTION value='none'>전체 목록</OPTION>
        <OPTION value='name'>상품이름</OPTION>
        <OPTION value='number'>상품번호</OPTION>
      </SELECT>
      <input type='text' name='word' value='' placeholder="특수문자는 사용할수 없습니다.">
      <button type='submit'>검색</button> 
    </ASIDE> 
  </FORM>
  <DIV class='menu_line' style='clear: both;'></DIV>
</DIV>
      </div>

      <div id="tab3" class="tabcontent">
		<h2>ITEMS</h2>
		
		BIG_CATEGORY: 
			<select id='BIG_selectbox'>
			<option value="1">BIG_1</option>
			<option value="2">BIG_2</option>
			<option value="3">BIG_3</option>
			</select>
			
			
			
			<table border="1" width="930px" align="center">
		<tr>
			<th>ID</th>
			<th>이름</th>
			<th>설명</th>
			<th>가격</th>
			<th>수량</th>
			
		</tr>
		</table>
      </div>
      
      <div id="tab4" class="tabcontent">
      
      </div>
      
       <div id="tab5" class="tabcontent">
       
      </div>
      
   </div>

   <script>
      $(function() {
         $('ul.tab li').click(function() {
            var activeTab = $(this).attr('data-tab');
            $('ul.tab li').removeClass('current');
            $('.tabcontent').removeClass('current');
            $(this).addClass('current');
            $('#' + activeTab).addClass('current');
         })
      });
   </script>
</body>
</html>



----------------------------------------



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*" %>
    <%@ page import = "dbproject.DBUtil"%>
    <%!
 	String sql = "";
 	
 	Connection con = DBUtil.getMySQLConnection();
 	PreparedStatement pstmt = null;
 	int r;
 	ResultSet rs = null;
 	
 	String big;
 	int age;
 %>
<!DOCTYPE html>
<html lang="ko">
<FONT FACE="Arial"> 
<head>
   <meta charset="UTF-8">
   
   <% request.setCharacterEncoding("utf-8"); %>
   <script language = "javascript"> 

 	function showSub(obj) {

     	f = document.forms.select_machine;
     	
		if(obj == "drink") {
     		
         	f.small1.style.display = "";
         	f.small2.style.display = "none";
         	f.small3.style.display = "none";
         	

     	} else if(obj == "fruits"){

         	f.small1.style.display = "none";
         	f.small2.style.display = "";
         	f.small3.style.display = "none";
         	
      	} else if(obj == "meat"){
      		f.small1.style.display = "none";
         	f.small2.style.display = "none";
         	f.small3.style.display = "";
      	} else {
      		f.small1.style.display = "none";
         	f.small2.style.display = "none";
         	f.small3.style.display = "none";
      	}
 	}
 	</script>
   <title>tab example</title>
   <style>
      #container {
         width:960px;
         margin:0 auto;
         text-align:center;
      }
      .tab {
         list-style: none;
         margin: 0;
         padding: 0;
         overflow: hidden;
      }

      .tab li {
         float: left;
      }
     
      .tab li a {
         display: inline-block;
         color: #000;
         text-align: center;
         text-decoration: none;
         padding: 14px 16px;
         font-size: 17px;
         transition:0.3s;
      }
   
      .tabcontent {
         display: none;
         background-color: rgb(0,154,200);
         padding: 6px 12px;
         color:#fff;
      }
      ul.tab li.current{
         background-color: rgb(0,154,200);
         color: #222;
      }
      .tabcontent.current {
         display: block;
      }
   </style>
   <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
</head>
<body>
<div>
<center>
<FONT FACE="Arial"> 

   <div id="container">
      <h2>Welcome to JJBJ_SHOP</h2>
      <td colspan = "4" align ="right"><input type = "button" value ="로그아웃" onclick = "location.href ='goodbye.jsp'"/></td>
      <ul class="tab">
         <li class="current" data-tab="tab1"><a href="#">MAIN</a></li>
         <li data-tab="tab2"><a href="#">SEARCH</a></li>
         <li data-tab="tab3"><a href="#">ITEMS</a></li>
         <li data-tab="tab4"><a href="#">MYPAGE</a></li>
         <li data-tab="tab5"><a href="#">MYCART</a></li>
         
      </ul>

      <div id="tab1" class="tabcontent current">
      
    
    	<%
    	String id = (String)session.getAttribute("id");
    	%>
      반갑습니다. <%=id %>번 고객님 !<br>
      <br>
      고객님을 위한 추천상품입니다. 
     
     <%
 			//try{
 	    		sql = "select age from customer where id = " +id ;
 	    		pstmt = con.prepareStatement(sql);
 	    		rs = pstmt.executeQuery();
 	    		
 	    		while(rs.next()){
 	    			age = rs.getInt(1);
 	    		}
 	    		
 	    		int tmp = (age/10)*10;
 	    		
 	    		
 	    		sql = "DROP VIEW TEMP7";
 	    		pstmt = con.prepareStatement(sql);
 	    		r = pstmt.executeUpdate();
 	    		
 	    		sql = "CREATE VIEW TEMP7 AS SELECT ID FROM CUSTOMER WHERE AGE BETWEEN " + (tmp) + " AND " + (tmp + 9);
 	    		pstmt = con.prepareStatement(sql);
 	    		r = pstmt.executeUpdate();
 	    		
 	    		sql = "DROP VIEW TEMP9";
 	    		pstmt = con.prepareStatement(sql);
 	    		r = pstmt.executeUpdate();
 	    		
 	    		sql = "CREATE VIEW TEMP9 AS SELECT P_ID, COUNT(*) QUANT FROM ORDER_DETAIL, TEMP7 WHERE C_ID = ID GROUP BY P_ID ORDER BY QUANT  DESC LIMIT 1";
 	    		pstmt = con.prepareStatement(sql);
 	    		r = pstmt.executeUpdate();
 	    		
 	    		sql = "DROP VIEW TEMP10";
 	    		pstmt = con.prepareStatement(sql);
 	    		r = pstmt.executeUpdate();
 	    		
 	    		sql = "CREATE VIEW TEMP10 AS SELECT O.C_ID FROM ORDER_DETAIL O WHERE O.P_ID = (SELECT P_ID FROM TEMP9)";
 	    		pstmt = con.prepareStatement(sql);
 	    		r = pstmt.executeUpdate();
 	    		
 	    		sql = "DROP VIEW TEMP11";
 	    		pstmt = con.prepareStatement(sql);
 	    		r = pstmt.executeUpdate();
 	    		
 	    		sql = "CREATE VIEW TEMP11 AS SELECT O.P_ID FROM ORDER_DETAIL O, TEMP10 T WHERE T.C_ID = O.C_ID";
 	    		pstmt = con.prepareStatement(sql);
 	    		r = pstmt.executeUpdate();
 	    		
 	    		sql = "DROP VIEW TEMP12";
 	    		pstmt = con.prepareStatement(sql);
 	    		r = pstmt.executeUpdate();
 	    		
 	    		sql = "CREATE VIEW TEMP12 AS SELECT P_ID, COUNT(*) QUANT FROM TEMP11 GROUP BY P_ID ORDER BY QUANT DESC LIMIT 5";
 	    		pstmt = con.prepareStatement(sql);
 	    		r = pstmt.executeUpdate();
 	    		
 	    		sql = "SELECT DISTINCT t.P_ID, i.PNAME, i.PRICE, t.QUANT FROM TEMP12 t, ITEMS i WHERE P_ID = PID";
 	    		pstmt = con.prepareStatement(sql);
 	    		rs = pstmt.executeQuery();
 	    		
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
 	     			out.println("<td>" +rs.getInt(1)+ "</td>");
 	     			out.println("<td>" +rs.getString(2)+ "</td>");
 	     			out.println("<td>" +rs.getInt(3)+ "</td>");
 	     			out.println("<td>" +rs.getInt(4)+ "</td>");
 	     		%>
 	     			<td><input type="text" name="order_q" id="order_q"/> </td>
 	     			<td><input type="submit" value="담기"/></td>
 	     		<% 
 	  				out.println("</tr>");
 	    		}
 	    		
 	    		out.println("</table>");
 	    		pstmt.close();
 	    	//	con.close();
 	    		
 			//}catch(Exception e){
 	    	//	e.printStackTrace();
 	   		//}finally{
 	    	//	if(rs!=null)try{rs.close();}catch(SQLException sqle){}
 	    	//	if(pstmt!=null)try{pstmt.close();}catch(SQLException sqle){}
 	    	//	if(con!=null)try{con.close();}catch(SQLException sqle){}
 	   	//	}
 		%>
 		</table>
      </div>

      <div id="tab2" class="tabcontent">
		<DIV class='aside_menu'>
  <FORM name='frm' method='GET' action='searchResult.jsp'>
    <ASIDE style='float: right;'>
      <SELECT name="col"> <!-- 검색 컬럼 -->
        <OPTION value="none">전체 목록</OPTION>
        <OPTION value="name">상품이름</OPTION>
        <OPTION value="number">상품번호</OPTION>
      </SELECT>
      <input type="text" name="search" value='' placeholder="특수문자는 사용할수 없습니다.">
      <button type="submit">검색</button> 
    </ASIDE> 
  </FORM>
  <DIV class='menu_line' style='clear: both;'></DIV>
</DIV>
      </div>

      <div id="tab3" class="tabcontent">
		<h2>ITEMS</h2>
		<form name="select_machine" method="post" action = 'show_items.jsp'>
 	BIG_CATEGORY :<select name="BIG" onChange="showSub(this.options[this.selectedIndex].value);"> 
 		<option value="선택하시오.">선택하시오</option>
 		<option value="drink">drink</option> 
 		<option value="fruits">fruits</option>
 		<option value="meat">meat</option>
 	</select>

 	<br><br>	
 	small_category :
 	
 	<select name="small1" style="display: ;">
 	<option value="선택하시오.">선택하시오</option>
 	<option value="coffee">coffee</option>
 	<option value="coke/sport">coke/sport</option>
 	<option value="water">water</option>
 	</select>
 	
 	<select name="small2" style="display: ;">
 	<option value="선택하시오.">선택하시오</option>
 	<option value="apple/peer">apple/peer</option>
 	<option value="bana/oran">bana/oran</option>
 	<option value="Peanuts">Peanuts</option>
 	</select>
 	
 	<select name="small3" style="display: ;">
 	<option value="선택하시오.">선택하시오</option>
 	<option value="beef">beef</option>
 	<option value="eggs">eggs</option>
 	<option value="hen/duck">hen/duck</option>
 	</select>
 	
 	<button onclick="location.href='show_items'.jsp'">확인</button>
 	</form>
			
			
			<table border="1" width="930px" align="center">
		<tr>
			<th>ID</th>
			<th>이름</th>
			<th>설명</th>
			<th>가격</th>
			<th>수량</th>
			
		</tr>
		</table>
      </div>
      
      <div id="tab4" class="tabcontent">
      
      <td colspan = "1" align ="center"><input type = "button" value ="정보확인" onclick = "location.href ='main_OK.jsp'"/></td>
      <td colspan = "1" align ="center"><input type = "button" value ="주문내역" onclick = "location.href ='cart.jsp'"/></td>
      
      </div>
      
       <div id="tab5" class="tabcontent">
       
      </div>
      
   </div>

   <script>
      $(function() {
         $('ul.tab li').click(function() {
            var activeTab = $(this).attr('data-tab');
            $('ul.tab li').removeClass('current');
            $('.tabcontent').removeClass('current');
            $(this).addClass('current');
            $('#' + activeTab).addClass('current');
         })
      });
   </script>
</form>
</FONT> <P>
</center>
</div>
</body>
</html>

--------------------------------------------------------------------------------
<2018.12.04> 수정완료
	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*" %>
    <%@ page import = "dbproject.*"%>
    <%@ page import = "java.util.*"%>
    <%!
 	String sql = "";
 	
 	Connection con = DBUtil.getMySQLConnection();
 	PreparedStatement pstmt = null;
 	PreparedStatement pstmt2 = null;
 	int r;
 	ResultSet rs = null;
 	ResultSet rs2 = null;
 	
 	String big;
 	int age;
 	int customer_id;
 %>
<!DOCTYPE html>
<html lang="ko">
<FONT FACE="Arial"> 
<head>
   <meta charset="UTF-8">
   
   <% request.setCharacterEncoding("utf-8"); %>
   <script language = "javascript"> 

 	function showSub(obj) {

     	f = document.forms.select_machine;
     	
		if(obj == "drink") {
     		
         	f.small1.style.display = "";
         	f.small2.style.display = "none";
         	f.small3.style.display = "none";
         	

     	} else if(obj == "fruits"){

         	f.small1.style.display = "none";
         	f.small2.style.display = "";
         	f.small3.style.display = "none";
         	
      	} else if(obj == "meat"){
      		f.small1.style.display = "none";
         	f.small2.style.display = "none";
         	f.small3.style.display = "";
      	} else {
      		f.small1.style.display = "none";
         	f.small2.style.display = "none";
         	f.small3.style.display = "none";
      	}
 	}
 	</script>
   <title>tab example</title>
   <style>
      #container {
         width:960px;
         margin:0 auto;
         text-align:center;
      }
      .tab {
         list-style: none;
         margin: 0;
         padding: 0;
         overflow: hidden;
      }

      .tab li {
         float: left;
      }
     
      .tab li a {
         display: inline-block;
         color: #000;
         text-align: center;
         text-decoration: none;
         padding: 14px 16px;
         font-size: 17px;
         transition:0.3s;
      }
   
      .tabcontent {
         display: none;
         background-color: rgb(0,154,200);
         padding: 6px 12px;
         color:#fff;
      }
      ul.tab li.current{
         background-color: rgb(0,154,200);
         color: #222;
      }
      .tabcontent.current {
         display: block;
      }
   </style>
   <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
</head>
<body>
<div>
<center>
<FONT FACE="Arial"> 

   <div id="container">
      <h2>Welcome to JJBJ_SHOP</h2>
      <td colspan = "4" align ="right"><input type = "button" value ="로그아웃" onclick = "location.href ='goodbye.jsp'"/></td>
      <ul class="tab">
         <li class="current" data-tab="tab1"><a href="#">MAIN</a></li>
         <li data-tab="tab2"><a href="#">SEARCH</a></li>
         <li data-tab="tab3"><a href="#">ITEMS</a></li>
         <li data-tab="tab4"><a href="#">MYPAGE</a></li>
         <li data-tab="tab5"><a href="#">MYCART</a></li>
         
      </ul>

      <div id="tab1" class="tabcontent current">
      
    
    	<%
    	String id = (String)session.getAttribute("id");
    	%>
      반갑습니다. <%=id %>번 고객님 !<br>
      <br>
      고객님을 위한 추천상품입니다. 
      
      <form action = "AddItemToCartResult.jsp" method = "post">
     <%
 			
     //try{
 	    		sql = "select id, age from customer where id = " +id ;
 	    		pstmt = con.prepareStatement(sql);
 	    		rs = pstmt.executeQuery();
 	    		
 	    		while(rs.next()){
 	    			customer_id = rs.getInt(1);
 	    			age = rs.getInt(2);
 	    		}
 	    		
 	    		int tmp = (age/10)*10;
 	    		
 	    		
 	    		
 	    	
 	    		
 	    		

 	    		sql = "DROP VIEW TEMP7";
 	    		pstmt = con.prepareStatement(sql);
 	    		r = pstmt.executeUpdate();
 	    		
 	    		
 	    		sql = "CREATE VIEW TEMP7 AS SELECT ID FROM CUSTOMER WHERE AGE BETWEEN " + (tmp) + " AND " + (tmp + 9);
 	    		pstmt = con.prepareStatement(sql);
 	    		r = pstmt.executeUpdate();
 	    		System.out.println(sql);
 	    		
 	    		sql = "DROP VIEW TEMP9";
 	    		pstmt = con.prepareStatement(sql);
 	    		r = pstmt.executeUpdate();
 	    		
 	    		
 	    		sql = "CREATE VIEW TEMP9 AS SELECT P_ID, COUNT(*) QUANT FROM ORDER_DETAIL, TEMP7 WHERE C_ID = ID GROUP BY P_ID ORDER BY QUANT  DESC LIMIT 1";
 	    		pstmt = con.prepareStatement(sql);
 	    		r = pstmt.executeUpdate();
 	    		System.out.println(sql);
 	    		
 	    		sql = "DROP VIEW TEMP10";
 	    		pstmt = con.prepareStatement(sql);
 	    		r = pstmt.executeUpdate();
 	    		
 	    		
 	    		sql = "CREATE VIEW TEMP10 AS SELECT O.C_ID FROM ORDER_DETAIL O WHERE O.P_ID = (SELECT P_ID FROM TEMP9)";
 	    		pstmt = con.prepareStatement(sql);
 	    		r = pstmt.executeUpdate();
 	    		System.out.println(sql);
 	    		
 	    		sql = "DROP VIEW TEMP11";
 	    		pstmt = con.prepareStatement(sql);
 	    		r = pstmt.executeUpdate();
 	    		
 	    		
 	    		sql = "CREATE VIEW TEMP11 AS SELECT O.P_ID FROM ORDER_DETAIL O, TEMP10 T WHERE T.C_ID = O.C_ID";
 	    		pstmt = con.prepareStatement(sql);
 	    		r = pstmt.executeUpdate();
 	    		System.out.println(sql);
 	    		
 	    		sql = "DROP VIEW TEMP12";
 	    		pstmt = con.prepareStatement(sql);
 	    		r = pstmt.executeUpdate();
 	    		
 	    		
 	    		sql = "CREATE VIEW TEMP12 AS SELECT P_ID, COUNT(*) QUANT FROM TEMP11 GROUP BY P_ID ORDER BY QUANT DESC LIMIT 5";
 	    		pstmt = con.prepareStatement(sql);
 	    		r = pstmt.executeUpdate();
 	    		System.out.println(sql);
 	    		
 	    		sql = "DROP view temp13";
 	    		pstmt = con.prepareStatement(sql);
 	    		r = pstmt.executeUpdate();
 	    		
 	    		
 	    		sql = "create view temp13 as select DISTINCT i.P_ID, t.AQ FROM temp12 i, TOTAL t where i.P_ID = t.PID";
				pstmt = con.prepareStatement(sql);
 	    		r = pstmt.executeUpdate();
 	    		System.out.println(sql);
 	    		
 	    		sql = "select DISTINCT PID, PNAME, PRICE, AQ FROM temp13, ITEMS where PID=P_ID";
 	    		pstmt = con.prepareStatement(sql);
 	    		rs = pstmt.executeQuery();
 	    		
 	    		out.println("<table border=\"1\" width=\"930px\" align=\"center\">");
 	    		ResultSetMetaData rsmd = rs.getMetaData();
 	    		
 	    		int cnt = rsmd.getColumnCount();
 	    		for (int i = 1; i <=cnt; i++){
 	    			out.println("<th>" + rsmd.getColumnName(i)+"</th>");
 	    		}
 	    		
 	    		while(rs.next()){
 	     			out.println("<tr>");
 	     				
 	    			out.println("<td>" +rs.getInt(1)+ "</td>");
 	     			out.println("<td>" +rs.getString(2)+ "</td>");
 	     			out.println("<td>" +rs.getInt(3)+ "</td>");
 	     			out.println("<td>" +rs.getInt(4)+ "</td>");
 	     			out.println("</tr>");
 	    		}
 	    			out.println("</table>");
 	     		%>
 	     			상품번호 : <td colspan = "1" align = "center"><td><input type = "text" name = "order_id" id = "order_id"></td>
 	     			상품수량 : <td colspan = "1" align = "center"><td><input type = "text" name = "order_q" id = "order_q"></td>
 	     			<td colspan = "1" align = "center"><td><input type = "submit" value = "담기"></button></td>
 	     		
 	     		<% 
 	    		pstmt.close();
 	    	//	con.close();
 	    		
 			//}catch(Exception e){
 	    	//	e.printStackTrace();
 	   		//}finally{
 	    	//	if(rs!=null)try{rs.close();}catch(SQLException sqle){}
 	    	//	if(pstmt!=null)try{pstmt.close();}catch(SQLException sqle){}
 	    	//	if(con!=null)try{con.close();}catch(SQLException sqle){}
 	   	//	}
 		%>
 		</table>
 		</form>
      </div>

      <div id="tab2" class="tabcontent">
		<DIV class='aside_menu'>
  <FORM name='frm' method='GET' action='searchResult.jsp'>
    <ASIDE style='float: right;'>
      <SELECT name="col"> <!-- 검색 컬럼 -->
        <OPTION value="none">전체상품</OPTION>
        <OPTION value="name">상품이름</OPTION>
        <OPTION value="number">상품번호</OPTION>
      </SELECT>
      <input type="text" name="search" value='' placeholder="전체상품을 볼 때는 입력 필요없음.">
      <button type="submit">검색</button> 
    </ASIDE> 
  </FORM>
  <DIV class='menu_line' style='clear: both;'></DIV>
</DIV>
      </div>

      <div id="tab3" class="tabcontent">
		<h2>ITEMS</h2>
		<form name="select_machine" method="post" action = 'show_items.jsp'>
 	BIG_CATEGORY :<select name="BIG" onChange="showSub(this.options[this.selectedIndex].value);"> 
 		<option value="선택하시오.">선택하시오</option>
 		<option value="drink">drink</option> 
 		<option value="fruits">fruits</option>
 		<option value="meat">meat</option>
 	</select>

 	<br><br>	
 	small_category :
 	
 	<select name="small1" style="display: ;">
 	<option value="선택하시오.">선택하시오</option>
 	<option value="coffee">coffee</option>
 	<option value="coke/sport">coke/sport</option>
 	<option value="water">water</option>
 	</select>
 	
 	<select name="small2" style="display: ;">
 	<option value="선택하시오.">선택하시오</option>
 	<option value="apple/peer">apple/peer</option>
 	<option value="bana/oran">bana/oran</option>
 	<option value="Peanuts">Peanuts</option>
 	</select>
 	
 	<select name="small3" style="display: ;">
 	<option value="선택하시오.">선택하시오</option>
 	<option value="beef">beef</option>
 	<option value="eggs">eggs</option>
 	<option value="hen/duck">hen/duck</option>
 	</select>
 	
 	<button onclick="location.href='show_items'.jsp'">확인</button>
 	</form>
			
			
			<table border="1" width="930px" align="center">
		<tr>
			<th>ID</th>
			<th>이름</th>
			<th>설명</th>
			<th>가격</th>
			<th>수량</th>
			
		</tr>
		</table>
      </div>
      
      <div id="tab4" class="tabcontent">
      
      <td colspan = "1" align ="center"><input type = "button" value ="정보확인" onclick = "location.href ='main_OK.jsp'"/></td>
      <td colspan = "1" align ="center"><input type = "button" value ="주문내역" onclick = "location.href ='Orderlog.jsp'"/></td>
      
      </div>
      
       <div id="tab5" class="tabcontent">
       <form action = "deleteCart.jsp" method = "post">
      
       고객님의 현재 장바구니 담기 내역 입니다.
       <table border="1" width="930px" align="center">
	
		<tr>
			<th>상품ID</th>
			<th>상품이름</th>
			<th>가격</th>
			<th>수량</th>

			<%
			
			int price_total = 0;
			sql = "SELECT DISTINCT PID, PNAME, PRICE, P_quant FROM shoppingBag, ITEMS WHERE PID=P_ID AND C_ID = " +customer_id;
				System.out.println(sql);
				pstmt2 = con.prepareStatement(sql);
				rs2 = pstmt2.executeQuery();
			
				
			while(rs2.next()){			
 	     		out.println("<tr>");	
				out.println("<td>" +rs2.getInt(1)+ "</td>");
 	     			out.println("<td>" +rs2.getString(2)+ "</td>");
 	     			out.println("<td>" +rs2.getInt(3)+ "</td>");
 	     			out.println("<td>" +rs2.getInt(4)+ "</td>");
 	     			out.println("</tr>");
 	     			price_total += rs2.getInt(3) * rs2.getInt(4);
				}
				out.println(price_total);
				
			%>
		</tr>
		</table>
		삭제 상품번호 : <td colspan = "1" align = "center"><td><input type = "text" name = "delete_id" id = "order_id"></td>
		<td colspan = "1" align ="center"><input type = "submit" value ="삭제하기"/></td>
		<tr>
		<%
	
		%>
       	<td colspan = "1" align ="center"><input type = "button" value ="주문하기" onclick = "location.href='Order.jsp'"/></td>
      	</tr>
      
       </form>
      </div>
      
   </div>

   <script>
      $(function() {
         $('ul.tab li').click(function() {
            var activeTab = $(this).attr('data-tab');
            $('ul.tab li').removeClass('current');
            $('.tabcontent').removeClass('current');
            $(this).addClass('current');
            $('#' + activeTab).addClass('current');
         })
      });
   </script>
</form>
</FONT> <P>
</center>
</div>
</body>
</html>


-----------------------

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*" %>
    <%@ page import = "dbproject.*"%>
    <%@ page import = "java.util.*"%>
    <%!
 	String sql = "";
 	
 	Connection con = DBUtil.getMySQLConnection();
 	PreparedStatement pstmt = null;
 	PreparedStatement pstmt2 = null;
 	int r;
 	ResultSet rs = null;
 	ResultSet rs2 = null;
 	
 	String big;
 	int age;
 	int customer_id;
 %>
<!DOCTYPE html>
<html lang="ko">
<FONT FACE="Arial"> 
<head>
   <meta charset="UTF-8">
   
   <% request.setCharacterEncoding("utf-8"); %>
   <script language = "javascript"> 

 	function showSub(obj) {

     	f = document.forms.select_machine;
     	
		if(obj == "drink") {
     		
         	f.small1.style.display = "";
         	f.small2.style.display = "none";
         	f.small3.style.display = "none";
         	

     	} else if(obj == "fruits"){

         	f.small1.style.display = "none";
         	f.small2.style.display = "";
         	f.small3.style.display = "none";
         	
      	} else if(obj == "meat"){
      		f.small1.style.display = "none";
         	f.small2.style.display = "none";
         	f.small3.style.display = "";
      	} else {
      		f.small1.style.display = "none";
         	f.small2.style.display = "none";
         	f.small3.style.display = "none";
      	}
 	}
 	</script>
   <title>tab example</title>
   <style>
      #container {
         width:960px;
         margin:0 auto;
         text-align:center;
      }
      .tab {
         list-style: none;
         margin: 0;
         padding: 0;
         overflow: hidden;
      }

      .tab li {
         float: left;
      }
     
      .tab li a {
         display: inline-block;
         color: #000;
         text-align: center;
         text-decoration: none;
         padding: 14px 16px;
         font-size: 17px;
         transition:0.3s;
      }
   
      .tabcontent {
         display: none;
         background-color: rgb(0,154,200);
         padding: 6px 12px;
         color:#fff;
      }
      ul.tab li.current{
         background-color: rgb(0,154,200);
         color: #222;
      }
      .tabcontent.current {
         display: block;
      }
   </style>
   <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
</head>
<body>
<div>
<center>
<FONT FACE="Arial"> 

   <div id="container">
      <h2>Welcome to JJBJ_SHOP</h2>
      <td colspan = "4" align ="right"><input type = "button" value ="로그아웃" onclick = "location.href ='goodbye.jsp'"/></td>
      <ul class="tab">
         <li class="current" data-tab="tab1"><a href="#">MAIN</a></li>
         <li data-tab="tab2"><a href="#">SEARCH</a></li>
         <li data-tab="tab3"><a href="#">ITEMS</a></li>
         <li data-tab="tab4"><a href="#">MYPAGE</a></li>
         <li data-tab="tab5"><a href="#">MYCART</a></li>
         
      </ul>

      <div id="tab1" class="tabcontent current">
      
    
    	<%
    	String id = (String)session.getAttribute("id");
    	%>
      반갑습니다. <%=id %>번 고객님 !<br>
      <br>
      고객님을 위한 추천상품입니다. 
      
      <form action = "AddItemToCartResult.jsp" method = "post">
     <%
 			
     //try{
 	    		sql = "select id, age from customer where id = " +id ;
 	    		pstmt = con.prepareStatement(sql);
 	    		rs = pstmt.executeQuery();
 	    		
 	    		while(rs.next()){
 	    			customer_id = rs.getInt(1);
 	    			age = rs.getInt(2);
 	    		}
 	    		
 	    		int tmp = (age/10)*10;
 	    		
 	    		
 	    		sql = "DROP VIEW TEMP7";
 	    		pstmt = con.prepareStatement(sql);
 	    		r = pstmt.executeUpdate();
 	    		
 	    		sql = "CREATE VIEW TEMP7 AS SELECT ID FROM CUSTOMER WHERE AGE BETWEEN " + (tmp) + " AND " + (tmp + 9);
 	    		pstmt = con.prepareStatement(sql);
 	    		r = pstmt.executeUpdate();
 	    		
 	    		sql = "DROP VIEW TEMP9";
 	    		pstmt = con.prepareStatement(sql);
 	    		r = pstmt.executeUpdate();
 	    		
 	    		sql = "CREATE VIEW TEMP9 AS SELECT P_ID, COUNT(*) QUANT FROM ORDER_DETAIL, TEMP7 WHERE C_ID = ID GROUP BY P_ID ORDER BY QUANT  DESC LIMIT 1";
 	    		pstmt = con.prepareStatement(sql);
 	    		r = pstmt.executeUpdate();
 	    		
 	    		sql = "DROP VIEW TEMP10";
 	    		pstmt = con.prepareStatement(sql);
 	    		r = pstmt.executeUpdate();
 	    		
 	    		sql = "CREATE VIEW TEMP10 AS SELECT O.C_ID FROM ORDER_DETAIL O WHERE O.P_ID = (SELECT P_ID FROM TEMP9)";
 	    		pstmt = con.prepareStatement(sql);
 	    		r = pstmt.executeUpdate();
 	    		
 	    		sql = "DROP VIEW TEMP11";
 	    		pstmt = con.prepareStatement(sql);
 	    		r = pstmt.executeUpdate();
 	    		
 	    		sql = "CREATE VIEW TEMP11 AS SELECT O.P_ID FROM ORDER_DETAIL O, TEMP10 T WHERE T.C_ID = O.C_ID";
 	    		pstmt = con.prepareStatement(sql);
 	    		r = pstmt.executeUpdate();
 	    		
 	    		sql = "DROP VIEW TEMP12";
 	    		pstmt = con.prepareStatement(sql);
 	    		r = pstmt.executeUpdate();
 	    		
 	    		sql = "CREATE VIEW TEMP12 AS SELECT P_ID, COUNT(*) QUANT FROM TEMP11 GROUP BY P_ID ORDER BY QUANT DESC LIMIT 5";
 	    		pstmt = con.prepareStatement(sql);
 	    		r = pstmt.executeUpdate();
 	    		
 	    		/* sql = "SELECT DISTINCT t.P_ID, i.PNAME, i.PRICE, t.QUANT FROM TEMP12 t, ITEMS i WHERE P_ID = PID";
 	    		pstmt = con.prepareStatement(sql);
 	    		rs = pstmt.executeQuery(); */
 	    		
 	    		sql = "DROP view temp13";
 	    		pstmt = con.prepareStatement(sql);
 	    		r = pstmt.executeUpdate();
 	    		
 	    		sql = "create view temp13 as select DISTINCT i.P_ID, t.AQ FROM temp12 i, TOTAL t where i.P_ID = t.PID";
				pstmt = con.prepareStatement(sql);
 	    		r = pstmt.executeUpdate();
 	    		
 	    		sql = "select DISTINCT PID, PNAME, PRICE, AQ FROM temp13, ITEMS where PID=P_ID";
 	    		pstmt = con.prepareStatement(sql);
 	    		rs = pstmt.executeQuery();
 	    		
 	    		out.println("<table border=\"1\" width=\"930px\" align=\"center\">");
 	    		ResultSetMetaData rsmd = rs.getMetaData();
 	    		
 	    		int cnt = rsmd.getColumnCount();
 	    		for (int i = 1; i <=cnt; i++){
 	    			out.println("<th>" + rsmd.getColumnName(i)+"</th>");
 	    		}
 	    		
 	    		while(rs.next()){
 	     			out.println("<tr>");
 	     				
 	    			out.println("<td>" +rs.getInt(1)+ "</td>");
 	     			out.println("<td>" +rs.getString(2)+ "</td>");
 	     			out.println("<td>" +rs.getInt(3)+ "</td>");
 	     			out.println("<td>" +rs.getInt(4)+ "</td>");
 	     			out.println("</tr>");
 	    		}
 	    			out.println("</table>");
 	     		%>
 	     			상품번호 : <td colspan = "1" align = "center"><td><input type = "text" name = "order_id" id = "order_id"></td>
 	     			상품수량 : <td colspan = "1" align = "center"><td><input type = "text" name = "order_q" id = "order_q"></td>
 	     			<td colspan = "1" align = "center"><td><input type = "submit" value = "담기"></button></td>
 	     		
 	     		<% 
 	    		pstmt.close();
 	    	//	con.close();
 	    		
 			//}catch(Exception e){
 	    	//	e.printStackTrace();
 	   		//}finally{
 	    	//	if(rs!=null)try{rs.close();}catch(SQLException sqle){}
 	    	//	if(pstmt!=null)try{pstmt.close();}catch(SQLException sqle){}
 	    	//	if(con!=null)try{con.close();}catch(SQLException sqle){}
 	   	//	}
 		%>
 		</table>
 		</form>
      </div>

      <div id="tab2" class="tabcontent">
		<DIV class='aside_menu'>
  <FORM name='frm' method='GET' action='searchResult.jsp'>
    <ASIDE style='float: right;'>
      <SELECT name="col"> <!-- 검색 컬럼 -->
        <OPTION value="none">전체상품</OPTION>
        <OPTION value="name">상품이름</OPTION>
        <OPTION value="number">상품번호</OPTION>
      </SELECT>
      <input type="text" name="search" value='' placeholder="전체상품을 볼 때는 입력 필요없음.">
      <button type="submit">검색</button> 
    </ASIDE> 
  </FORM>
  <DIV class='menu_line' style='clear: both;'></DIV>
</DIV>
      </div>

      <div id="tab3" class="tabcontent">
		<h2>ITEMS</h2>
		<form name="select_machine" method="post" action = 'show_items.jsp'>
 	BIG_CATEGORY :<select name="BIG" onChange="showSub(this.options[this.selectedIndex].value);"> 
 		<option value="선택하시오.">선택하시오</option>
 		<option value="drink">drink</option> 
 		<option value="fruits">fruits</option>
 		<option value="meat">meat</option>
 	</select>

 	<br><br>	
 	small_category :
 	
 	<select name="small1" style="display: ;">
 	<option value="선택하시오.">선택하시오</option>
 	<option value="coffee">coffee</option>
 	<option value="coke/sport">coke/sport</option>
 	<option value="water">water</option>
 	</select>
 	
 	<select name="small2" style="display: ;">
 	<option value="선택하시오.">선택하시오</option>
 	<option value="apple/peer">apple/peer</option>
 	<option value="bana/oran">bana/oran</option>
 	<option value="Peanuts">Peanuts</option>
 	</select>
 	
 	<select name="small3" style="display: ;">
 	<option value="선택하시오.">선택하시오</option>
 	<option value="beef">beef</option>
 	<option value="eggs">eggs</option>
 	<option value="hen/duck">hen/duck</option>
 	</select>
 	
 	<button onclick="location.href='show_items'.jsp'">확인</button>
 	</form>
			
      </div>
      
      <div id="tab4" class="tabcontent">
      
      <td colspan = "1" align ="center"><input type = "button" value ="정보확인" onclick = "location.href ='main_OK.jsp'"/></td>
      <td colspan = "1" align ="center"><input type = "button" value ="주문내역" onclick = "location.href ='Orderlog.jsp'"/></td>
      
      </div>
      
       <div id="tab5" class="tabcontent">
       <form action = "deleteCart.jsp" method = "post">
      
       고객님의 현재 장바구니 담기 내역 입니다.
       <table border="1" width="930px" align="center">
	
		<tr>
			<th>상품ID</th>
			<th>상품이름</th>
			<th>가격</th>
			<th>수량</th>

			<%
			
			int price_total = 0;
			sql = "SELECT DISTINCT PID, PNAME, PRICE, P_quant FROM shoppingBag, ITEMS WHERE PID=P_ID AND C_ID = " +customer_id;
				System.out.println(sql);
				pstmt2 = con.prepareStatement(sql);
				rs2 = pstmt2.executeQuery();
			
				
			while(rs2.next()){			
 	     		out.println("<tr>");	
				out.println("<td>" +rs2.getInt(1)+ "</td>");
 	     			out.println("<td>" +rs2.getString(2)+ "</td>");
 	     			out.println("<td>" +rs2.getInt(3)+ "</td>");
 	     			out.println("<td>" +rs2.getInt(4)+ "</td>");
 	     			out.println("</tr>");
 	     			price_total += rs2.getInt(3) * rs2.getInt(4);
				}
			
				
			%>
		</tr>
		</table>
		삭제 상품번호 : <td colspan = "1" align = "center"><td><input type = "text" name = "delete_id" id = "order_id"></td>
		<td colspan = "1" align ="center"><input type = "submit" value ="삭제하기"/></td>
		<tr>
		<%

				out.println("총가격 :" + price_total);
			
		%>
       	<td colspan = "1" align ="center"><input type = "button" value ="주문하기" onclick = "location.href='Order.jsp'"/></td>
      	</tr>
      
       </form>
      </div>
      
   </div>

   <script>
      $(function() {
         $('ul.tab li').click(function() {
            var activeTab = $(this).attr('data-tab');
            $('ul.tab li').removeClass('current');
            $('.tabcontent').removeClass('current');
            $(this).addClass('current');
            $('#' + activeTab).addClass('current');
         })
      });
   </script>
</form>
</FONT> <P>
</center>
</div>
</body>
</html>
