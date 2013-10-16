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
	<div class="container">
		<div class="header"></div>
		<div class="contents">
			<h1>Sunghwan Board</h1>
			<a href="/board/write">글쓰기</a> <a href="/user/register">회원가입</a>
			<c:choose>
				<c:when test="${ not empty sessionScope.email }">
					<a href="/user/logout">로그아웃</a>
				</c:when>
				<c:when test="${ empty sessionScope.email }">
					<a href="/user/login">로그인</a>
				</c:when>
			</c:choose>
		</div>

	</div>
</body>
</html>