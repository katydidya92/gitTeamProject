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
<article>
	<form action="./PageAddAction.pa" method="post">
		<input type = "hidden" value = "123" name = "userID">
		<input type = "hidden" value = "234" name = "userNickName">
		<table border = "1">
			<tr>
				<th>
					구분
				</th>
				<td>
					<select>
						<option>관리자는 이러한 형태로 해당 번호 게시판에 작성하는 방식</option>
						<option>공지사항</option>
						<option>다른 게시판</option>
						<option>또 다른 게시판</option>
						<option>5</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>
					제목
				</th>
				<td>
					<input type="text" name="bbs_title" maxlength="50">
				</td>
			</tr>
			<tr>
				<th>
					내용
				</th>
				<td>
					<textarea name="bbs_content" cols="40" rows="13" ></textarea>
				</td>
			</tr>
			
		</table>
		<div>
			<button type="submit" >글 쓰기</button>
			<button type="button" onclick="history.back()">돌아가기</button>
		</div>
	</form>
</article>
<!-- 메인 페이지 -->

<!-- footer -->
<jsp:include page="../inc/footer.jsp" />
<!-- footer -->
</body>
</html>