<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
<title>Busan</title>
</head>
<body class="kr"  data-drv-seq="206" data-device-type="web" data-drv-nm="kor" data-main="true">
<div id="accessibility">
    <a href="#cBody">본문 바로가기</a>
</div>

<div id="wrap">

<!-- 네비게이션 -->
<jsp:include page="../inc/nav.jsp" />
<!-- 네비게이션 -->
<!-- 메인 페이지 -->

<c:set value="${userID}" var ="userID"></c:set>
<%-- <c:set value="${sessionScope.userID}" var ="userID"></c:set> --%>

 <!-- content -->
   <div id="cBody" class="sp"> 


<script type="text/javascript" src="${contextPath }/js/comm.js"></script>

<script src="https://cdn.jsdelivr.net/npm/vue@2.5.13"></script>
<!-- MAIN -->
<!-- mainVisual-->
<section id="mainVisual">
    
    <ul class="visual_wrap">
        
        <li style="background-image: url('${contextPath }/img/main/b.PNG');" >
            <div class="visual_txt">
                <div class="txt_wrap">

                    <h3>아름다운 야경, 부산의 광안대교</h3>
                    
                    <a href="https://www.visitbusan.net/kr/index.do?menuCd=DOM_000000202002001000&uc_seq=306&lang_cd=ko" target="_self" title="부산 곳곳, 벚꽃이어라">자세히보기</a>
                </div>
            </div>
            <!-- 관리자에서 영상 올리면 여기에 추가 해주시면 됩니다.-->
            <!-- 접근성 설명 노출-->
            <p class="hidden-txt"></p>
        </li>
        
        <li style="background-image: url('${contextPath }/img/main/5.PNG');"  >
            <div class="visual_txt">
                <div class="txt_wrap">

                    <h3>오륙도 스카이워크</h3>
                    
                    <a href="https://www.visitbusan.net/index.do?menuCd=DOM_000000202002001000&uc_seq=307&lang_cd=ko" target="_self" title="부산 유채꽃명소 추천, 노란 꽃들의 절정">자세히보기</a>
                </div>
            </div>
            <!-- 관리자에서 영상 올리면 여기에 추가 해주시면 됩니다.-->
            <!-- 접근성 설명 노출-->
            <p class="hidden-txt"></p>
        </li>
        
        <li style="background-image: url('${contextPath }/img/main/train.jpg');"  >
            <div class="visual_txt">
                <div class="txt_wrap">

                    <h3>해운대 블루라인 파크</h3>
                    
                    <a href="https://www.visitbusan.net/index.do?menuCd=DOM_000000202002001000&uc_seq=484&lang_cd=ko" target="_self" title="부산 드라이브는 즐거워!">자세히보기</a>
                </div>
            </div>
            <!-- 관리자에서 영상 올리면 여기에 추가 해주시면 됩니다.-->
            <!-- 접근성 설명 노출-->
            <p class="hidden-txt"></p>
        </li>
        
        <li style="background-image: url('${contextPath }/img/main/blu.PNG');"  >
            <div class="visual_txt">
                <div class="txt_wrap">

                    <h3>벚꽃 명소, 맥도생태공원</h3>
                    
                    <a href="https://visitbusan.net/index.do?contentsSid=22&uc_seq=1025&lang_cd=ko" target="_self" title="동부산 힐링 가족여행">자세히보기</a>
                </div>
            </div>
            <!-- 관리자에서 영상 올리면 여기에 추가 해주시면 됩니다.-->
            <!-- 접근성 설명 노출-->
            <p class="hidden-txt"></p>
        </li>
        
        <li style="background-image: url('${contextPath }/img/main/y.PNG');"  >
            <div class="visual_txt">
                <div class="txt_wrap">

                    <h3>부산 유채꽃 명소, 대저생태공원</h3>
                    
                    <a href="https://www.visitbusan.net/index.do?menuCd=DOM_000000202002001000&uc_seq=1014&lang_cd=ko" target="_self" title="힐링하기 좋은 부산 어촌마을">자세히보기</a>
                </div>
            </div>
            <!-- 관리자에서 영상 올리면 여기에 추가 해주시면 됩니다.-->
            <!-- 접근성 설명 노출-->
            <p class="hidden-txt"></p>
        </li>
        

    </ul>
    <div id="navBtn">
        <div class="btn act">
          <a href="javascript:void(0);" class="start">재생</a>
          <a href="javascript:void(0);" class="pause">멈춤</a>
        </div>
        <button type="button" class="prev">prev btn</button>
        <button type="button" class="next">next btn</button>
    </div>
    <ul id="indiBtn">
        
        <li><button type="button" class="active">1</button></li>
        
        <li><button type="button">2</button></li>
        
        <li><button type="button">3</button></li>
        
        <li><button type="button">4</button></li>
        
        <li><button type="button">5</button></li>
        
    </ul>
