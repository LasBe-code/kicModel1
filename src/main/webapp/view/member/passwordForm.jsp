<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function inputchk(f){
	if(f.pass.value==""){
		alert("비밀번호를 입력하세요")
		f.pass.focus()
		return false
	}
	if(f.newpass.value==""){
		alert("새 비밀번호를 입력하세요")
		f.newpass.focus()
		return false
	}
	if(f.newpass.value != f.newpass2.value){
		alert("새 비밀번호를 확인하세요")
		f.newpass2.value=""
		f.newpass2.focus()
		return false
	}
	if(f.pass.value == f.newpass.value){
		alert("현재 비밀번호와 다른 비밀번호를 입력하세요.")
		f.newpass.value=""
		f.newpass.focus()
		return false
	}
	return true
}

</script>
</head>
<body>
<%
String login = (String)session.getAttribute("memberId");
if(login == null || login.trim().equals("")){ %>
	<script>
	alert("로그인이 필요 합니다.")
	location.href="<%=request.getContextPath()%>/view/member/loginForm.jsp";
	</script>
<%} else { %>
	<div class="container">
		<h2   id="center">비밀번호 변경</h2>
		<form action="<%=request.getContextPath()%>/view/member/passwordPro.jsp" method="post" onsubmit="return inputchk(this)">
			<div class="form-group">
				<label>ID:</label> 
				<input type="text" class="form-control" readonly="readonly" name="id" value="<%=login %>"> 
				<label for="pwd">현재 비밀번호:</label>
				<input type="password" class="form-control" name="pass">
				<label for="pwd">변경할 비밀번호:</label>
				<input type="password" class="form-control" name="newpass">
				<label for="pwd">변경할 비밀번호 확인:</label>
				<input type="password" class="form-control" name="newpass2">
			</div>
			<div id="center" style="padding: 3px;">
				<input type="submit" class="btn btn-dark" value="비밀번호 변경">
			</div>
		</form>
	</div>



<%} %>
</body>
</html>