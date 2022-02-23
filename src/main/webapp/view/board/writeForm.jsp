<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<hr>
<div class="container">
	<form name="f" action="writePro.jsp" enctype="multipart/form-data" method="post">
	<h2 id="center">게시판 입력</h2>
		<div class="form-group">
			<label for="id">작성자</label> 
			<input type="text" class="form-control" name="writer"> 
			
			<label for="pwd">비밀번호</label>
			<input type="password" class="form-control" name="pass"> 
			
			<label>제목</label> 
			<input type="text" class="form-control" name="subject"> 
		</div>
			
		
		<div class="form-group">
			<label>내용</label>
			<textarea class="form-control" rows="10" cols="50" name="content"></textarea>
		</div>
		<div class="form-group">
			<label for="tel">파일저장</label> 
			<input type="file" class="form-control" name="file1">
		</div>
	
		<div id="center" style="padding: 3px;">
			<button type="submit" class="btn btn-dark">글 작성</button>
			<!-- bootstrap에서는 button type이 submit 이어도 데이터 전송이 가능케 한다. -->
		</div>
	</form>
</div>
</body>
</html>