</section>
<!--// mainVisual-->

<section class="sec01">
    <div class="inner">
        <div id="cBody" class="title">
            <img src="/upload_data/board_data/BBS_0000014/160041225895662.jpg" alt="지금 부산은">
        </div>
        <div id="foot_banner2">

            <div class="inner">

                <div class="fb_box">
                    <ul id="slider_foot_banner2">

                        
                        <li class="order1">
                            <a href="javascript:totalSearchFuncKeywordCommonProc('/KR/index.do?contentsSid=373&cate=ALL&currentPage=1&searchTerm=', '축제');" title="축제">
                                #축제 <span class="it-down">1</span>
                            </a>
                        </li>
                        
                        <li class="order1">
                            <a href="javascript:totalSearchFuncKeywordCommonProc('/KR/index.do?contentsSid=373&cate=ALL&currentPage=1&searchTerm=', '포토스폿');" title="포토스폿">
                                #포토스폿 <span class="it-down">1</span>
                            </a>
                        </li>
                        
                        <li class="order1">
                            <a href="javascript:totalSearchFuncKeywordCommonProc('/KR/index.do?contentsSid=373&cate=ALL&currentPage=1&searchTerm=', '문화');" title="문화">
                                #문화 <span class="it-down">1</span>
                            </a>
                        </li>
                        
                        <li class="order1">
                            <a href="javascript:totalSearchFuncKeywordCommonProc('/KR/index.do?contentsSid=373&cate=ALL&currentPage=1&searchTerm=', '부산이색여행');" title="부산이색여행">
                                #부산이색여행 <span class="it-down">1</span>
                            </a>
                        </li>
                        
                        <li class="order1">
                            <a href="javascript:totalSearchFuncKeywordCommonProc('/KR/index.do?contentsSid=373&cate=ALL&currentPage=1&searchTerm=', '테마여행');" title="테마여행">
                                #테마여행 <span class="it-down">1</span>
                            </a>
                        </li>
                        
                        <li class="order1">
                            <a href="javascript:totalSearchFuncKeywordCommonProc('/KR/index.do?contentsSid=373&cate=ALL&currentPage=1&searchTerm=', '바다풍경');" title="바다풍경">
                                #바다풍경 <span class="it-down">1</span>
                            </a>
                        </li>
                        
                        <li class="order1">
                            <a href="javascript:totalSearchFuncKeywordCommonProc('/KR/index.do?contentsSid=373&cate=ALL&currentPage=1&searchTerm=', '가족여행');" title="가족여행">
                                #가족여행 <span class="it-down">1</span>
                            </a>
                        </li>
                        
                        <li class="order1">
                            <a href="javascript:totalSearchFuncKeywordCommonProc('/KR/index.do?contentsSid=373&cate=ALL&currentPage=1&searchTerm=', '관광');" title="관광">
                                #관광 <span class="it-down">1</span>
                            </a>
                        </li>
                        
                        <li class="order1">
                            <a href="javascript:totalSearchFuncKeywordCommonProc('/KR/index.do?contentsSid=373&cate=ALL&currentPage=1&searchTerm=', '부산 소개');" title="부산 소개">
                                #부산 소개 <span class="it-down">1</span>
                            </a>
                        </li>
                        
                        <li class="order1">
                            <a href="javascript:totalSearchFuncKeywordCommonProc('/KR/index.do?contentsSid=373&cate=ALL&currentPage=1&searchTerm=', '박물관');" title="박물관">
                                #박물관 <span class="it-down">1</span>
                            </a>
                        </li>
                        
                    </ul>
                </div>

                <div class="control2">
                    <!-- <button type="button" class="ir img_comn btn_prev2" id="fb_tn_prev">이전 배너</button> id="fb_tn_prev"가 중복오류로 뜸 삭제해도 상관없는 영역 같아서 주석처리함  -->
		    <button type="button" class="ir img_comn btn_prev2">이전 배너</button>
                    <button type="button" class="ir img_comn btn_next2">다음 배너</button>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="sec02" id="resultListSortNewList"><!-- 인기키워드-->
    <div class="inner">
        <h1 class="section_tit">이달의 부산</h1>

        <div class="hot_item_list" >
            <div class="hot-item" v-for="(item, index) in lst">
                <span class="cate tp15">{{item.cate1_nm}}</span>
                <div class="box actionImg3">
                    <a :href="'/index.do?menuCd=' + item.view_menu_cd + '&uc_seq=' + item.uc_seq + '&lang_cd=ko'" :title="item.title"><img :src="item.imgLoadPath" :alt="item.title"></a>
                    <!--
                    <div class="hover">
                        <div class="hover-icon">

                        </div>
                    </div>
                    -->
                </div>

                <p class="tit"><a :href="'/index.do?menuCd=' + item.view_menu_cd + '&uc_seq=' + item.uc_seq + '&lang_cd=ko'" :title="item.title">{{item.title}}</a></p>
                <!-- <span class="loc">{{item.subtitl}}</span> -->
                <span><img src="/upload_data/board_data/BBS_0000014/160039274749953.png" alt="클릭수">{{item.view_cnt}}&nbsp;&nbsp; <img src="/upload_data/board_data/BBS_0000014/160039274750008.png" alt="리뷰수">{{item.review_cnt}}&nbsp;&nbsp; <img src="/upload_data/board_data/BBS_0000014/160039274749983.png" alt="좋아요">{{item.like_cnt}} <!--즐겨찾기수:{{item.fav_cnt}}--> </span>
            </div>

        </div>
    </div>
