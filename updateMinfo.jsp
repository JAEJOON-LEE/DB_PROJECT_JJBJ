<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "dbproject.DBUtil"%>
<%@ page import = "dbproject.loginCheck"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr" />

<title>회원정보수정</title>
<style type="text/css">
span{
  font-size: 15px;
}
#checkMsg{
  font-size: 12px;
}
#checkPwd{
  color : red;
  font-size: 12px;
}
</style>
<script type="text/javascript" src="httpRequest.js"></script>
<script type="text/javascript">

 var checkFirst = false;
 var lastKeyword = '';
 var loopSendKeyword = false;
 
 function checkId() {
  if (checkFirst == false) {
   setTimeout("sendId();", 50);
   loopSendKeyword = true;
  }
  checkFirst = true;
 }
 
 function checkPwd(){
  var f1 = document.forms[0];
  var pw1 = f1.pwd.value;
  var pw2 = f1.pwd_check.value;
  if(pw1!=pw2){
   document.getElementById('checkPwd').style.color = "red";
   document.getElementById('checkPwd').innerHTML = "동일한 암호를 입력하세요."; 
   check = 1;
  }else{
   document.getElementById('checkPwd').style.color = "blue";
   document.getElementById('checkPwd').innerHTML = "암호가 동일합니다."; 
   check = 0;
  }
 }
 
 function sendId() {
  if (loopSendKeyword == false) return;
  
  var keyword = document.search.u_id.value;
  if (keyword == '') {
   lastKeyword = '';
   document.getElementById('checkMsg').style.color = "black";
   document.getElementById('checkMsg').innerHTML = "아이디를 입력하세요.";
  } else if (keyword != lastKeyword) {
   lastKeyword = keyword;
   
   if (keyword != '') {
    var params = "id="+encodeURIComponent(keyword);
    sendRequest("id_check.jsp", params, displayResult, 'POST');
   } else {
   }
  }
  setTimeout("sendId();", 500);
 }
 
 
 function displayResult() {
  if (httpRequest.readyState == 4) {
   if (httpRequest.status == 200) {
    var resultText = httpRequest.responseText;
    var listView = document.getElementById('checkMsg');
    if(resultText==0){
     listView.innerHTML = "사용 할 수 있는 ID 입니다";
     listView.style.color = "blue";
    }else{
     listView.innerHTML = "이미 등록된 ID 입니다";
     listView.style.color = "red";
    }
   } else {
    alert("에러 발생: "+httpRequest.status);
   }
  }
 }
</script>

</head>
<body>
<div>
<center>
<FONT FACE="Arial"> 
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("id");
	
	Connection conn = DBUtil.getMySQLConnection();
	
	//비번 주소 성별 나이 직업	수정가능.
	String sql;
	
	PreparedStatement pstmt;
	
//	pstmt.executeUpdate();
	
%>
	
<form action="updateOK.jsp" method="post"> 
<input type ="hidden" name = "ip", value ="<%=request.getRemoteAddr()%>"/>
<div>
  <h3><%=id %>번 고객님 회원정보수정</h3>
  <h4>아래 항목을 수정해주세요.</h4>
  <h5>(수정이 필요없는 항목은 비워두시면 됩니다.)</h5>
