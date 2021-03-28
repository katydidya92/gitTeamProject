<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원 탈퇴 페이지</h1>
	
	<c:set var="userID" value="${userID }"></c:set>
	
	<form action="./UserDeleteAction.do" method="post">
	 <table>
	  <tr>
	   <td>비밀번호 <input type="password" name="userPass"></td>
	  </tr>
	  <tr>
	   <td> 
	    <input type="submit" value="탈퇴하기">
	    <input type="reset" value="취소" onclick="history.back();">
	   </td>
	  </tr> 
	 </table>
	</form>
	
	

</body>
</html>