</section>


<section class="sec02" id="resultListSortViewList"><!-- 인기키워드-->
    <div class="inner">
        <h1 class="section_tit">인기 부산여행</h1>

        <div class="hot_item_list" >
            <div class="hot-item" v-for="(item, index) in lst">
                <span class="cate tp15">{{item.cate1_nm}}</span>
                <div class="box actionImg3">
                    <a :href="'/index.do?menuCd=' + item.view_menu_cd + '&uc_seq=' + item.uc_seq + '&lang_cd=ko'" :title="item.title"><img :src="item.imgLoadPath" :alt="item.title"></a>
                    <!--
                    <div class="hover">
                        <div class="hover-icon">
                            
                        </div>
                    </div>
                    -->
                </div>

                <p class="tit"><a :href="'/index.do?menuCd=' + item.view_menu_cd + '&uc_seq=' + item.uc_seq + '&lang_cd=ko'" :title="item.title">{{item.title}}</a></p>
                <!-- <span class="loc">{{item.subtitl}}</span> -->
                <span><img src="/upload_data/board_data/BBS_0000014/160039274749953.png" alt="클릭수">{{item.view_cnt}}&nbsp;&nbsp; <img src="/upload_data/board_data/BBS_0000014/160039274750008.png" alt="리뷰수">{{item.review_cnt}}&nbsp;&nbsp; <img src="/upload_data/board_data/BBS_0000014/160039274749983.png" alt="좋아요">{{item.like_cnt}} <!--즐겨찾기수:{{item.fav_cnt}}--> </span>
            </div>

        </div>
    </div>
