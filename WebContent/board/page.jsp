<%@page import="java.util.List"%>
<%@page import="com.tp.bbs.db.BbsDAO"%>
<%@page import="com.tp.bbs.db.BbsBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<link href="${contextPath }/css/main.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>

</head>
<body>
	<!-- 네비게이션 -->
	<%-- <jsp:include page="../inc/nav.jsp" /> --%>
	<!-- 네비게이션 -->

	<!-- 메인 페이지 -->
	<div>
		전체행의 수 : ${totalRowCount} <br>
		현재 페이지 번호 : ${currentPage } <br>
		마지막 페이지 번호 : ${endPage } <br>
		페이지 당 출력할 행의 수 : ${pagePerRow } <br>
		페이지 당 출력할 열의 수 : ${pagePerCol } <br>
		contextPath = ${contextPath } <br>
		<br>
	</div>
<fieldset>
	<table>
	
		<tr>
			<td colspan="2" align="center"  width="300" > <b>제목</b></td>
			<td align="center"><b>작성자</b></td>
			<td align="center"><b>작성일</b></td>
			<td align="center"> <b>조회</b></td>
			<td align="center"><b>좋아요</b></td>
		</tr>
	 
		<c:forEach items="${bbsList }" var="bbs"  > 
		 
		 <tr>
			<td width="20">${bbs.bbsID}</td>
			   
			 <td width="280">
				<a href="./BbsView.bo?bbsID=${bbs.bbsID }">
							${bbs.bbs_title }</a>
			 </td>
			
		     <td align="center" >${bbs.userNickName }</td>
			
			 <td><fmt:formatDate value="${bbs.bbs_date }" dateStyle="medium"/></td>
			 <td> 조회수 </td>  
			 <td>좋아요</td>
		  	     
		 </tr>
		 
		 </c:forEach>
		 
	</table>
