<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>글쓰기 화면</h1>
<form action="/board" method="POST" enctype="multipart/form-data">
	<div><label for="title">제목 : </label><input type="text" name="title" size=30 /></div>
	<div><textarea name="contents" cols="40" rows="5"></textarea></div>
	<div><label for="file">제목 : </label><input type="file" name="file" size=30 /></div>
	<div><input type="submit" value="올리기"></div>
</form>
</body>
</html>