</section>

<section class="sec03"><!-- 축제/행사 -->
    <div class="inner">
        <div class="fest_list" id="festivalList">
            <a :href="'/index.do?menuCd=' + item.view_menu_cd + '&uc_seq=' + item.uc_seq + '&lang_cd=ko'" :title="item.title" class="fest_item" v-for="(item, index) in lst">
                <p class="img"><img :src="item.imgLoadPath" :alt="item.place"></p>
                <strong>{{item.place}}</strong>
                
            </a>
     
        </div>
    </div>
</section>

<section id="newslider">
    <div class="inner"><script>
        $(document).ready(function(){
            $('.slider3').bxSlider({
                nextText: '다음',
                prevText: '이전',
                auto: true,
autoControls: true,
            });
        });
    </script>
</section>

<section class="sec04"><!-- 부산 여행 동영상 -->
    <div class="inner">
        <h1 class="section_tit" style="margin-bottom:30px">부산여행 간접체험</h1>

        <div class="yout_item">
            <ul class="yout_area">
                
                <li>
                    <a href="https://youtu.be/4AZlPUNgp1U" target="_blank" title=" 유튜브 보기(새창)">
                        <img  src="https://img.youtube.com/vi/4AZlPUNgp1U/mqdefault.jpg" alt="비짓부산 활용법 썸네일 이미지" />
                        <strong>♥슬기로운 랜선 여행을 위한 슬기로운 비짓부산 활용법♥</strong>
                    </a>
                </li>
                
                <li>
                    <a href="https://youtu.be/_h1ZtiJDjEA" target="_blank" title="[B스테이지] No.1 부산의 자랑 세이수미(Say Sue Me) - 올드타운(Old Town)!! 소름주의!! 중독주의!! 유튜브 보기(새창)">
                        <img  src="https://img.youtube.com/vi/_h1ZtiJDjEA/mqdefault.jpg" alt="[B스테이지] No.1 부산의 자랑 세이수미(Say Sue Me) - 올드타운(Old Town)!! 소름주의!! 중독주의!!" />
                        <strong>[B스테이지] No.1 부산의 자랑 세이수미(Say Sue Me) - 올드타운(Old Town)!! 소름주의!! 중독주의!!</strong>
                    </a>
                </li>
                
                <li>
                    <a href="https://youtu.be/yvuHch59UrQ" target="_blank" title="[어쩌다 1일]벌써 마지막 여행지라고..? 너무 눈이 부셔서 보석인지 알았잖아, 눈물이 앞을 가려 더욱 반짝이는 황령산 야경★ 유튜브 보기(새창)">
                        <img  src="https://img.youtube.com/vi/yvuHch59UrQ/mqdefault.jpg" alt="[어쩌다 1일]벌써 마지막 여행지라고..? 너무 눈이 부셔서 보석인지 알았잖아, 눈물이 앞을 가려 더욱 반짝이는 황령산 야경★" />
                        <strong>[어쩌다 1일]벌써 마지막 여행지라고..? 너무 눈이 부셔서 보석인지 알았잖아, 눈물이 앞을 가려 더욱 반짝이는 황령산 야경★</strong>
                    </a>
                </li>
                
                <li>
                    <a href="https://youtu.be/Vy8uzn07fn8" target="_blank" title="[어쩌다 1일] 아듀 2020! 오시리아 해안 산책로에서 새해맞이 소원 빌기♥ 설인커플의 소원은?! 유튜브 보기(새창)">
                        <img  src="https://img.youtube.com/vi/Vy8uzn07fn8/mqdefault.jpg" alt="[어쩌다 1일] 아듀 2020! 오시리아 해안 산책로에서 새해맞이 소원 빌기♥ 설인커플의 소원은?!" />
                        <strong>[어쩌다 1일] 아듀 2020! 오시리아 해안 산책로에서 새해맞이 소원 빌기♥ 설인커플의 소원은?!</strong>
                    </a>
                </li>
                
                <li>
                    <a href="https://youtu.be/v0gvv4cXSnw" target="_blank" title="[어쩌다 1일] 설♥태인 아미(ARMY)되다?! BTS 방탄소년단 정국의 고향 ‘만덕동’ 투어 유튜브 보기(새창)">
                        <img  src="https://img.youtube.com/vi/v0gvv4cXSnw/mqdefault.jpg" alt="[어쩌다 1일] 설♥태인 아미(ARMY)되다?! BTS 방탄소년단 정국의 고향 ‘만덕동’ 투어" />
                        <strong>[어쩌다 1일] 설♥태인 아미(ARMY)되다?! BTS 방탄소년단 정국의 고향 ‘만덕동’ 투어</strong>
                    </a>
                </li>
                
                <li>
                    <a href="https://youtu.be/BvvxcXrT-T0" target="_blank" title="BTS DANCE FLASHMOB (Busan Tower Switch)WhenTheSwitchOn 유튜브 보기(새창)">
                        <img  src="https://img.youtube.com/vi/BvvxcXrT-T0/mqdefault.jpg" alt="BTS DANCE FLASHMOB (Busan Tower Switch)WhenTheSwitchOn" />
                        <strong>BTS DANCE FLASHMOB (Busan Tower Switch)WhenTheSwitchOn</strong>
                    </a>
                </li>
                
                <li>
                    <a href="https://youtu.be/RASKGdKOQrE" target="_blank" title="[어쩌다 1일] 한숨 돌리며 쉬어가기 좋은 대룡마을에서, 그림 같은 하루 보내기 유튜브 보기(새창)">
                        <img  src="https://img.youtube.com/vi/RASKGdKOQrE/mqdefault.jpg" alt="[어쩌다 1일] 한숨 돌리며 쉬어가기 좋은 대룡마을에서, 그림 같은 하루 보내기" />
                        <strong>[어쩌다 1일] 한숨 돌리며 쉬어가기 좋은 대룡마을에서, 그림 같은 하루 보내기</strong>
                    </a>
                </li>
                
                <li>
                    <a href="https://youtu.be/n85qGa4Ch64" target="_blank" title="WHEN THE SWITCHON [메이킹-음원편] - 스위치를 켜는 순간..거대한 달토끼가 빛을 밝힌다 - 유튜브 보기(새창)">
                        <img  src="https://img.youtube.com/vi/n85qGa4Ch64/mqdefault.jpg" alt="WHEN THE SWITCHON [메이킹-음원편] - 스위치를 켜는 순간..거대한 달토끼가 빛을 밝힌다 -" />
                        <strong>WHEN THE SWITCHON [메이킹-음원편] - 스위치를 켜는 순간..거대한 달토끼가 빛을 밝힌다 -</strong>
                    </a>
                </li>
                
            </ul>
        </div>

        <div class="more_area">
            <a href="/kr/board/list.do?boardId=BBS_0000008&menuCd=DOM_000000204008000000" class="sec_more" title="더보기">더보기</a>
        </div>
    </div>
