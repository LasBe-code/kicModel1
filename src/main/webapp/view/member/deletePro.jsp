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
String msg="";
String url="";
String login = (String)session.getAttribute("memberId");
if(login == null || login.trim().equals("")) { %>
	<script>
		alert("로그인이 필요합니다.")
		location.href="<%=request.getContextPath()%>/view/member/loginForm.jsp"
	</script>
<%} else { 
String pass = request.getParameter("pass");

MemberDao md = new MemberDao();

Member mb = md.selectOne(login);

if(mb.getPass().equals(pass)){ // password check ok
	int num = md.deleteMember(login);
	
	if(num==0){ // delete not
		msg=login+"님의 탈퇴시 오류가 발생했습니다.";
		url=request.getContextPath()+"/view/main.jsp";
	} else { // delete ok
		session.invalidate();
		msg=login+"님의 회원 탈퇴 완료";
		url=request.getContextPath()+"/view/main.jsp";
	}
} else{ // password check fail
	msg = "비밀번호가 일치하지 않습니다.";
	url =request.getContextPath()+"/view/member/deleteForm.jsp";
}
} %>
<script>
alert("<%=msg%>")
location.href="<%=url%>"
</script>
</body>
</html>