</fieldset>

	<h1> 4번 형태 </h1>
	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>닉네임</th>
				<th>내용</th>
			</tr>
		</thead>
		<tbody>
			
			<c:forEach var="bbs" items="${bbsList}">
				<tr>
					<td>${bbs.bbsID}</td>
					
				<c:if test="${bbs.bbs_available == 0}">
					<td>삭제된 게시물입니다.</td>
				</c:if>
				<c:if test="${bbs.bbs_available != 0}">
					<td>${bbs.bbs_title}</td>
				</c:if>
					<td>${bbs.userID}</td>
					<td>${bbs.bbs_date}</td>
					<td>${bbs.bbs_content}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<div>
		<div>
			<c:if test="${currentPage > endPage}">
				<c:set var="page" value="${endPage}" />
			</c:if>
		<a href="<c:url value='BbsList.bo?currentPage=${1}'/>">처음</a>
			<!-- 출력할 페이지 수 계산 -->
			<fmt:formatNumber value="${currentPage/4 - (currentPage/4 % 1)}" type="pattern" pattern="0" var="full" />
							<!-- value = 값 / pattern 속성 : 0 = 수치 / type = 데이터형 / var : 사용할 변수명 -->
							<!--ex) 5 페이지의 경우 : 5 / 4 - (5/4 % 1) -->
			<c:set var="full" value="${full * 4}" />
			<!-- set : 변수 설정 -->
			<!-- prev(전 페이지), next(다음 페이지) 개수 설정 -->
			<c:set var="scope" value="${currentPage%4}" />
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
			
			<!-- 이전 버튼 --> 
			<c:if test="${currentPage > 4}"> 
				<fmt:formatNumber value="${(currentPage-1)/4 - (((currentPage-1)/4) % 1)}" type="pattern" pattern="0" var="prevb"/> 
				<c:set value="${(prevb-1)*4 + 1}" var="prevb"/> 
				<a href="<c:url value='BbsList.bo?currentPage=${prevb}'/>">이전</a> 
			</c:if>

			<!-- 전 페이지 -->
			<c:if test="${currentPage != 1}">
				<c:set var="j" value="${prev}" />
				<c:forEach var="i" begin="1" end="${prev-1}">
					<c:set var="j" value="${j - 1}" />
					<c:if test="${(currentPage - j) > 0}">
						<a href="<c:url value='BbsList.bo?currentPage=${currentPage - j}'/>">${currentPage - j}</a>
					</c:if>
				</c:forEach>
			</c:if>
			<!-- 현재 페이지 -->
			<span>${currentPage}</span>
			<!-- 다음 페이지 -->
			<c:if test="${currentPage != endPage}">
				<c:forEach var="k" begin="1" end="${next-1}">
					<c:if test="${endPage >= currentPage+k}">
						<a href="<c:url value='BbsList.bo?currentPage=${currentPage + k}'/>">${currentPage + k}</a>
					</c:if>
				</c:forEach>
			</c:if>
			
			<!-- 다음 버튼 --> 
			<c:if test="${endPage >= currentPage + next}"> 
				<fmt:formatNumber value="${(currentPage-1)/4 - (((currentPage-1)/4) % 1)}" type="pattern" pattern="0" var="nextb"/> 
				<c:set value="${(nextb+1)*4 + 1}" var="nextb"/> 
				<a href="<c:url value='BbsList.bo?currentPage=${nextb}'/>">다음</a> 
			</c:if>
			<a href="<c:url value='BbsList.bo?currentPage=${endPage}'/>">마지막</a>
		</div>
	</div>
	
	<br>
	<a href="${contextPath}/BbsAdd.bo"> 글쓰기</a>
	<a href="${contextPath}/Main.do"> 메인</a>	
	
	<hr>
	<hr>
	
	<h1> 3번 형태 </h1>
	<table border="1">
		<tr>
			<c:forEach var="bbs" items="${bbsList}" varStatus="status">
			<td><img src="../image/1.jpg"></td>
			<td>
				제목 <br>
				${bbs.bbs_title}
			<c:if test="${((status.index+1) mod pagePerCol) == 0 }">
			</td>
		</tr>
		<tr>
			</c:if>
			</c:forEach>
		</tr>
	</table>
	
	<hr>
	<hr>
	
	<h1> 3번 형태 -div </h1>
	<div>
		<div>
			<c:forEach var="bbs" items="${bbsList}" varStatus="status"> 
			<!-- status로 반복하겠다. -->
			<div style="display: inline-block;">
				${status.index+1}<img src="../image/1.jpg">
			</div>
			<div style="display: inline-block;">
				${status.index+1}
				<div>${bbs.bbs_title}</div>
				<div>123</div>
			</div>
				<c:if test="${((status.index+1) mod 3) == 0 }">
		</div>
				</c:if>
			</c:forEach>
	</div>
	
	<hr>
	<hr>
	
	<h1> 2번 형태 - img만 있는 형태</h1>
	<table border="1">
		<tr>
			<c:forEach var="bbs" items="${bbsList}" varStatus="status">
				<td>
					${status.index+1}<img src="../image/1.jpg">
				</td>
				<c:if test="${((status.index+1) mod 3) == 0 }">
		</tr>
		<tr>	
			</c:if>
			</c:forEach>
		</tr>
	</table>
	
	<hr>
	<hr>
	
	<h1> 2번 형태 - div </h1>
	<div>
		<div>
			<c:forEach var="bbs" items="${bbsList}" varStatus="status">
				<div style="display: inline-block;">
					${status.index+1}<img src="../image/1.jpg">
			<c:if test="${((status.index+1) mod 3) == 0 }">
				</div>
			</c:if>
		</div>
			</c:forEach>
		</div>
	
	<hr>
	<hr>
	
	<h1> 1번 형태 </h1>
	<table border="1">
		<tr>
			<c:forEach var="bbs" items="${bbsList}" varStatus="status">
			<td>
				${status.index+1}<img src="../image/1.jpg"><br>
				제목<br>
				제목2<br>
			<c:if test="${((status.index+1) mod 3) == 0 }">
			</td>
		</tr> <!-- 이 단계가 없으면 전체가 가로로 출력된다. -->
		<tr>  <!-- 해당하는 index에서 행을 끝내고 새로운 행을 추가하는 역할 -->
	   		  <!-- mod3 == 행 3개를 만들고 다음 줄로 넘어가겠다. -->
			</c:if>
			</c:forEach>
		</tr>
	</table>
	
	<hr>
	<hr>
	
	<h1> 1번 형태 - div </h1>
	<div>
		<div>
			<c:forEach var="bbs" items="${bbsList}" varStatus="status">
				<div style="display: inline-block;">
					${status.index+1}<img src="../image/1.jpg"><br>
					제목<br>
					제목2
			<c:if test="${((status.index+1) mod 3) == 0 }">
				</div>
			</c:if>
		</div>
			</c:forEach>
		</div>
	
	<hr>
	<hr>
	
	<!-- 메인 페이지 -->

	<!-- footer -->
	<%-- <jsp:include page="../inc/footer.jsp" /> --%>
	<!-- footer -->
</body>
</html>