</section>

<section class="sec06"><!-- 팝업/게시판/퀵메뉴 -->
    <div class="inner">
        <div class="board_area">
            <h2 class="board_tit">공지사항</h2>
            <ul>
                
                <li><a href="/board/view.do?boardId=BBS_0000001&amp;menuCd=DOM_000000204001000000&amp;startPage=1&amp;dataSid=1202" title="움직이는 관광안내소 운영을 재개합니다">움직이는 관광안내소 운영을 재개합니다</a><span class="date">2021-03-15</span></li>
                
                <li><a href="/board/view.do?boardId=BBS_0000001&amp;menuCd=DOM_000000204001000000&amp;startPage=1&amp;dataSid=1193" title="[부산여행 상품 프로모션] 부산에서 나를 치유해봄">[부산여행 상품 프로모션] 부산에서 나를 치유해봄</a><span class="date">2021-03-08</span></li>
                
                <li><a href="/board/view.do?boardId=BBS_0000001&amp;menuCd=DOM_000000204001000000&amp;startPage=1&amp;dataSid=1187" title="영도 무장애 예술 여행 끄떡없는 여행 참가 모집">영도 무장애 예술 여행 끄떡없는 여행 참가 모집</a><span class="date">2021-02-18</span></li>
                
                <li><a href="/board/view.do?boardId=BBS_0000001&amp;menuCd=DOM_000000204001000000&amp;startPage=1&amp;dataSid=1147" title="“[섬둥이와 함께 떠나는 남쪽빛 감성여행] 영상 퀴즈 이벤트” 당첨자 발표">“[섬둥이와 함께 떠나는 남쪽빛 감성여행] 영상 퀴즈 이벤트” 당첨자 발표</a><span class="date">2020-12-09</span></li>
                
                <li><a href="/board/view.do?boardId=BBS_0000001&amp;menuCd=DOM_000000204001000000&amp;startPage=1&amp;dataSid=1140" title="「부산에만 있는 부로콜리를 찾아라! 」이벤트 당첨자 발표">「부산에만 있는 부로콜리를 찾아라! 」이벤트 당첨자 발표</a><span class="date">2020-12-09</span></li>
                
            </ul>
        </div>
	</div>
