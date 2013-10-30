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
		<div class="back_image">
			<img src="" width="400" height="400" />
		</div>
		<div class="left_wrapper">
			<div class="left_section">
				<header>
					<img src="/images/logo_icon.png">
				</header>
				<div>
					<input id="write_button" type="button"
						value="Want to write Articles?" />
					<div id="write_form">
						<header>
							<h1>NEW POST</h1>
						</header>
						<div class="formArea">
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
					<div class="nav">
						<ul>
							<li>NAV1</li>
							<li>NAV2</li>
						</ul>

					</div>

				</div>

			</div>
			<!--  left-section end -->
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
						Comments <span class="comment_folder"><a href="#"
							onclick="return false">보이기</a></span>
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
	<script>
		var write_button = document.getElementById("write_button");
		var write_form = document.getElementById("write_form");

		function clickWriteButton() {

			if (write_form.style.visibility != "visible") {
				write_form.style.position = "relative";
				write_form.style.visibility = "visible";
			} else {
				write_form.style.position = "fixed";
				write_form.style.visibility = "hidden";
			}
		}

		var commentList = document.querySelectorAll('.comment_list');

		function init_page() {
			countComments();
			registerEvents();
		}

		function countComments() {
			for ( var i = 0; i < commentList.length; i++) {
				var currentNode = commentList[i];
				var nPListCount = currentNode.querySelectorAll('li').length;
				var commentNum = currentNode.parentNode
						.querySelector('.comment_size');

				commentNum.innerText = nPListCount + ':';
			}
		}

		function registerEvents() {
			var eleList = document.getElementsByClassName('comment_folder');
			for ( var i = 0; i < eleList.length; i++) {
				eleList[i].addEventListener('click', toggleComments, false);
			}
			
			var article_imgs = document.querySelectorAll('.article_image>img');
			for ( var i = 0; i < article_imgs.length; i++) {
				article_imgs[i].addEventListener('click', showImage, false);
			}
			
		}

		function toggleComments(e) {

			var commentBodyNode = e.target.parentNode.parentNode;
			var commentList = commentBodyNode.querySelector('.comment_list');

			var displayState = commentList.style.display;

			if (displayState == "block") {
				commentList.style.display = "none";
				e.target.innerText = "보이기";
			} else {
				commentList.style.display = "block";
				e.target.innerText = "접기";
			}

		}
		
		var back_wall = document.querySelector('.back_image');
		
		function showImage(e){
			var back_img = back_wall.querySelector('img');
			var image_src = e.target.src;
			
			back_img.src = image_src;
			back_img.parentNode.style.display="block";
			
		}
		
		function hideBackWall(e){
			back_wall.style.display="none";
		}
		
		back_wall.addEventListener("click", hideBackWall, false);
		write_button.addEventListener("click", clickWriteButton, false);
		
		window.onload = init_page;
	</script>
</body>
</html>