<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="paging" value="${pvo}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>후기 게시판 리스트</title>

<script src="${contextPath }/js/bootstrap.js"></script>
<script src="${contextPath }/js/jquery-3.5.1.js"></script>

<link rel="stylesheet" href="${contextPath }/css/bootstrap.css">
<link rel="stylesheet" href="${contextPath }/review/css/reviewList.css">

</head>
<body>
	<!-- 네비게이션 -->
	<jsp:include page="../inc/nav.jsp" />
	<!-- 네비게이션 -->
	
	<!-- @ subHeader Top area -->    
	<div id="subVisual">
	    <section id="subVisu" class="submenu-DOM_00000020100700">
	        <h2 class="tit">게시판</h2>
	    </section>
	    <section id="nav">
	        <div class="navInner boxing">
	            <div class="left">
	                <ul>
	                    <li class="home"><a href="${contextPath }/Main.do" title="홈"><img src="${contextPath }/img/sub/home.jpg" style="height: 22px; margin-top: 15px;"></a></li>
						<li class="home">게시판 > </li>
						<li class="depth2"><a href="${contextPath }/ReviewList.ao" title="후기로 갑니다">후기 게시판 </a></li>
	                </ul>
	            </div>
	        </div>
	    </section>
		<script src="${contextPath }/js/subjs.js"></script>
	</div>
	<hr style = "margin: 2.5% 5% ">
    <!--// @ subHeader Top area -->
	<div class="container">
		<div class="row"><br>
			<!-- 검색 기능 -->
			<div>
				<div class="scin">
					<form action="./ReviewList.ao" method="post" class="sc_fr">
						<select name = "sc_ck" class= "st">
							<option value = "null">전체목록</option>
							<option value = "userID">아이디</option>
							<option value = "userNickName">닉네임</option>
							<option value = "bbs_title">글제목</option>
							<option value = "bbs_content">글내용</option>
						</select>
						<input type="text" name = "search" value="" placeholder="검색어를 입력해주세요" >
			      		<input type="submit" class="scBtn" value = "검색">
					</form>	   		
				</div>
	      		<span style = "float: none;"></span>
			</div>
			
			<c:if test="${sc_ck ne null}">
				<div><br>
					<h3 style="text-align: center;"> 검색 결과는 총 ${paging.totalCount }개 입니다. </h3>
				</div>
			</c:if>
			<!-- 검색 기능 -->
		
			<button class="writeBtn2" onclick="location.href='${contextPath}/ReviewList.ao?order_type=NEW'">최신순</button>
		    <button class="writeBtn2" onclick="location.href='${contextPath}/ReviewList.ao?order_type=READCOUNT'">조회순</button>
		    <button class="writeBtn2" onclick="location.href='${contextPath}/ReviewList.ao?order_type=LIKE'">좋아요순</button>
		    <button class="writeBtn2" onclick="location.href='${contextPath}/ReviewList.ao?order_type=CMT'">댓글순</button>

		    <button class="writeBtn" onclick="location.href='${contextPath}/ReviewAdd.ao'">글쓰기</button>
		<hr>
			<div class="_2z6nI">
				<article class="ySN3v">
					<div style="-webkit-box-orient: horizontal; -webkit-box-direction: normal; -webkit-flex-direction: row; -ms-flex-direction: row; flex-direction: row;">
						<c:forEach var="bbs" items="${bbsList}" varStatus="status"> 
							<div style="display: inline-block;">
								<a href="./ReviewPage2.ao?bbsID=${bbs.bbsID }">
									<c:if test="${bbs.bbs_available eq 2}">
										<img src="${contextPath}/img/profile.png" width="380" height="380" style="margin-bottom: 5px">
									</c:if>
								</a>
								<c:forEach items="${fileName }" var="fn" varStatus="vs">
									<a href="./ReviewPage.ao?bbsID=${bbs.bbsID }">
										<c:if test="${bbs.bbsID eq fn.bbsID and bbs.bbs_available eq 1}">
											<img src="${contextPath}/upload/${fn.fileRealName}" width="380" height="380" style="margin-bottom: 5px">
										</c:if>
									</a>
								</c:forEach>
							</div>
							<div style="display: inline-block; "></div>
							<c:if test="${((status.index+1) mod paging.pagePerCol) == 0 }">
					</div>
							</c:if>
						</c:forEach>
				</article>
			</div>
			<hr>
			<div id="list">
				<div class="paginate">
				    <a href="${contextPath}/ReviewList.ao?pageNo=${paging.firstPageNo}" class="first">처음 페이지</a>
				    <a href="${contextPath}/ReviewList.ao?pageNo=${paging.prevPageNo}" class="prev">이전 페이지</a>
				    <span>
				        <c:forEach var="i" begin="${paging.startPageNo}" end="${paging.endPageNo}" step="1">
				            <c:choose>
				                <c:when test="${i eq paging.pageNo}"><a href="${contextPath}/ReviewList.ao?pageNo=${i}">${i}</a></c:when>
				                <c:otherwise><a href="${contextPath}/ReviewList.ao?pageNo=${i}">${i}</a></c:otherwise>
				            </c:choose>
				        </c:forEach>
				    </span>
				    <a href="${contextPath}/ReviewList.ao?pageNo=${paging.nextPageNo}" class="next">다음 페이지</a>
				    <a href="${contextPath}/ReviewList.ao?pageNo=${paging.finalPageNo}" class="last">마지막 페이지</a>
				</div>
			</div>
		</div>
	</div>
	<a href="#" class="viewTop" style="background-size: 40px">Top</a>
<!-- footer -->
<jsp:include page="../inc/footer.jsp" />
<!-- footer -->
</body>
</html>