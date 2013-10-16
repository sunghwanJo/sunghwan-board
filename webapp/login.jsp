<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="container">
		<form action="/user/login/" method="POST">
			<div>
				<input name="email" type="text" size=20>
			</div>
			<div>
				<input name="password" type="password">
			</div>
			<div>
				<input type="submit" value="Login">

			</div>
		</form>
	</div>

</body>
</html>