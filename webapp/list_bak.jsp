<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LIST</title>
<link rel="stylesheet" href="/stylesheets/list.css">

</head>
<body>
	<div class="navbar">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Logo</a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="navbar-right">
					<li><a href="/board/write">write</a></li>
				</ul>

			</div>
		</div>
	</div>
	<!-- Write Section 
	<div class="wrap">
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
							<label for="file">Add File : </label> <input type="file"
								name="file" size=30 />
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
	 -->
	 
	<c:forEach items="${boards}" var="board">
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
				<div class="article_image" >
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
								<textarea name="contents" placeholder="Write Comment...."></textarea>
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
					<c:forEach items="${board.comments}" var="comment">
						<li>
							<div class="comment">
								<span class="comment_email">${comment.user.email} </span> <span
									class="comment_content">${comment.contents} </span>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</c:forEach>
</body>
</html>