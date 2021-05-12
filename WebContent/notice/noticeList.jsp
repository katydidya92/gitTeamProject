<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="paging" value="${pvo}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 공지사항 </title>

<script src="${contextPath }/js/bootstrap.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="${contextPath }/css/main.css">
<link rel="stylesheet" href="${contextPath }/css/noticeList.css">
<link rel="stylesheet" href="${contextPath }/css/bootstrap.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

</head>
<body>
	<div id = "wrap">
		<!-- 네비게이션 -->
		<jsp:include page="../inc/nav.jsp" />
		<!-- 네비게이션 -->
		<!-- @ subHeader Top area -->    
		<div id="subVisual">
		    <section id="subVisu" class="submenu-DOM_00000020100300">
		        <h2 class="tit">공지사항</h2>
		    </section>
		    <section id="nav">
		        <div class="navInner boxing">
		            <div class="left">
		                <ul>
		                    <li class="home"><a href="${contextPath }/Main.do" title="홈"><img src="${contextPath }/img/sub/home.jpg" style="height: 22px; margin-top: 15px;"></a></li>
							<li class="home">게시판 > </li>
							<li class="depth2"><a href="${contextPath }/NoticeList.no">공지사항</a></li>
		                </ul>
		            </div>
		        </div>
		    </section>
			<script src="${contextPath }/js/subjs.js"></script>
		</div>
		<hr style = "margin: 2.5% 5% ">
	    <!--// @ subHeader Top area -->
		<div class="container">
			<div class="innerwrap">
				<hr>
				<table id="bList" class="bbs_default_list">
					<thead>
						<tr height="30">
							<th width="10%">글번호</th>
							<th width="58%">제목</th>
							<th width="10%">작성자</th>
							<th width="12%">작성일</th>
							<th width="10%">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="bbs" items="${bbsList}" varStatus="vs">
							<tr>
								<td>${(paging.totalCount - paging.pageSize * (paging.pageNo -1)) - (vs.index+1) + 1 }</td>
								<td class="subject" ><a href="./NoticeDetail.no?bbsID=${bbs.bbsID }">${bbs.bbs_title}</a></td>
								<td>${bbs.userNickName}</td>
								<td><fmt:formatDate value="${bbs.bbs_date }" dateStyle="medium" /></td>
								<td>${bbs.bbs_readcount}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<c:choose>
				 	<c:when test="${userID eq 'admin' }">
				   		<div id="aa">
							<br>
							<a href="${contextPath}/NoticeWrite.no"> 글쓰기</a>
							<a href="${contextPath}/Main.do"> 메인</a>
				   		</div>
				 	</c:when>
				</c:choose>
			
				<hr>
				<div class="paginate">
			    <a href="${contextPath}/NoticeList.no?pageNo=${paging.firstPageNo}" class="first">처음 페이지</a>
			    <a href="${contextPath}/NoticeList.no?pageNo=${paging.prevPageNo}" class="prev">이전 페이지</a>
			    <span>
			        <c:forEach var="i" begin="${paging.startPageNo}" end="${paging.endPageNo}" step="1">
			            <c:choose>
			                <c:when test="${i eq paging.pageNo}"><a href="${contextPath}/NoticeList.no?pageNo=${i}">${i}</a></c:when>
			                <c:otherwise><a href="${contextPath}/NoticeList.no?pageNo=${i}">${i}</a></c:otherwise>
			            </c:choose>
			        </c:forEach>
			    </span>
			    <a href="${contextPath}/NoticeList.no?pageNo=${paging.nextPageNo}" class="next">다음 페이지</a>
			    <a href="${contextPath}/NoticeList.no?pageNo=${paging.finalPageNo}" class="last">마지막 페이지</a>
			</div>
		   </div>
		</div>
	</div>
	<a href="#" class="viewTop" style="background-size: 40px">Top</a>
	<!-- 메인 페이지 -->

	<!-- footer -->
	<jsp:include page="../inc/footer.jsp" />
	<!-- footer -->
</body>
</html>