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
<%-- <jsp:include page="../inc/nav.jsp" /> --%>
<!-- 네비게이션 -->
<!-- 메인 페이지 -->
<article>
	<form action="./bbsAddAction.bo" method="post" enctype="multipart/form-data">
		<input type = "hidden" value = "123" name = "userID">
		<input type = "hidden" value = "234" name = "userNickName">
		
		<table border = "1">
			<tr>
				<th>
					구분
				</th>
				<td>
					<select name="bbs_category">
						<option value="1">게시판1</option>
						<option value="2">게시판2</option>
						<option value="3">게시판3</option>
						<option value="4">게시판4</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>
					제목
				</th>
				<td>
					<input type="text" name="bbs_title" maxlength="50" placeholder="제목을 입력해 주세요.">
				</td>
			</tr>
			<tr>
				<th>
					내용
				</th>
				<td>
					<textarea name="bbs_content" cols="40" rows="13" placeholder="내용을 입력하세요."></textarea>
				</td>
			</tr>
			<tr>
				<th>
					<input type='file' onchange="readURL(this);" name = "fileID" />
				</th>
				<td>
        			<img id="blah" src="#" alt="your image" />
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
<%-- <jsp:include page="../inc/footer.jsp" /> --%>
<!-- footer -->
</body>
<script type="text/javascript">
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#blah').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }
</script>

</html>