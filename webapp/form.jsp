<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/stylesheets/main.css">
<title>Insert title here</title>
</head>
<body>
	<div id="wrap">
		<header>
			<h1>NEW POST</h1>
		</header>
		<div id="formArea">
			<c:choose>
				<c:when test="${ not empty sessionScope.email }">
					<form action="/board/${board.id}" method="POST"
						enctype="multipart/form-data">
						<div>
							<input type="text" name="title" id="title" size=30
								value="${board.title}" placeholder="Title" />
						</div>
						<div>
							<textarea name="contents" cols="40" rows="5"
								placeholder="Content">${board.contents}</textarea>
						</div>

						<div>
							<label for="file">Add File : </label> <input type="file" name="file"
								size=30 />
						</div>
						<div class="right">
							<input type="submit" value="Write">
						</div>
					</form>
				</c:when>
				<c:when test="${ empty sessionScope.email }">
					<div>
						<a href="/user/login">로그인</a>후에 글을 작성하실 수 있습니다.
					</div>
				</c:when>
			</c:choose>
		</div>
	</div>
</body>
</html>