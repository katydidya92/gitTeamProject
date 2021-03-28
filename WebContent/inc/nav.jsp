<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!-- main css-->
    <link rel="stylesheet" type="text/css" href="${contextPath }/css/13.css" /> <!--common.css-->
    <link rel="stylesheet" type="text/css" href="${contextPath }/css/6.css" /> <!--main.css-->
    <link rel="stylesheet" type="text/css" href="${contextPath }/css/14.css" /> <!--swiper.min.css-->

<!-- common script-->
    <script type="text/javascript" src="${contextPath }/js/10.js"></script> <!-- jquery-1.8.2.min.js -->
    <script type="text/javascript" src="${contextPath }/js/12.js"></script> <!-- TweenMax.js -->
    
    <script type="text/javascript" src="${contextPath }/js/jquery.mCustomScrollbar.min.js"></script>


    <!-- main script-->
    <script type="text/javascript" src="${contextPath }/js/7.js"></script> <!-- design_common.js -->
    <script type="text/javascript" src="${contextPath }/js/8.js"></script> <!-- header.js -->
    <script type="text/javascript" src="${contextPath }/js/9.js"></script> <!-- bxslider.min.js //mainSlider 사용 -->
    <script type="text/javascript" src="${contextPath }/js/15.js"></script> <!-- swiper.min.js //popup 사용 -->
