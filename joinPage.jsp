<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr" />
<title>회원가입</title>
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
	
<form action="joinOK.jsp" method="post">
<input type ="hidden" name = "ip", value ="<%=request.getRemoteAddr()%>"/>
<div>
  <h3>회원가입</h3>
  <h4>_*_이 있는 항목은 반드시 입력하셔야 합니다!</h4>
</div>
<table border="1">
  <tr>
     <td align="center"><span>*ID</span></td>
     <td>
        <input type="text" name="u_id" id="u_id" onkeydown="checkId()" />  
        <div id="checkMsg">아이디는 숫자로 만들어주세요.</div>
     </td>
  </tr>
  
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
  
   <tr>
     <td align="center"><span>*ADDRESS</span></td>
     <td><input type="text" name="C_ad"></input></td>
  </tr>
  
   <tr>
     <td align="center"><span>AGE</span></td>
     <td><input type="text" name="C_age"></input></td>
  </tr>
  
   <tr>
     <td align="center"><span>JOB</span></td>
     <td><input type="text" name="C_job"></input></td>
  </tr>
  
   <tr>
     <td align="center"><span>SEX</span></td>
     <td><select name = "C_sex">
				<option value = "M">M</option>
				<option value = "W">W</option>
				</select></td>
  </tr>
 
  <tr>
     <td colspan="2" align="right"><input type="submit" value="SIGN UP" onClick="window.close()"></td>
  </tr>
  
</table>
 
</form>
</body>
</html>

--------------------------

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import = "java.sql.*" %>
    <%@ page import = "dbproject.DBUtil"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr" />
<title>회원가입</title>
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
 
 function checkNull(){
	  var f1 = document.value;
	  
	  if(f1.length() < 1) {
		  alert("필수항목을 입력해주세요.");
			obj.id.focus();
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

<form action="joinOK.jsp" method="post">
<input type ="hidden" name = "ip", value ="<%=request.getRemoteAddr()%>"/>
<div>
  <h3>회원가입</h3>
  <h4>_*_이 있는 항목은 반드시 입력하셔야 합니다!</h4>
</div>
<table border="1">
  <tr>
     <td align="center"><span>*ID</span></td>
     <td>
        <input type="text" name="u_id" id="u_id" onkeydown="checkId()" onkeyup="checkNull()"/>  
        <div id="checkMsg">아이디는 숫자만 가능합니다ㅜㅜ</div>
     </td>
  </tr>
  
  <tr>
     <td align="center"><span>*PASSWORD</span></td>
     <td><input type="password" name="pwd" onkeyup="checkNull()"></input></td>
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
     <td><input type="text" name="C_hp" onkeyup="checkNull()"></input></td>
  </tr>
  
   <tr>
     <td align="center"><span>*ADDRESS</span></td>
     <td><input type="text" name="C_ad" onkeyup="checkNull()"></input></td>
  </tr>
  
   <tr>
     <td align="center"><span>AGE</span></td>
     <td><input type="text" name="C_age"></input></td>
  </tr>
  
   <tr>
     <td align="center"><span>JOB</span></td>
     <td><input type="text" name="C_job"></input></td>
  </tr>
  
   <tr>
     <td align="center"><span>SEX</span></td>
     <td><select name = "C_sex">
				<option value = "M">M</option>
				<option value = "W">W</option>
				</select></td>
  </tr>
  
</table>
<tr>
  	<td colspan = "1" align = "center"><input type ="submit" value = "회원가입"/></td>
  	<td colspan = "1" align ="center"><input type = "button" value ="취소" onclick = "location.href ='main.jsp'"/></td>
  </tr>
 
</form>
</FONT> <P>
</center>
</div>
</body>
</html>

---------------------------

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="content-type" content="text/html; charset=euc-kr" />
<title>회원가입</title>
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
 
 function checkNull(){
	  var f1 = document.value;
	  
	  if(f1.length() < 1) {
		  alert("필수항목을 입력해주세요.");
			obj.id.focus();
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

<form action="joinOK.jsp" method="post">
<input type ="hidden" name = "ip", value ="<%=request.getRemoteAddr()%>"/>
<div>
  <h3>회원가입</h3>
  <h4>_*_이 있는 항목은 반드시 입력하셔야 합니다!</h4>
</div>
<table border="1">
  <tr>
     <td align="center"><span>*ID</span></td>
     <td>
        <input type="text" name="u_id" id="u_id" onkeydown="checkId()" onkeyup="checkNull()"/>  
        <div id="checkMsg">아이디는 숫자만 가능합니다ㅜㅜ</div>
     </td>
  </tr>
  
  <tr>
     <td align="center"><span>*PASSWORD</span></td>
     <td><input type="password" name="pwd" onkeyup="checkNull()"></input></td>
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
     <td><input type="text" name="C_hp" onkeyup="checkNull()"></input></td>
  </tr>
  
   <tr>
     <td align="center"><span>*ADDRESS</span></td>
     <td><input type="text" name="C_ad" onkeyup="checkNull()"></input></td>
  </tr>
  
   <tr>
     <td align="center"><span>*AGE</span></td>
     <td><input type="text" name="C_age"></input></td>
  </tr>
  
   <tr>
     <td align="center"><span>JOB</span></td>
     <td><input type="text" name="C_job"></input></td>
  </tr>
  
   <tr>
     <td align="center"><span>SEX</span></td>
     <td><select name = "C_sex">
				<option value = "M">M</option>
				<option value = "W">W</option>
				</select></td>
  </tr>
  
</table>
<tr>
  	<td colspan = "1" align = "center"><input type ="submit" value = "회원가입"/></td>
  	<td colspan = "1" align ="center"><input type = "button" value ="취소" onclick = "location.href ='main.jsp'"/></td>
  </tr>
 
</form>
</FONT> <P>
</center>
</div>
</body>
</html>
