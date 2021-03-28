<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

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
</body>
</html>