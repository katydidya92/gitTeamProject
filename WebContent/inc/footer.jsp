<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
 <!-- footer -->
    <div id="footer">
                         
         <div class="foot_menu">
   <div class="inner">
   <ul>
     <li class="dep">
       <a href="" class="dep01">여행지 추천</a>
       <ul  class="dep02">
			<li>
				<a href="${contextPath }/BbsList.bo" target="_self">공지</a>
			</li>
			<li>
				<a href="${contextPath }/BbsList.bo" target="_self">이벤트</a>
			</li>
       </ul>
     </li>
<!-- 
     <li class="dep">
       <a href="" class="dep01">예약/예매</a>
       <ul  class="dep02">
         <li>
           <a href="/index.do?menuCd=DOM_000000202002000000" target="_self">숙소 예약</a>
         </li>
         <li>
           <a href="/index.do?menuCd=DOM_000000202003000000" target="_self">입장권 예매</a>
         </li>
       </ul>
     </li>
 -->
     <li class="dep">
       <a href="" class="dep01">커뮤니티</a>
       <ul  class="dep02">
         <li>
           <a href="${contextPath }/BbsAdd.bo" target="_self">글쓰기1</a>
         </li>
         <li>
           <a href="${contextPath }/BbsList.bo" target="_self">게시판</a>
         </li>
         <li>
           <a href="${contextPath }/BbsList2.bo" target="_self">게시판2</a>
         </li>
         <li>
           <a href="/TP/BbsList3.bo" target="_self">게시판3</a>
         </li>
       </ul>
     </li>

     <li class="dep">
       <a href="" class="dep01">유용한정보</a>
       <ul  class="dep02">
			<li>
				<a href="${contextPath }/BbsList.bo" target="_self">공지</a>
			</li>
			<li>
				<a href="${contextPath }/BbsList.bo" target="_self">이벤트</a>
			</li>
       </ul>
     </li>
   </ul>
   </div>
 </div>
 <div class="foot_info">
   <div class="inner">
     <a class="footLogo" href="#">Visit Busan</a>
     <ul class="footLink">
       <li>
         <a href="https://www.busan.go.kr/vprivacy1" target="_blank" title="새창열기"><b>개인정보보호방침</b></a>
       </li>
       <li>
         <a href="https://www.busan.go.kr/cright" target="_blank" title="새창열기">저작권보호정책</a>
       </li>
     </ul>
     <p class="copyright">
       <span class="address">부산관광안내 1330<br />

         Copyright © Busan Metropolitan City. All rights reserved.</span>
     </p>
	<div class="wa"><img src="https://www.visitbusan.net/upload_data/board_data/BBS_0000014/160747731387971.png" alt="웹표준"></div>
   </div>
 </div>
                                                       
    </div>
    <!--// footer -->