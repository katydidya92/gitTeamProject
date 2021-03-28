<%@page import="com.tp.users.action.ActionForward"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인페이지</title>
</head>
<body>
	<h1>WebContent/user/main.jsp</h1>
	
	<%	
		String userID = (String)session.getAttribute("userID");
		if(userID==null){
			response.sendRedirect("./UserLogin.tp");
		}
	%>
	
	<h2><%=userID %>님 환영합니다!</h2>
	
	<input type="button" value="로그아웃" onclick="location.href='./UserLogout.do'">
</body>
</html>