<!-- header -->
<div class="header main" >
    <h1><a href="${contextPath }/Main.do" class="logo"><span class="blind">VISIT BUSAN</span></a></h1>
    <a href="javascript:" class="mGnbOpen"><img src="${contextPath }/img/main/gnb_btn.png" alt="전체메뉴열기" width="21" /></a>

    <!-- 검색기능을 위한 폼 -->
    <form name="headerSearchForm"  action="/kor/search/index.do" method="post">
        <input type="hidden" name="searchKey"/>
    </form>

    <!-- pc gnb -->
    <ul id="gnb">
 
    <li class="dep">
        <a href="javascript:" class="oneD">여행지 추천</a>
        <ul class="twoD">
			<li>
			    <a href="${contextPath }/AtrList.lo" target="_self">명소</a>
			</li>
			<li>
			    <a href="${contextPath }/Restaurant.lo" target="_self">음식</a>
			</li>
    	</ul>
    </li>

    <!-- <li class="dep">
        <a href="javascript:" class="oneD">예약/예매</a>
        <ul class="twoD">
                <li>
                    <a href="/index.do?menuCd=DOM_000000202002000000" target="_self">숙소 예약</a>
                </li>
                <li>
                    <a href="/index.do?menuCd=DOM_000000202003000000" target="_self">입장권 예매</a>
                </li>
    	</ul>
    </li> -->
    
	    <li class="dep">
	        <a href="javascript:" class="oneD">커뮤니티</a>
	        <ul class="twoD">
				<li>
					<a href="${contextPath }/BbsList.bo" target="_self">후기갤러리</a>
				</li>
				<li>
					<a href="${contextPath }/BbsList.bo" target="_self">자유게시판</a>
				</li>
	        </ul>
	    </li>
    
	    <li class="dep">
	        <a href="javascript:" class="oneD">유용한 정보</a>
	        <ul class="twoD">
                <li>
                    <a href="${contextPath }/BbsList.bo" target="_self">공지</a>
                </li>
                <li>
                    <a href="${contextPath }/BbsList.bo" target="_self">이벤트</a>
                </li>
	        </ul>
	    </li>
	    <li class="dep" style = "float: right">
	    	<a href="javascript:void(0);" onclick="javascript:loginPage();" class="oneD">로그인</a>
	    </li>
    </ul>

    <!-- mobile gnb -->
    <div id="mGnb">
    <c:choose>
    	<c:when test="${userID eq null }">
    	<%-- <c:when test="${sessionScope.userID eq null }"> --%>
	        <div class="mo-btn-area">
	            <ul>
	                <li class="bt-one">
	                    <a href="javascript:void(0);" onclick="javascript:loginPage();"  class="login mo-login">로그인</a>
	                </li>
	                <li class="bt-two">
	                    <a href="${contextPath }/UserJoin.do" class="my">회원가입</a>
	                </li>
	            </ul>
	        </div>
        </c:when>
        <c:otherwise>
	        <div class="mo-btn-area">
	            <ul>
	                <li class="bt-one">
	                     <a href="${contextPath }/UserLogout.do" class="my">로그아웃</a>
	                </li>
	                <li class="bt-two">
	                    <a href="javascript:void(0);" onclick="javascript:myPage('true');" class="my">마이페이지</a>
	                </li>
	            </ul>
	        </div>
        </c:otherwise>
    </c:choose>
    
        <ul>
	        <li class="dep">
	            <a href="javascript:" class="oneD">부산에가면</a>
	            <ul class="twoD">
                   <li>
			    <a href="${contextPath }/AtrList.lo" target="_self">명소</a>
			</li>
			<li>
			    <a href="${contextPath }/Restaurant.lo" target="_self">음식</a>
			</li>
	        	</ul>
	        </li>
	    <li class="dep">
	        <a href="javascript:" class="oneD">커뮤니티</a>
	        <ul class="twoD">
				<li>
					<a href="${contextPath }/BbsList.bo" target="_self">후기갤러리</a>
				</li>
				<li>
					<a href="${contextPath }/BbsList.bo" target="_self">자유게시판</a>
				</li>
	        </ul>
	    </li>
	        <!-- 
	        <li class="dep">
			    <a href="javascript:" class="oneD">예약/예매</a>
			    <ul class="twoD">
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
	            <a href="javascript:" class="oneD">유용한정보</a>
	            <ul class="twoD">
					<li>
	                    <a href="${contextPath }/BbsList.bo" target="_self">공지</a>
	                </li>
	                <li>
	                    <a href="${contextPath }/BbsList.bo" target="_self">이벤트</a>
	                </li>
	            </ul>
	        </li>
        </ul>
        <a href="javascript:" class="mClose"><img src="/images/common/gnb_xbtn.png" alt="닫기" width="17" /></a>
    </div>

    <div class="utill">
        
          
        <a href="javascript:" class="sch">검색</a>
        <div class="searchPop">
            <div class="innerArea">
                <div class="inputArea">
                    <input type="text" id="total_search" name="totalSearchFuncKeyword" onkeydown="totalSearchFuncKeywordEnterProc('/KR/index.do?contentsSid=373&cate=ALL&currentPage=1&searchTerm=')" placeholder="검색어를 입력해주세요" />
                    <label class="blind" for="total_search">통합검색</label> 
                    <a href="javascript:totalSearchFuncKeywordProc('/KR/index.do?contentsSid=373&cate=ALL&currentPage=1&searchTerm=')" class="btn"><img src='${contextPath }/img/main/o.jpg' alt="검색" /></a>
                </div>
                <a href="javascript:" class="closeBtn">닫기</a>
            </div>
        </div>        
        <a href="javascript:void(0);" onclick="javascript:myPage('true');" class="my mo-dn">마이페이지</a>
    </div>
    <p class="twoDBg"></p>
</div>
<p class="mobileBg"></p>


<script>
    // html dom 이 다 로딩된 후 실행된다.
    $(document).ready(function(){
        // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
        $(".utill>.lng").click(function(){
            var submenu = $(this).next("ul");

            // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
            if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
        });
    });

    function loginPage(){
        $('#loginPage').submit();
    }

    function myPage(needLogin){
        if(needLogin == true || needLogin == 'true'){ //로그인 필요
        	
            alert('로그인이 필요한 서비스입니다.');
            location.href="${contextPath }/UserLogin.do";
            
            $('#loginPage').submit();
        }
    }

</script>
<!-- header //-->
<!-- 스크립트문 사용해서 로그인 사용 / loginPage 검색해서 확인 -->
<form action="${contextPath }/UserLogin.do" id="loginPage" method="post">
    <input type="hidden" name="lang_cd" id="lang_cd" value="ko">
</form>
                                                                                 
    <!--// header -->