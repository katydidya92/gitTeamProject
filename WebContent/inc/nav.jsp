<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<header>
  <div>
    <h1><a href="#a"><img alt="Busan" src="${contextPath }/img/gotoBusan.jpg" width="100" height="100"></a></h1>
    <nav>
      <ul>
        <li><a href="#a">여행지 소개</a></li>
        <li><a href="#a">예약/예매</a></li>
        <li><a href="#a">갤러리</a></li>
        <li><a href="#a">커뮤니티</a></li>
        <li><a href="#a">공지사항</a></li>
      </ul>
    </nav>
    <ul class="spot">
        <li><a href="#a">Sign in</a></li>
        <li><a href="#a">My page</a></li>
        <li><a href="#a">관리자 게시판</a></li>
    </ul>
  </div>
</header>