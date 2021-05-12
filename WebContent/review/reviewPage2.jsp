<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>후기 게시판</title>

<script src="${contextPath }/js/jquery-3.5.1.js"></script>
<script src="${contextPath }/js/subjs.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="${contextPath }/js/bootstrap.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="${contextPath }/css/bootstrap.css">
<link rel="stylesheet" href="${contextPath }/css/bootstrap.css">
<link rel="stylesheet" href="${contextPath }/css/noticeWrite.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 
</head>
<body>
	<!-- 네비게이션 -->
	<jsp:include page="../inc/nav.jsp" />
	<!-- 네비게이션 -->
	<!-- @ subHeader Top area -->    
	<div id="subVisual">
	    <section id="subVisu" class="submenu-DOM_00000020100300">
	        <h2 class="tit">게시판</h2>
	    </section>
	    <section id="nav">
	        <div class="navInner boxing">
	            <div class="left">
	                <ul>
						<li class="home">게시판 > </li>
						<li class="depth2"><a href="${contextPath }/ReviewList.ao" title="후기로 갑니다">후기 게시판 </a></li>
	                </ul>
	            </div>
	        </div>
	    </section>
	</div>
	<hr style = "margin: 2.5% 5% ">
    <!--// @ subHeader Top area -->
	<div class="container">
		<div id="content">
	  		<div class="innerwrap">
	    		<!-- <h1 class="h1_head"> 리뷰 </h1> -->
				<c:set value="${bbsDetail }" var="bbs" />  
		 		<form action="./ReviewPage3.ao" method="post">
					<input type = "hidden" value = "3" name = "bbs_category">
					<input type = "hidden" value = "${bbs.bbsID }" name = "bbsID">
					<h4 class="tit">  ${bbs.bbs_title }</h4>
					<input type = "password" name="bbs_pass" placeholder="비밀번호 입력" style="width: 150px;" >
					<input type = "submit" value = "들어가기">
				</form>
				<br>
			</div>
		</div>
	</div>
		
	<!-- footer -->
	<jsp:include page="../inc/footer.jsp" />
	<!-- footer -->
</body>
</html>