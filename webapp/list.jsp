<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LIST</title>
<link rel="stylesheet" href="/stylesheets/list.css">

</head>
<body>
	<div class="container">
		<div class="left_section">
			<header> left_section Header </header>
			<div>left_section Content</div>
		</div>
		<div class="right_section">
			<c:forEach items="${boards}" var="board">
				<div class="page">
					<div class="article_image">
						<c:if test="${not empty board.fileName}">
							<img src="/images/${board.fileName}" width="400" height="400" />
						</c:if>
					</div>
					<div class="article_contents">
						<div class="span-3 left">
							<h1 class="title">${board.title}</h1>
							<!-- 
							<ul>
								<li class="level"><a href="/board/update/${board.id}">UPDATE</a></li>
								<li class="level"><a href="/board/delete/${board.id}">DELETE</a></li>
							</ul>
							-->
						</div>
						<div class="span-9 left article_inner">
							<p>${board.contents}</p>
						</div>

					</div>
					<div class="comment_section">
						<span class="comment_size">${fn:length(board.comments)}</span>
						Comments
						<ul class="comment_list">
							<c:forEach items="${board.comments}" var="comment">
								<li>
									<div class="comment">
										<span class="comment_email"> <c:if
												test="${empty comment.user.email }">
											Anonymous
										</c:if> ${comment.user.email}
										</span> <span class="comment_content">${comment.contents} </span>
									</div>
								</li>
							</c:forEach>
						</ul>
						<c:choose>
							<c:when test="${not empty sessionScope.email }">
								<form action="/comment/${board.id}" method="POST">
									<div class="comment_form">
										<textarea name="contents" placeholder="Write Comment...."></textarea>
										<div>
											<input type="submit" value="write">
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
				</div>
				<hr />
			</c:forEach>
		</div>
	</div>
</body>
</html>