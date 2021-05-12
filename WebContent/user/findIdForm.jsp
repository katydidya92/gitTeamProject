<!-- 아이디 찾기 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>주위에서 스피디하게!주스트럭</title>
	<script type="text/javascript">
		function check() {
			var rePhone = /^[0-9]{11,11}$/;
			var phone = document.getElementById("phone");
			
			//전화번호 유효성 체크
			if(phone.value=="") {
		           alert("전화번호를 입력해 주세요");
		           phone.focus();
		           return false;
		    }
			if(!check(rePhone, phone, "전화번호는 11자리 숫자로 입력하세요.")) {
		           return false;
		    }
		}
	</script>
</head>
<body class="findid-page ">
	<!-- 네비게이션 -->
		<jsp:include page="../inc/nav.jsp" />
		<!-- 네비게이션 -->
		<!-- @ subHeader Top area -->    
		<div id="subVisual">
		    <section id="subVisu" class="submenu-DOM_00000020100600">
		        <h2 class="tit">마이 페이지</h2>
		    </section>
		    <section id="nav">
		        <div class="navInner boxing">
		            <div class="left">
		                <ul>
		                    <li class="home"><a href="${contextPath }/Main.do" title="홈"><img src="${contextPath }/img/sub/home.jpg" style="height: 22px; margin-top: 15px;"></a></li>
							<li class="home">회원 관리 > </li>
							<li class="depth2"><a href="${contextPath }/MyPage.do">마이 페이지 </a></li>
		                </ul>
		            </div>
		        </div>
		    </section>
			<script src="${contextPath }/js/subjs.js"></script>
		</div>
		<hr style = "margin: 2.5% 5% ">
	    <!--// @ subHeader Top area -->
	<%
		String email = (String) request.getAttribute("findemail");
		request.setCharacterEncoding("UTF-8");
	%>
	
	<div class="member-join">
		<div class="container">
		<div class="section section-text">
			<div class="row">
				<div class="col-md-9 ml-auto mr-auto">
				<h3 class="title">아이디 찾기</h3>
				
		<form action="./MemberFindIdAction.me" method="post"  onsubmit="return check();">
		
		<label for="exampleFormControlTextarea1">이름</label><br>
		 <input type="text" name="name" class="form-control maintext" placeholder="이름을 입력해주세요" required>
	     <br>
	     
		 <label for="exampleFormControlTextarea1">전화번호</label><br>
		 <input type="text" name="phone" class="form-control maintext" placeholder="핸드폰 번호를 입력해주세요." maxlength="11" required>
	     <br>
	     
	     <% if (email != null){ %>
	     	<input type="text" name="Findid" value="<%=email%>" readonly><br> 
	     <% } %>
	     
	     <div class="col-md-5 ml-auto mr-auto fileadd6">
	     <input type="submit" class="btn btn-primary" value="Find ID">
	     <input type="button" class="btn btn-primary" value="로그인" onclick="location.href='./MemberLogin.me'">
	     </div>
	     </form>
	     
	     </div>
		</div>
		</div>
		</div>
		</div>
		
	<!-- footer -->
	<jsp:include page="../inc/footer.jsp" />
	<!-- footer -->
	</body>
</html>