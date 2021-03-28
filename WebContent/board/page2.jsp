<%@page import="java.util.List"%>
<%@page import="com.tp.bbs.db.BbsDAO"%>
<%@page import="com.tp.bbs.db.BbsBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery-3.5.1.js"></script>

<script type="text/javascript">
	var xmlHttp = new XMLHttpRequest(); // 자바스크립트를 이용하여 객체를 생성하겠습니다.
	xmlHttp.onreadystatechange = function() { // 준비되면 실행하겠습니다.
		if(this.status == 200 && this.readyState == this.DONE) { // this.DONE 또는 4 (요청한 데이터의 처리가 완료되어 응답할 준비가 완료됨)
			displayData(xmlHttp); // 해당 메서드를 실행하겠습니다.
		}
	};
	xmlHttp.open("POST", "../web2.xml", true); // post 형식으로 web2.xml을 사용하겠습니다.
	xmlHttp.send();	// 전달하겠습니다.

function displayData(xmlHttp) { // xmlHttp를 매개변수로 사용하는 객체
	var xmlObj, cityList, result, idx; // 변수명 지정
	xmlObj = xmlHttp.responseXML;	// 요청한 데이터를 XML DOM 객체로 반환함.
	result = "<table border = '1'><tr>"; // result라는 변수에 해당 값을 넣어서 테이블 시작을 알림
	cityList = xmlObj.getElementsByTagName("item"); // item 태그의 내용을 cityList로 사용.
	for(idx = 0; idx < 20; idx++) { // 해당 데이터 길이만큼 반복하겠습니다.
		result += "<td>" + cityList[idx].getElementsByTagName("galTitle")[0].childNodes[0].nodeValue + "</td>"
				+"<td><img src=" +	cityList[idx].getElementsByTagName("galWebImageUrl")[0].childNodes[0].nodeValue 
				+ " width='100' height='100'>";
			if((idx+1) % 5 != 0) { // 5칸마다 다음 줄로 넘기겠습니다. // 숫자도 가능
				result += "</td>"; // 5번째 칸이 아니기 때문에 td만 추가해서 가로줄만 작성하겠습니다.
			} else {
				result += "</td></tr><tr>"; // 5칸이 되었기 때문에 다음 줄로 넘기겠습니다.
			}
	}
	result += "</tr></table>"; // 테이블을 닫겠습니다.
	document.getElementById("text").innerHTML = result; // text라는 id 값에 result 값을 넣겠습니다.
}
// el 태그를 사용하는 방식은 어떠한지 궁금합니다.
// 틈만 나면 오류 표시가 뜨는 데 사용하는 데 문제가 있습니까?
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<title>Insert title here</title>
</head>
<body>
	<!-- 네비게이션 -->
	<%-- <jsp:include page="${contextPath}/inc/nav.jsp" /> --%>
	<!-- 네비게이션 -->

	<!-- 메인 페이지 -->
	<hr>
	<hr>
	<div>
		전체행의 수 : ${totalRowCount} <br>
		현재 페이지 번호 : ${currentPage } <br>
		마지막 페이지 번호 : ${endPage } <br>
		페이지 당 출력할 행의 수 : ${pagePerRow } <br>
		<br>
	</div>
	
	<p id="text"></p>
	
	<a href="${contextPath}/BbsAdd.bo"> 글쓰기</a>
	<a href="${contextPath}/Main.do"> 메인</a>	
	
	<hr>
	<hr>
	
	<!-- 메인 페이지 -->

	<!-- footer -->
	<%-- <jsp:include page="${contextPath}/inc/footer.jsp" /> --%>
	<!-- footer -->
</body>
</html>