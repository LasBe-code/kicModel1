<%@page import="service.BoardDao"%>
<%@page import="model.Board"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
String pass = request.getParameter("pass");
int num = Integer.parseInt(request.getParameter("num"));
BoardDao bd = new BoardDao();
Board board = bd.boardOne(num);
String msg = "비밀번호가 틀렸습니다.";
String url = "boardDelete.jsp?num="+num;

if(pass.equals(board.getPass())){
	if(bd.boardDelete(num)>0){
		msg = "게시글이 삭제 되었습니다.";
	} else {
		msg = "게시글이 삭제에 실패했습니다.";
	}
	url = "list.jsp";
}

%>
<script>
alert('<%=msg%>')
location.href='<%=url%>'
</script>
</body>
</html>