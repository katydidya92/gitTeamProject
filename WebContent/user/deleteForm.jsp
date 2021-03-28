<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원 탈퇴 페이지</h1>
	
	<%
	   String id = (String) session.getAttribute("id");
	
	
	%>
	
	<form action="" method="post">
	 <table>
	  <tr>
	   <td>비밀번호 <input type="password" name="pass"></td>
	  </tr>
	  <tr>
	   <td> 
	    <input type="submit" value="탈퇴하기" onclick="check()">
	    <input type="reset" value="취소">
	   </td>
	  </tr> 
	 </table>
	</form>
	
	<script type="text/javascript">
	 function check() {
		
	}
	</script>
	
	

</body>
</html>