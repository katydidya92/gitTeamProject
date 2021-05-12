<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이벤트 게시판 </title>

<script src="${contextPath }/js/bootstrap.js"></script>
<script type="${contextPath }/js/jquery-3.5.1.js"></script>

<link href="${contextPath }/css/bootstrap.css" rel="stylesheet">
<link href="${contextPath }/event/css/star2.css" rel="stylesheet">

</head>
<body>

	<div id="wrap">
		<!-- 네비게이션 -->
		<jsp:include page="../inc/nav.jsp" />
		<!-- 네비게이션 -->
		<!-- @ subHeader Top area -->
		<div id="subVisual">
			<section id="subVisu" class="submenu-DOM_00000020100400">
				<h2 class="tit">이벤트</h2>
			</section>
			<section id="nav">
				<div class="navInner boxing">
					<div class="left">
						<ul>
						    <li class="home"><a href="${contextPath }/Main.do" title="홈"><img src="${contextPath }/img/sub/home.jpg" style="height: 22px; margin-top: 15px;"></a></li>
							<li class="home">이벤트 게시판 ></li>
							<li class="depth2"><a href="${contextPath }/EventList.bd">이벤트
									</a></li>
						</ul>
					</div>
				</div>
			</section>
			<script src="${contextPath }/js/subjs.js"></script>
		</div>
		<!--// @ subHeader Top area -->

		<c:set var="bs" value="${bbsList }"></c:set>
		<form name="form" class="fr">
		  <div class="main_table">
			<input type="hidden" name="bbsID" value="${bs.bbsID }">
			<input type="hidden" name="bbs_category" value="${bs.bbs_category }">
			   
			   <div class="read">
			    조회수 : ${bs.bbs_readcount }
			   </div>
			   <div class="detail">
			   		<label class="ReviewTitle"><h3>${bs.bbs_title }</h3></label>
			   </div>
				
				<div class="month">	
					<label class="MonthTitle">이벤트 진행 시기 </label>
					<div class="month_content">${bs.start_month } ~ ${bs.end_month }</div>
				</div>		
				<div class="list">
		     		<span class="star-input" >
				   		<span class="input">
				   			<input type="radio" name="star-input" value="${bs.rating}" id="p${bs.rating}" checked>
					    	<label for="p${bs.rating}">${bs.rating}</label>
			  	  		</span>
		  	 		<output for="star-input"><b>${bs.rating }</b>점</output>	
		    		</span> 
		    	</div>
			 	<script src="${contextPath }/event/js/star.js"></script>
				<!-- img -->
				<div class="img">		
					<img width="600px"  src="${contextPath }/upload/${fileName}">
				</div>
						
				<div class="content">
						<label class="ContentTitie"></label>
						<div class="text">${bs.bbs_content }</div>
				</div>
			  </div>
			  <!-- main_table -->
			</form>
			
			<div class="btn1">  
			  <button class="backBtn" onclick="history.back();">돌아가기</button>
			</div>
			<c:if test="${userID eq 'admin' }">
			<div class="btn2">
			  <button class="editBtn" onclick="location.href='EventUpdate.bd?bbsID=${bs.bbsID}'">수정/삭제</button>
			</div>
			    </c:if>

	</div>
	<!-- wrap -->
	
	<!-- footer -->
	<jsp:include page="../inc/footer.jsp" />
	<!-- footer -->
	
 <script type="text/javascript">
	 $(document).ready(function() {
		$('.content').on('keyup', 'textarea', function (e) {
			$(this).css('height', 'auto');
			$(this).height(this.scrollHeight);
		});
		$('.content').find('textarea').keyup();
	});
	
 </script>
	
</body>
</html>