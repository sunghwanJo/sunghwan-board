<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>글쓰기 화면</h1>
<form action="/board/${board.id}" method="POST" enctype="multipart/form-data">
	<div>
		<label for="title">제목 : </label>
		<input type="text" name="title" size=30 value="${board.title}"/>
	</div>
	<div>
		<textarea name="contents" cols="40" rows="5">${board.contents}</textarea>
	</div>
	<div>
		<label for="file">파일</label>
		<input type="file" name="file" size=30 />
	</div>
	<div>
		<input type="submit" value="수정하기">
	</div>
</form>
</body>
</html>