<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LIST</title>
<link rel="stylesheet" href="/stylesheets/bootstrap.css">

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
	<div class="container">
		<c:forEach items="${boards}" var="board">
			<div>
				<a href="/board/${board.id}">${board.title}</a>
			</div>
			<hr />

		</c:forEach>
	</div>
</body>
</html>