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
String login = (String)session.getAttribute("memberId");
session.invalidate(); // 세션과 관련된 모든 데이터 날리는 메소드
%>
<script>
	alert("<%=login%>님이 로그아웃 되었습니다.")
	location.href="<%=request.getContextPath()%>/view/member/loginForm.jsp"
</script>
</body>
</html>