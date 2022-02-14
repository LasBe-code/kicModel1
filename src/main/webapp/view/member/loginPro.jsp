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
String id = request.getParameter("id");
String pass = request.getParameter("pass");
MemberDao md = new MemberDao();

// id가 없으면 mem=null, 있으면 mem=id와 일치하는 계정 정보 리턴
Member mem = md.selectOne(id);

String msg = "아이디를 확인하세요";
String url = request.getContextPath()+"/view/member/loginForm.jsp";

if(mem != null){
	if(pass.equals(mem.getPass())){ //로그인 성공
		session.setAttribute("memberId", id);
		msg = mem.getName() + "님이 로그인 하셨습니다.";
		url = request.getContextPath()+"/view/main.jsp";
	} else { // 아이디 o / 패스워드 x
		msg = "비밀번호를 확인하세요.";
	}
}
%>
<script>
alert("<%=msg%>")
location.href="<%=url%>"
</script>

</body>
</html>