</div>
<table border="1">
  
  <tr>
     <td align="center"><span>*PASSWORD</span></td>
     <td><input type="password" name="pwd"></input></td>
  </tr>
  
  <tr>
    <td align="center"><span>*PW CHECK</span>
    </td>
     <td>
        <input type="password" name="pwd_check" onkeyup="checkPwd()"></input>
        <div id="checkPwd">동일한 암호를 입력하세요.</div>
     </td>
  </tr>
  
  <tr>
     <td align="center"><span>*HP</span></td>
     <td><input type="text" name="C_hp"></input></td>
  </tr>
  <%
  	String hp = request.getParameter("C_hp");
  	if(hp != null)
	{
	  sql = "update customer set hp = '" + hp + "' where id =" + id;
	  pstmt = conn.prepareStatement(sql);
	  pstmt.executeUpdate();
	}
  %>
  
   <tr>
     <td align="center"><span>*ADDRESS</span></td>
     <td><input type="text" name="C_ad"></input></td>
  </tr>
  <%
  	String ad = request.getParameter("C_ad");
  	if(ad != null)
	{
	  sql = "update customer set address = '" + ad + "' where id =" + id;
	  pstmt = conn.prepareStatement(sql);
	  pstmt.executeUpdate();
	}
  %>
  
   <tr>
     <td align="center"><span>AGE</span></td>
     <td><input type="text" name="C_age"></input></td>
  </tr>
  <%
  	String age = request.getParameter("C_age");
  	if(age != null)
	{
	  sql = "update customer set age = " + age + " where id =" + id;
	  pstmt = conn.prepareStatement(sql);
	  pstmt.executeUpdate();
	}
  %>
  
   <tr>
     <td align="center"><span>JOB</span></td>
     <td><input type="text" name="C_job"></input></td>
  </tr>
  <%
  	String job = request.getParameter("C_job");
  	if(job != null)
	{
	  sql = "update customer set job = '" + job + "' where id =" + id;
	  pstmt = conn.prepareStatement(sql);
	  pstmt.executeUpdate();
	}
  %>
  
   <tr>
     <td align="center"><span>SEX</span></td>
     <td><select name = "C_sex">
				<option value = "M">M</option>
				<option value = "W">W</option>
				</select></td>
  </tr>
  <%
  	String sex = request.getParameter("C_sex");
  	if(sex != null)
	{
	  sql = "update customer set sex = '" + sex + "' where id =" + id;
	  pstmt = conn.prepareStatement(sql);
	  pstmt.executeUpdate();
	}
  %>
 
  <tr>
  	<td colspan = "2" align = "center"><input type ="submit" value = "수정"/></td>
  </tr>
  
</table>
 
</form>
</FONT> <P>
</center>
</div>
</body>
</html>

--------------------------------

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "dbproject.DBUtil"%>
<%@ page import = "dbproject.loginCheck"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr" />

<title>회원정보수정</title>
<style type="text/css">
span{
  font-size: 15px;
}
#checkMsg{
  font-size: 12px;
}
#checkPwd{
  color : red;
  font-size: 12px;
}
</style>
<script type="text/javascript" src="httpRequest.js"></script>
<script type="text/javascript">

 var checkFirst = false;
 var lastKeyword = '';
 var loopSendKeyword = false;
 
 function checkId() {
  if (checkFirst == false) {
   setTimeout("sendId();", 50);
   loopSendKeyword = true;
  }
  checkFirst = true;
 }
 
 function checkPwd(){
  var f1 = document.forms[0];
  var pw1 = f1.pwd.value;
  var pw2 = f1.pwd_check.value;
  if(pw1!=pw2){
   document.getElementById('checkPwd').style.color = "red";
   document.getElementById('checkPwd').innerHTML = "동일한 암호를 입력하세요."; 
   check = 1;
  }else{
   document.getElementById('checkPwd').style.color = "blue";
   document.getElementById('checkPwd').innerHTML = "암호가 동일합니다."; 
   check = 0;
  }
 }
 
 function sendId() {
  if (loopSendKeyword == false) return;
  
  var keyword = document.search.u_id.value;
  if (keyword == '') {
   lastKeyword = '';
   document.getElementById('checkMsg').style.color = "black";
   document.getElementById('checkMsg').innerHTML = "아이디를 입력하세요.";
  } else if (keyword != lastKeyword) {
   lastKeyword = keyword;
   
   if (keyword != '') {
    var params = "id="+encodeURIComponent(keyword);
    sendRequest("id_check.jsp", params, displayResult, 'POST');
   } else {
   }
  }
  setTimeout("sendId();", 500);
 }
 
 
 function displayResult() {
  if (httpRequest.readyState == 4) {
   if (httpRequest.status == 200) {
    var resultText = httpRequest.responseText;
    var listView = document.getElementById('checkMsg');
    if(resultText==0){
     listView.innerHTML = "사용 할 수 있는 ID 입니다";
     listView.style.color = "blue";
    }else{
     listView.innerHTML = "이미 등록된 ID 입니다";
     listView.style.color = "red";
    }
   } else {
    alert("에러 발생: "+httpRequest.status);
   }
  }
 }
