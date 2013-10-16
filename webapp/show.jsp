<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
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
				<li>${comment.contents}</li>
			</c:forEach>
		</ul>
	</div>
</body>
</html>