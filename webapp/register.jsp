<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<form action="/user/register" method=POST>
			<div>
				<label for="email">email : </label><input name="email" type="text"
					size=20>
			</div>
			<div>
				<label for="password">Password : </label><input name="password"
					type="password">
			</div>
			<div>
				<!-- 체커는 js, server둘다 처리하자 -->
				<label for="password_check">Password Check : </label><input
					name="password_check" type="password">
			</div>
			<div>
				<input type="submit" value="Register" />
			</div>
			</form>
	</div>

</body>
</html>