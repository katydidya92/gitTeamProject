<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<link href="${contextPath }/css/main.css" rel="stylesheet" type="text/css">
<title>Busan</title>
</head>
<body>
<!-- 네비게이션 -->
<jsp:include page="../inc/nav.jsp" />
<!-- 네비게이션 -->
<!-- 메인 페이지 -->
	<h1>메인 페이지</h1>
	123
	<a href = "./Write.pa">작성</a>
	<a href = ./PageListAction.pa>리스트</a>
	<a href = ./PageListAction2.pa>리스트2</a>
	
	<a href="./BbsAdd.bbs"> 게시글 등록하기</a>
	<br>
	<a href="./BbsList.bbs"> 게시글 1 </a>
	<br>
	<a href="./BbsList22.bbs"> 게시글2   </a>
	<br>
	<a href="./BbsList33.bbs"> 게시글3   </a>
	
<!-- 메인 페이지 -->

<!-- footer -->
<jsp:include page="../inc/footer.jsp" />
<!-- footer -->
</body>
</html>