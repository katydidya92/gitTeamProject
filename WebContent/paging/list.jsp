<%@page import="java.util.List"%>
<%@page import="com.tp.bbs.bean.BbsBean"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록</title>
</head>
<body>
	<%
		List<BbsBean> boardList = (List<BbsBean>) request.getAttribute("list");
	%>
	<h3>게시물 목록</h3>

	<!-- 목록 출력 -->
	<table class="board_list">
		<tr>
			<th style="width: 15%;">번호(Num)</th>
			<th>제목(Subject)</th>
			<th style="width: 13%;">글쓴이(Author)</th>
		</tr>
		<%
			for (BbsBean board : boardList) {
		%>
		<tr>
			<td style="width: 15%;">${bbs.bbsID}</td>
			<td>${bbs.bbs_title}</td>
			<td style="width: 13%;">${bbs.userID}</td>
		</tr>
		<%
			}
		%>
	</table>

	<!-- 페이징 -->
	<jsp:include page="./paging.jsp">
		<jsp:param name="customURL" value="${pagingUrl}" />
		<jsp:param name="firstPageNo" value="${paging.firstPageNo}" />
		<jsp:param name="prevPageNo" value="${paging.prevPageNo}" />
		<jsp:param name="startPageNo" value="${paging.startPageNo}" />
		<jsp:param name="pageNo" value="${paging.pageNo}" />
		<jsp:param name="endPageNo" value="${paging.endPageNo}" />
		<jsp:param name="nextPageNo" value="${paging.nextPageNo}" />
		<jsp:param name="finalPageNo" value="${paging.finalPageNo}" />
	</jsp:include>

	<!-- 검색 -->
	<jsp:include page="./search.jsp" />

</body>
</html>