</section>
<script type="text/javascript">

    $(document).ready(function() {
        // 하단 배너
        var $fb = $('#foot_banner');
        var $fb_ctl = $fb.find('.control');
        var slider_foot_banner = $('#slider_foot_banner').bxSlider({
            auto: true,
            pause: 2000,
            easing: 'easeOutCubic',
            slideWidth: 147,
            minSlides: 6,
            maxSlides: 6,
            moveSlides: 1,
            slideMargin: 24,
            controls: false,
            pager: false,
            autoHover: true
        });
        $fb_ctl.find('.btn_prev').click(function() {
            slider_foot_banner.goToPrevSlide();
        });
        $fb_ctl.find('.btn_next').click(function() {
            slider_foot_banner.goToNextSlide();
        });
        $fb_ctl.find('.btn_stop').click(function() {
            slider_foot_banner.stopAuto();
            $(this).hide().next().show();
        });
        $fb_ctl.find('.btn_play').click(function() {
            slider_foot_banner.startAuto();
            $(this).hide().prev().show();
        });
        $('#slider_foot_banner').keydown(function() {
            slider_foot_banner.stopAuto();
            slider_foot_banner.css('transform', 'translate3d(0, 0, 0)');
        });
    });
</script>
<script type="text/javascript">

    $(document).ready(function() {
        // 하단 배너
        var $fb = $('#foot_banner2');
        var $fb_ctl = $fb.find('.control2');
        var slider_foot_banner = $('#slider_foot_banner2').bxSlider({
            auto: true,
            pause: 2000,
            easing: 'easeOutCubic',
            slideWidth: 180,
            minSlides: 1,
            maxSlides: 6,
            moveSlides: 1,
            slideMargin: 24,
            controls: false,
            pager: false,
            autoHover: true
        });
        $fb_ctl.find('.btn_prev2').click(function() {
            slider_foot_banner.goToPrevSlide();
        });
        $fb_ctl.find('.btn_next2').click(function() {
            slider_foot_banner.goToNextSlide();
        });
        $fb_ctl.find('.btn_stop2').click(function() {
            slider_foot_banner.stopAuto();
            $(this).hide().next().show();
        });
        $fb_ctl.find('.btn_play2').click(function() {
            slider_foot_banner.startAuto();
            $(this).hide().prev().show();
        });
        $('#slider_foot_banner2').keydown(function() {
            slider_foot_banner.stopAuto();
            slider_foot_banner.css('transform', 'translate3d(0, 0, 0)');
        });
    });
