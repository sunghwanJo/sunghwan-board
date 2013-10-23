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
	<div class="article_container">
		<header id="article_title">
			<h1 class="title">${board.title}</h1>
			<div class="right">
				<ul>
					<li class="level"><a href="/board/update/${board.id}">UPDATE</a></li>
					<li class="level"><a href="/board/delete/${board.id}">DELETE</a></li>
				</ul>
			</div>
		</header>
		<div>
			<div id="article_contents">${board.contents}</div>
			<div>
				<c:if test="${not empty board.fileName}">
					<img src="/images/${board.fileName}" width="400" height="400" />
				</c:if>
			</div>
		</div>

		<div class="comment_section">
			<hr />
			<c:choose>
				<c:when test="${not empty sessionScope.email }">
					<form action="/comment/${board.id}" method="POST">
						<div>
							<textarea name="contents"></textarea>
							<div>
								<input class="button right" type="submit" value="comment">
							</div>
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

		<div class="show_comment_section">

			<h1>Comments</h1>
			<ul class="comment_list">
				<c:forEach items="${comments}" var="comment">
					<li>
						<div class="comment">
							<span class="comment_email">${comment.user.email} </span> 
							<span class="comment_content">${comment.contents} </span>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
</body>
</html>