<%@page import="java.util.List"%>
<%@page import="com.tp.bbs.db.BbsDAO"%>
<%@page import="com.tp.bbs.db.BbsBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<script src="${contextPath }/js/jquery-3.5.1.js"></script>

<script>
   function getParameterByName(name,url) {
	   if(!url) url = window.location.href;
	   name = name.replace(/[\[\]]/g, "\\$&");
    	var regex = new RegExp(name + "=([^&#]*)|&|#|$"),
        	results = regex.exec(url);
	    return results[1];
}
   var uc_seq = getParameterByName('uc_seq');
	    console.log(uc_seq);
 
	var xmlHttp = new XMLHttpRequest(); // 자바스크립트를 이용하여 객체를 생성하겠습니다.
	xmlHttp.onreadystatechange = function() { // 준비되면 실행하겠습니다.
		if(this.status == 200 && this.readyState == this.DONE) { // this.DONE 또는 4 (요청한 데이터의 처리가 완료되어 응답할 준비가 완료됨)
			displayData(xmlHttp); // 해당 메서드를 실행하겠습니다.
		}
	};
	xmlHttp.open("POST", "${contextPath }/bs_spot.xml", true); // post 형식으로 web2.xml을 사용하겠습니다.
	xmlHttp.send();	// 전달하겠습니다.

function displayData(xmlHttp) { // xmlHttp를 매개변수로 사용하는 객체
	var xmlObj, Attraction, result, idx; // 변수명 지정
	xmlObj = xmlHttp.responseXML;	// 요청한 데이터를 XML DOM 객체로 반환함.
	result = "<div class='tab_con innerwrap' id = 'tab_con' >"; // result라는 변수에 해당 값을 넣어서 테이블 시작을 알림
	var AtrTotalLen = xmlObj.getElementsByTagName("item").length; // 전체 길이
	console.log(AtrTotalLen);
	for(i = 0; i < AtrTotalLen; i++){
		Attraction = xmlObj.getElementsByTagName("item"); // item 태그의 내용을 Attraction로 사용.
			if(uc_seq == Attraction[i].getElementsByTagName("UC_SEQ")[0].childNodes[0].nodeValue){
				result += "<div>"
					+"<img src=" +Attraction[i].getElementsByTagName("MAIN_IMG_NORMAL")[0].childNodes[0].nodeValue 
					+ " width='100' height='100'></div><div class = 'vTab01 boxing'>"
					+ Attraction[i].getElementsByTagName("MAIN_TITLE")[0].childNodes[0].nodeValue+"<br>"
					+ Attraction[i].getElementsByTagName("ITEMCNTNTS")[0].childNodes[0].nodeValue+"</div>";
					result += "</div>"; 
			document.getElementById("text").innerHTML = result; // text라는 id 값에 result 값을 넣겠습니다.
			}
	}
}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 네비게이션 -->
	<%-- <jsp:include page="../inc/nav.jsp" /> --%>
	<!-- 네비게이션 -->

	<!-- 메인 페이지 -->
	<hr>
	
	<div id="text"></div>
	
	<a href="${contextPath}/Main.do"> 메인</a>	
	
	<!-- 메인 페이지 -->

	<!-- footer -->
	<%-- <jsp:include page="${contextPath}/inc/footer.jsp" /> --%>
	<!-- footer -->
</body>
</html>