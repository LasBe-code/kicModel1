<%@page import="java.util.ArrayList"%>
<%@page import="model.Member"%>
<%@page import="service.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
int num = 0;

String msg = "비밀번호가 틀립니다.";
String url = request.getContextPath()+"/view/member/memberUpdate.jsp";
String login = (String)session.getAttribute("memberId");
if(login == null || login.trim().equals("")) { %>
	<script>
		alert("로그인이 필요합니다.")
		location.href="<%=request.getContextPath()%>/view/member/loginForm.jsp"
	</script>
<%} else { 
String pass = request.getParameter("pass");
String tel = request.getParameter("tel");
String email = request.getParameter("email");

MemberDao md = new MemberDao();
Member mem = md.selectOne(login);

mem.setEmail(email);
mem.setTel(tel);



if(mem.getPass().equals(pass)){
	num = md.memberUpdate(mem);
	msg = "회원 정보가 수정 되었습니다";
	url = request.getContextPath()+"/view/main.jsp";
}

} %><%=num %>
<script>
alert("<%=msg %>")
location.href="<%=url %>"
</script>
</body>
</html>