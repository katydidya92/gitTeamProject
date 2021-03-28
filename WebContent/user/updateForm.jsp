<%@page import="com.tp.users.db.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 
 <script src="../js/jquery-3.5.1.js"></script>


 <!-- 우편번호 API -->
 <script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("addr1").value = roadAddr;
                document.getElementById("addr2").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("addr4").value = extraRoadAddr;
                } else {
                    document.getElementById("addr4").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
 </script>
 <!-- 우편번호 API -->


 <script type="text/javascript">
	function email_check() {
		// 이메일
		window.name = "EmailCheckForm";
		window.open("EmailCheckForm.jsp",
				"echForm", 
				"width=400, height=350, resizable = no")
		
	}
	
	function nick_check() {
		// 닉네임
		window.name = "NickCheckForm";
		window.open("NickCheckForm.jsp",
				"nckForm", 
				"width=400, height=350, resizable = no")
	}
	
	function check_value() {
		
		/* if(fr.userPass.value == "" || fr.userPass.value.length < 0) {
			alert("비밀번호를 입력하세요.");
			return false;
		}
		
		if(fr.userPass2.value = "" || fr.userPass2.length < 0) {
			alert("비밀번호 확인을 입력하세요.");
			return false;
		} */
		
		if(fr.userPass.value != fr.userPass2.value) {
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
		
		if(fr.userEmail.value == "" || fr.userEmail.value.length < 0 ) {
			alert("이메일을 입력하세요");
			return false;
		}

		if(fr.eDuplication.value != "email_check") {
			alert("이메일 중복체크를 해주세요");
			return false;
		}
		
		// 이메일 형식 제어 
		var email = $('userEmail').val();
		var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		
		if(regex.test(email) === false) {
			$('userEmail').focus();
			return false;
		}
		
		// 주소 제어
		if(fr.postcode.value == "" || fr.postcode.value.length < 0) {
			alert("주소를 입력하세요");
			return false;
		}
		
		if(fr.addr1.value = "" || fr.addr1.value.length < 0) {
			alert("주소를 입력하세요");
			return false;
		}
		
		if(fr.addr3.value = "" || fr.addr3.value.length < 0) {
			alert("주소를 입력하세요");
			return false;
		}
		
		
		if(fr.userPhone.value == "" || fr.userPhone.value.length < 0 ) {
			alert("전화번호를 입력하세요");
			return false;
		} 
		
		// 전화번호 번호만 입력
		var phoneNum = $('userPhone').val();
		var regPhone =  /(01[0|1|6|9|7])(\d{3}|\d{4})(\d{4}$)/g;
		
		if(!regPhone.test(phoneNum)) {
			alert('전화번호는 숫자만 입력 가능합니다.');
			return false; 
		}
		
		if(fr.userNickName.value = "" || fr.userNickName.length < 0) {
			alert("닉네임을 입력하세요.");
			return false;
		}
		
		if(fr.nickDuplication.value != "nick_check") {
			alert("닉네임 중복체크를 해주세요");
			return false;
		}
		
	}

 </script>
 
 
<meta charset="utf-8" />
<title>Insert title here</title>



</head>
<body>
	
	<%
	  
	%>


	
	<h1>정보 수정 페이지</h1>
	
	<c:set var="user" value="${ub }"></c:set>
	
	<form action="./UserUpdateAction.ua" method="post" name="fr" enctype="multipart/form-data"
	 onsubmit="return check_value()">
	 <table border="1">
	  <tr>
	   <th>아이디 </th> 
	    <td><input type="text" name="userID" value="${user.userId }" readonly> </td> <br>
	  </tr>
	  <tr>
	   <th>비밀번호</th> 
	   <td><input type="password" name="userPass" minlength="8" maxlength="16" placeholder="8~16글자 입력 가능" value="${ub.userPass }"> </td>
	  </tr>
	  <tr>
	   <th>비밀번호 확인</th> 
	    <td><input type="password" name="userPass2" minlength="8" maxlength="16" placeholder="8~16글자 입력 가능"> </td>
	  </tr>
	  <tr>
	   <th>이름 </th> 
	   <td><input type="text" name="userName" readonly></td>
	  </tr>
	  <tr>
	   <th>이메일</th> 
	   <td> 
	    <input type="email" name="Useremail"  id="userEmail" onkeydown="inputEmailCheck()" value="${user.userEmail }">
	    <input type="button" value="중복확인" onclick="email_check()">
	    <input type="hidden" name="eDuplication" value="eUnCheck">
	   </td>
	  </tr>
	  <tr> 
	   <th>주소 </th>
	  <td>
	   <input type="text" id="postcode" placeholder="우편번호">
	   <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
	   <input type="text" id="addr1" placeholder="도로명주소"> 
	   <input type="text" id="addr2" placeholder="지번주소"> <br>
	    <span id="guide" style="color:#999;display:none"></span>
	   <input type="text" id="addr3" placeholder="상세주소">
	   <input type="text" id="addr4" placeholder="참고항목">
	  </tr>
	  <tr>  
	   <th> 전화번호 </th>
	   <td><input type="text" name="userPhone" id="userPhone"></td>
	  </tr>
	  <tr> 
	   <th>닉네임</th>
	    <td> 
	     <input type="text" name="userNickName" onkeydown="inputNickCheck()">
	     <input type="button" value="중복확인" onclick="nick_check()">
	     <input type="hidden" name="nickDuplication" value="nickUnCheck">
		</td>
	  </tr>
	  <tr> 
	   <th>프로필 사진</th>
	    <td>
	      <div class="image-container">
          <img style="width: 70px;" id="preview-image" src="../img/profile.png">
          <input style="display: block;" type="file" name="userProfile" id="input-image">
         </div>
	   </td>
	  </tr>
	  
	  <tr> 
	   <td colspan="2">
	    <input type="submit" value="수정하기"> 
	    <input type="reset" value="취소"> </td>	   
	  </tr> 
	  
	  
	 </table>
	</form>
	
</body>
</html>

