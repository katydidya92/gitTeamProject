<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="userID" value="${userID }"></c:set>
<c:set var="userEmail" value="${userEmail }"></c:set>
<c:set var="authNum" value="${authNum }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 체크</title>

</head>
<body>
	<div id = "wrap">
		<!-- 네비게이션 -->
		<jsp:include page="../inc/nav.jsp" />
		<!-- 네비게이션 -->
		<!-- @ subHeader Top area -->    
		<div id="subVisual">
		    <section id="subVisu" class="submenu-DOM_00000020100600">
		        <h2 class="tit">마이 페이지</h2>
		    </section>
		    <section id="nav">
		        <div class="navInner boxing">
		            <div class="left">
		                <ul>
		                    <li class="home"><a href="${contextPath }/Main.do" title="홈"><img src="${contextPath }/img/sub/home.jpg" style="height: 22px; margin-top: 15px;"></a></li>
							<li class="home">회원 관리 > </li>
							<li class="depth2"><a href="${contextPath }/MyPage.do">마이 페이지 </a></li>
		                </ul>
		            </div>
		        </div>
		    </section>
			<script src="${contextPath }/js/subjs.js"></script>
		</div>
		<hr style = "margin: 2.5% 5% ">
	    <!--// @ subHeader Top area -->
	    
		<div class="container">
			<h2 style="text-align: center">💗  ${userID }님 이메일 인증</h2>
			<hr size="1" width="460">
			<br>
			<div id="chk">
				<form name = "checkForm" id="checkForm" action="${contextPath}/UserJoinCheckAction2.do" method="post">
             			<label for="username">인증번호를 입력해주세요.</label>
             			<input type="text" name="authNum" id="authNum" placeholder="코드를 입력하세요." class="form-control">             	
	              		<button type="button" onclick="checkAuthNum()">확인</button>
				</form>
				<script type="text/javascript">
					function checkAuthNum() {
						var checkNum = $("#authNum").val();
						var authNum = ${authNum}
	
						if (!checkNum) {
							alert("인증번호를 입력하십시오.");
						} else {
							if (checkNum == authNum) {
								alert("성공적으로 인증되었습니다.");
								document.checkForm.submit();
							} else {
								alert("인증번호가 잘못되었습니다.");
								return false;
							}
						}
					}
				</script>
			</div>
		</div>
	</div>
	<a href="#" class="viewTop" style="background-size: 40px">Top</a>
	<!-- footer -->
	<jsp:include page="../inc/footer.jsp" />
	<!-- footer -->	
</body>
</html>