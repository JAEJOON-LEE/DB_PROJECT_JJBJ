<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<%!
	String driver = "org.gjt.mm.mysql.Driver";
	String url = "jdbc:mysql://127.0.0.1:3306/mysql?useUnicode=true&characterEncoding=euckr";
	String dbID = "root";
	String dbPW = "wowns3303!";
	String query = "";
	
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	%>

<%@ page language="java" import="java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인</title>
</head>
<body>
<%
try {
	Class.forName(driver);
	con = DriverManager.getConnection(url, dbID, dbPW);
	stmt = con.createStatement();
//	rs = stmt.executeQuery(query);
	
	System.out.println("DB connect OK");
	
}catch(Exception e)
{
	System.out.println("ERROR!!!!!");
}
	%>
	
	<h2>환영합니다!</h2>
	<h3>Log-in</h3>
	
	<form method ="post" action = "id_check.jsp">
		<label for ="M_id">ID</label>
		<input id ="M_id" name = "M_id" type="text"><br>
		<label for ="M_pw">PW</label>
		<input id ="M_pw" name = "M_pw" type="password"><br>
		<button onclick="window.open('joinPage.jsp', 'SIGN-UP', 'width=100, height=100, location=no, status=no, srollbars=yes');">SIGN UP</button>
		<button onclick="location.href='id_check.jsp'">SIGN IN</button>
	</form>
</body>
</html>

<%-- sign in 눌렀을 때, 잘못입력하 아이디가 존재하지 않거나 비밀번호가 틀렸습니다. 출력해줘야 --%>

<%-- SIGN-UP 버튼 클릭시, 회원가입 팝업창(윈도우창)으로 이동할 수 있도록 버튼 onclick 코드 추가// 2018/11/23 --%>
<%--//SIGN-IN 버튼 클릭시, 회원으로 등록된 사용자가 로그인 했을 경우, 다음 실행 페이지로 넘어갈 수 있도록 버튼 onclick 코드를 추가함// 2018/11/23 --%>
</html>
</html>
