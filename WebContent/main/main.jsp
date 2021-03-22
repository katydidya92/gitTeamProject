<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<title>Insert title here</title>
</head>
<body>
<!-- 네비게이션 -->
<jsp:include page="../inc/nav.jsp" />
<!-- 네비게이션 -->
<!-- 메인 페이지 -->
	<h1>메인 페이지</h1>
<!-- 메인 페이지 -->

<!-- footer -->
<jsp:include page="../inc/footer.jsp" />
<!-- footer -->
</body>
</html>