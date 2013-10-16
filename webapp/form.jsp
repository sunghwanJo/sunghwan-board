<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>글쓰기 화면</h1>
	<c:choose>
		<c:when test="${ not empty sessionScope.email }">
			<form action="/board/${board.id}" method="POST"
				enctype="multipart/form-data">
				<div>
					<label for="title">제목 : </label> <input type="text" name="title"
						size=30 value="${board.title}" />
				</div>
				<div>
					<textarea name="contents" cols="40" rows="5">${board.contents}</textarea>
				</div>
				<div>
					<label for="file">파일</label> <input type="file" name="file" size=30 />
				</div>
				<div>
					<input type="submit" value="전송하기">
				</div>
			</form>
		</c:when>
		<c:when test="${ empty sessionScope.email }">
			<div>
				<a href="/user/login">로그인</a>후에 글을 작성하실 수 있습니다.
			</div>
		</c:when>
	</c:choose>
</body>
</html>