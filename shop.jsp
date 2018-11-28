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