</script>
<script>
    var resultListObj = new Vue({
        el:'#hotkeywordList',
        data:{
            lst: []
        },
        methods:{
            hashTagSplit: function(hashTags){
                var arrHashTags;
                if(hashTags != undefined){
                    arrHashTags = hashTags.split(',');
                }else{
                    arrHashTags = hashTags
                }
                return arrHashTags;
            }
        }
    });
    var resultListSortNewObj = new Vue({
        el:'#resultListSortNewList',
        data:{
            lst: []
        }
    });
    var resultListSortViewObj = new Vue({
        el:'#resultListSortViewList',
        data:{
            lst: []
        }
    });
    var resultFestivalListObj = new Vue({
        el:'#festivalList',
        data:{
            lst: []
        }
    });

    var selectedMainHotKeyword = '';

    $(document).ready(function(){
        
        /*getCntntsFestivalFive();*/
        getCntntsSortNew();
        getCntntsSortView();
    });

    function sendHotKeyword(){
        event.preventDefault();
        totalSearchFuncKeywordCommonProcNewTab('/KR/index.do?contentsSid=373&cate=ALL&currentPage=1&searchTerm=', selectedMainHotKeyword);
    }

    function getCntntsUseHotKeyword(var_hot_keyword, hkKey){
        selectedMainHotKeyword = var_hot_keyword;
        event.preventDefault();
        $('#ul_hotkeywords li a').removeClass('active');
        $('#' + hkKey).addClass('active');

        var frmData = new FormData();
        frmData.append('ucl_seq', 7);
        frmData.append('ub_seq', 8);
        frmData.append('listCntPerPage', 8);
        frmData.append('use_yn', 'Y');
        frmData.append('ucl_use_yn', 'Y');

        setListToVuwObj("/ubicont/listJsonDt.do", frmData, resultListObj);

        return false;
    }

    function getCntntsSortNew(){
        event.preventDefault();

        var frmData = new FormData();
        frmData.append('ucl_seq', 7);
        frmData.append('ub_seq', 8);
        frmData.append('listCntPerPage', 8);
        frmData.append('use_yn', 'Y');
        frmData.append('ucl_use_yn', 'Y');
        frmData.append('order_type', 'NEW');

        setListToVuwObj("/ubicont/listJsonDt.do", frmData, resultListSortNewObj);

        return false;
    }

    function getCntntsSortView(){
        event.preventDefault();

        var frmData = new FormData();
        frmData.append('ucl_seq', 7);
        frmData.append('ub_seq', 8);
        frmData.append('listCntPerPage', 8);
        frmData.append('use_yn', 'Y');
        frmData.append('ucl_use_yn', 'Y');
        frmData.append('order_type', 'VIEW');

        setListToVuwObj("/ubicont/listJsonDt.do", frmData, resultListSortViewObj);

        return false;
    }

    function getCntntsFestivalFive(){
        event.preventDefault();

        var frmData = new FormData();
        frmData.append('ucc1_seq', 20);
        frmData.append('ucl_seq', 7);
        frmData.append('ucl_use_yn', 'Y');
        frmData.append('listCntPerPage', 5);
        frmData.append('cate2_month', (new Date()).getMonth() + 1);
        frmData.append('use_yn', 'Y');

        setListToVuwObj("/ubicont/listJsonFestivalDt.do", frmData, resultFestivalListObj);

        return false;
    }
</script>

<a href="#" class="viewTop">Top</a>
<!--// MAIN -->
                               



	









</div>
    <!--// content -->	
<!-- 메인 페이지 -->

<!-- footer -->
<jsp:include page="../inc/footer.jsp" />
<!-- footer -->
</div>
<!--// wrap -->
</body>
</html>