<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LIST</title>
</head>
<body>
<c:forEach items="${boards}" var="board">
<div>
	<a href="/board/${board.id}">${board.title}</a>
</div>
<hr />

</c:forEach>
<a href="/board/write">쓰기</a>
</body>
</html>