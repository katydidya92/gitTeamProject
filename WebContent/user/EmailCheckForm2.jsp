<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>이메일 중복확인</h3>

	<form action="UserEmailCheckAction.ua" method="post"
		onsubmit="return email_check()">
		이메일 : <input type="email" name="userEmail" autofocus> 
		<input type="submit" value="중복확인">
		
		<div class="btn">
			<input type="button" value="사용하기"> <input type="button"	value="닫기" onclick="window.close()">
		</div>
	</form>

	<script type="text/javascript">
		function email_check() {
			var email = f.mail.value;

			email = email.trim();
			return true;
		}
	</script>

</body>
</html>