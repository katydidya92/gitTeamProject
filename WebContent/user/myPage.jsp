<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	  System.out.println("myPage.jsp 실행");
	  
	%>
	
	<h2><a href="./UserUpdate.do"> 회원 정보 수정</a></h2>
	
	<hr>
	
	<h2><a href="./UserDelete.do"> 회원 정보 삭제</a></h2>
	
	<hr>
	
	<h2><a href="./Main.do"> 메인 페이지로</a></h2>

</body>
</html>