</script>

</head>
<body>
<div>
<center>
<FONT FACE="Arial"> 
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("id");
	
	Connection conn = DBUtil.getMySQLConnection();
	
	//비번 주소 성별 나이 직업	수정가능.
	String sql;
	
	PreparedStatement pstmt;
	
//	pstmt.executeUpdate();
	
%>
	
<form action="updateOK.jsp" method="post"> 
<input type ="hidden" name = "ip", value ="<%=request.getRemoteAddr()%>"/>
<div>
  <h3><%=id %>번 고객님 회원정보수정</h3>
  <h4>아래 항목을 수정해주세요.</h4>
  <h5>(수정이 필요없는 항목은 비워두시면 됩니다.)</h5>
</div>
<table border="1">
  
  <tr>
     <td align="center"><span>*PASSWORD</span></td>
     <td><input type="password" name="pwd"></input></td>
  </tr>
  
  <tr>
    <td align="center"><span>*PW CHECK</span>
    </td>
     <td>
        <input type="password" name="pwd_check" onkeyup="checkPwd()"></input>
        <div id="checkPwd">동일한 암호를 입력하세요.</div>
     </td>
  </tr>
  
  <tr>
     <td align="center"><span>*HP</span></td>
     <td><input type="text" name="C_hp"></input></td>
  </tr>
  <%
  	String hp = request.getParameter("C_hp");
  	if(hp != null)
	{
	  sql = "update customer set hp = '" + hp + "' where id =" + id;
	  pstmt = conn.prepareStatement(sql);
	  pstmt.executeUpdate();
	}
  %>
  
   <tr>
     <td align="center"><span>*ADDRESS</span></td>
     <td><input type="text" name="C_ad"></input></td>
  </tr>
  <%
  	String ad = request.getParameter("C_ad");
  	if(ad != null)
	{
	  sql = "update customer set address = '" + ad + "' where id =" + id;
	  pstmt = conn.prepareStatement(sql);
	  pstmt.executeUpdate();
	}
  %>
  
   <tr>
     <td align="center"><span>AGE</span></td>
     <td><input type="text" name="C_age"></input></td>
  </tr>
  <%
  	String age = request.getParameter("C_age");
  	if(age != null)
	{
	  sql = "update customer set age = " + age + " where id =" + id;
	  pstmt = conn.prepareStatement(sql);
	  pstmt.executeUpdate();
	}
  %>
  
   <tr>
     <td align="center"><span>JOB</span></td>
     <td><input type="text" name="C_job"></input></td>
  </tr>
  <%
  	String job = request.getParameter("C_job");
  	if(job != null)
	{
	  sql = "update customer set job = '" + job + "' where id =" + id;
	  pstmt = conn.prepareStatement(sql);
	  pstmt.executeUpdate();
	}
  %>
  
   <tr>
     <td align="center"><span>SEX</span></td>
     <td><select name = "C_sex">
				<option value = "M">M</option>
				<option value = "W">W</option>
				</select></td>
  </tr>
  <%
  	String sex = request.getParameter("C_sex");
  	if(sex != null)
	{
	  sql = "update customer set sex = '" + sex + "' where id =" + id;
	  pstmt = conn.prepareStatement(sql);
	  pstmt.executeUpdate();
	}
  %>
 
  <tr>
  	<td colspan = "2" align = "center"><input type ="submit" value = "수정"/></td>
  </tr>
  
</table>
 
</form>
</FONT> <P>
</center>
</div>
</body>
</html>
