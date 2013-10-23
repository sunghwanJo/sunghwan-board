<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/stylesheets/main.css">
<link rel="stylesheet" href="/stylesheets/bootstrap.css">
<title>Insert title here</title>
</head>
<body>
	<div class="navbar">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Logo</a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav">
					<li><a href="/board/list">list</a></li>
					<li><a href="/board/write">write</a></li>
				</ul>

			</div>
		</div>
	</div>
	<div class="container">
		<div>title : ${board.title}</div>
		<div>contents : ${board.contents}</div>
		<div>
			<c:if test="${not empty board.fileName}">
				<img src="/images/${board.fileName}" width="400" height="400" />
			</c:if>
		</div>
		<div>
			<a href="/board/update/${board.id}">수정하기</a> | <a
				href="/board/delete/${board.id}">삭제하기</a>
		</div>
		<hr />
		<div class="comment_section">
			<c:choose>
				<c:when test="${not empty sessionScope.email }">
					<form action="/comment/${board.id}" method="POST">
						<div>
							<textarea name="contents"></textarea>
							| <input type="submit" value="댓글쓰기">
						</div>
					</form>
				</c:when>
				<c:when test="${empty sessionScope.email }">
					<div>
						<a href="/user/login">로그인</a>후에 댓글을 작성하실 수 있습니다.
					</div>
				</c:when>
			</c:choose>
		</div>
		<hr />
		<div class="show_comment_section">
			<h1>댓글 목록</h1>
			<ul class="comment_list">
				<c:forEach items="${comments}" var="comment">
					<li>
						<div>${comment.user.email}|${comment.contents}</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<script src="/javascripts/jquery.js"></script>
	<script src="/javascripts/bootstrap.js"></script>
</body>
</html>