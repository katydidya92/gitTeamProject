<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-4">
<title>Insert title here</title>
</head>
<body>
전체 행의 수 : ${pageRowCount} // dao.lowcount()

현재 페이지 번호 : ${currentPage}

마지막 페이지 번호 : ${endPage }

페이지 당 출력할 행의 수 : ${pageRow}

페이지 블럭 : 4(아래 숫자 블럭 갯수)
		<c:set value="${bbsList }" var="bbs">
		 </c:set>
	<div>
	<div>
		<c:forEach begin="${startPage }" end="${ endPage}" varStatus="st" step="1" items="${bbsList }">
		<div>
			<c:if test="${(st.index + 1) mod 4 == 0}" var="bbs">
			</div>
				<div>
			</c:if>
		</c:forEach>
				</div>
	</div>
	</div>

	<div>
		<div>
			<c:set var="page" value="${currentpage}" />
			<!-- page maxpage를 넘었을 경우 제한 -->
			<c:if test="${page > maxpage}">
				<c:set var="page" value="${maxpage}" />
			</c:if>
			<!-- 페이지를 4개씩 나누기 위해 현재 페이지에 보여줄 max값 설정 -->
			<fmt:formatNumber value="${page/4 - (page/4 % 1)}" type="pattern" pattern="0" var="full" />
			<c:set var="full" value="${full * 4}" />
			<!-- prev(전페이지), next(다음페이지) 개수 설정 -->
			<c:set var="scope" value="${page%4}" />
			<c:choose>
				<c:when test="${scope == 0}">
					<c:set var="prev" value="4" />
					<c:set var="next" value="1" />
				</c:when>
				<c:when test="${scope < 5}">
					<c:set var="prev" value="${scope}" />
					<c:set var="next" value="${5-scope}" />
				</c:when>
			</c:choose>
			<!-- prev 버튼 -->
			<c:if test="${page > 4}">
				<fmt:formatNumber value="${(page-1)/4 - (((page-1)/4) % 1)}"
					type="pattern" pattern="0" var="prevb" />
				<c:set value="${(prevb-1)*4 + 1}" var="prevb" />
				<span id="prevBtn" class="prev button" value="${prevb}"></span>
			</c:if>
			<!-- 전 페이지 -->
			<c:if test="${page != 1}">
				<c:set var="j" value="${prev}" />
				<c:forEach var="i" begin="1" end="${prev-1}">
					<c:set var="j" value="${j - 1}" />
					<c:if test="${(page - j) > 0}">
						<span class="no">${page - j}</span>
					</c:if>
				</c:forEach>
			</c:if>
			<!-- 현재 페이지 -->
			<span class="no selected">${page}</span>
			<!-- 다음 페이지 -->
			<c:if test="${page != maxpage}">
				<c:forEach var="i" begin="1" end="${next-1}">
					<c:if test="${maxpage >= page+i}">
						<span class="no">${page+i}</span>
					</c:if>
				</c:forEach>
			</c:if>
			<!-- next 버튼 -->
			<c:if test="${maxpage >= page + next}">
				<fmt:formatNumber value="${(page-1)/4 - (((page-1)/4) % 1)}"
					type="pattern" pattern="0" var="nextb" />
				<c:set value="${(nextb+1)*4 + 1}" var="nextb" />
				<span id="nextBtn" class="next button" value="${nextb}"></span>
			</c:if>
		</div>
	</div>

</body>
</html>