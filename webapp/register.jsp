<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form>
		<div class="container">
			<form action="/user/register" method="POST">
				<div>
					<label for="email">email : </label><input name="id" type="text"
						size=20>
				</div>
				<div>
					<label for="password">Password : </label><input name="password"
						type="password">
				</div>
				<div>
					<label for="password_check">Password Check : </label><input
						name="password_check" type="password">
				</div>
				<div>
					<input tpye="submit" value="Register"> | <a
						href="/user/register">Register</a>
				</div>
		</div>
	</form>
</body>
</html>