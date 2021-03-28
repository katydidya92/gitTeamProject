<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

  <script type="text/javascript">
  	
   //비밀번호 일치 확인
   $(function(){
	  $("#alert-success").hide();
      $("#alert-danger").hide(); 
  	  $("input").keyup(function(){
		  var pwd1=$("#pwd1").val(); 
  	 	  var pwd2=$("#pwd2").val();
  	  if(pwd1 != "" || pwd2 != ""){
  		  if(pwd1 == pwd2){
  			  $("#alert-success").show(); 
  			  $("#alert-danger").hide(); 
  			  $("#submit").removeAttr("disabled"); 
  		  }else{
  			  $("#alert-success").hide();
  			  $("#alert-danger").show(); 
  			  $("#submit").attr("disabled", "disabled");
  			  } 
  		  }
  	  });
  	  
  	 $("#userEmail").on("keyup", function() {
         if($(this).val().length==0 ) $("#checkBtn").hide();
         else $("#checkBtn").show();
     });
  	  
  	});
   	   // 아이디 중복체크 화면open
	   function openIdChk(){
			
			window.name = "parentForm";
			window.open("user/IdCheckForm.jsp",
					"chkForm", "width=500, height=300, resizable = no, scrollbars = no");	
		}
   	   
		// 아이디 입력창에 값 입력시 hidden에 idUncheck를 세팅한다.
		// 이렇게 하는 이유는 중복체크 후 다시 아이디 창이 새로운 아이디를 입력했을 때
		// 다시 중복체크를 하도록 한다.
		function inputIdChk(){
			document.fr.idDuplication.value ="idUncheck";
		}
  		
		// 이메일 중복체크 화면open
		   function openEmailChk(){
				
				window.name = "parentForm";
				window.open("user/EmailCheckForm.jsp",
						"chkForm", "width=500, height=300, resizable = no, scrollbars = no");	
			}
	   	   
			// 이메일 입력창에 값 입력시 hidden에 idUncheck를 세팅한다.
			function inputEmailChk(){
				document.fr.emailDuplication.value ="emailUncheck";
			}
		
		// 닉네임 중복체크 화면open
		   function openNickChk(){
				
				window.name = "parentForm";
				window.open("user/NickCheckForm.jsp",
						"chkForm", "width=500, height=300, resizable = no, scrollbars = no");	
			}
	   	   
			// 닉네임 입력창에 값 입력시 hidden에 idUncheck를 세팅한다.
			function inputNickChk(){
				document.fr.nickDuplication.value ="nickUncheck";
			}
		
		function check(){
		
		var fr = document.fr;
		
		//아이디 공백제어
		if(fr.userID.value == "" || fr.userID.value.length < 0){
			alert("아이디를 입력하세요");
			fr.userID.focus();
			return false;
		}
		
		if(fr.idDuplication.value != "idCheck"){
			alert("아이디 중복체크를 해주세요");
			return false;
		}

		//비밀번호 공백제어
		if(fr.userPass.value == "" || fr.userPass.value.length < 0){
			alert("비밀번호를 입력하세요");
			fr.userPass.focus();
			return false;
		}
		
		//비밀번호와 비밀번호확인 값 제어
		if(fr.userPass2.value == "" || fr.userPass2.value.length < 0){
			alert("비밀번호를 다시 입력하세요");
			fr.userPass2.focus();
			return false;
		}
		
		if(fr.userPass.value != fr.userPass2.value){
			alert("비밀번호가 일치하지 않습니다");
			fr.userPass2.focus();
			return false;
		}
		
		// 아이디와 비밀번호 중복 제어
		if(fr.userID.value == fr.userPass.value) {
            alert("아이디와 비밀번호는 같을 수 없습니다");
            fr.userPass.value = "";
            fr.userPass2.value = "";
            return false;
        }
		
		//이름 공백제어
		if(fr.userName.value == "" || fr.userName.value.length < 0){
			alert("이름을 입력하세요");
			fr.userName.focus();
			return false;
		}
		if ($("#userName").val().length <= 1) {
			alert("이름을 정확히 입력하세요");
			return false;
		}
		//숫자 및 영문, 자음, 특수문자 사용제어
		for (var i=0; i<$("#userName").val().length; i++)  { 
		    var chk = $("#userName").val().substring(i,i+1); 

		    if(chk.match(/[0-9]|[a-z]|[A-Z]/)) { 
		    	alert("이름을 정확히 입력하세요");
		        return false;
		    }
		    if(chk.match(/([^가-힣\x20])/i)){
		    	alert("이름을 정확히 입력하세요");
		        return false;
		    }
		    if($("#userName").val() == " "){
		    	alert("이름을 정확히 입력하세요");
		        return false;
		    }
		} 
		
		if(fr.userEmail.value != "" && fr.emailDuplication.value == "emailUncheck"){
			alert("이메일 중복체크를 해주세요");
			return false;
		}
		
		 //이메일 형식제어
		 var email = $('#userEmail').val();
		 if(fr.userEmail.value != ""){
		 var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		 if(regex.test(email) === false){
		  alert('잘못된 이메일 형식입니다.');
		  $('#userEmail').focus();
		  return false;
			 } 
		 } 
		
		//주소 공백제어
		if(fr.postcode.value == "" || fr.postcode.value.length < 0){
			alert("주소를 입력하세요");
			fr.postcode.focus();
			return false;
		}
		
		if(fr.add1.value == "" || fr.add1.value.length < 0){
			alert("주소를 입력하세요");
			fr.add1.focus();
			return false;
		}
		
		if(fr.add2.value == "" || fr.add2.value.length < 0){
			alert("주소를 입력하세요");
			fr.add2.focus();
			return false;
		}
		
		if(fr.add3.value == "" || fr.add3.value.length < 0){
			alert("상세주소를 입력하세요");
			fr.add3.focus();
			return false;
		}

		//전화번호 공백제어
		if(fr.userPhone.value == "" || fr.userPhone.value.length < 0){
			alert("전화번호를 입력하세요");
			fr.userPhone.focus();
			return false;
		}
		//전화번호 번호만 입력
		 var phonenum = $('#userPhone').val();
		 var regPhone = /(01[0|1|6|9|7])(\d{3}|\d{4})(\d{4}$)/g;
		 if(!regPhone.test(phonenum)){
		  alert('전화번호를 정확히 입력하세요');
		  $('#userPhone').focus();
		  return false;    
		 }
		
		//닉네임 공백제어
		if(fr.userNickName.value == "" || fr.userNickName.value.length < 0){
			alert("닉네임을 입력하세요");
			fr.userNickName.focus();
			return false;
		}
		
		if(fr.nickDuplication.value != "nickCheck"){
			alert("닉네임 중복체크를 해주세요");
			return false;
		}
	}
	
  </script>
  
</head>
<body>
  <h1>WebContent/user/user_join.jsp</h1>
  
  
  <form action="./UserJoinAction.do" method="post" name="fr" onsubmit="return check();" enctype="multipart/form-data">
    <table border="1">
      <tr>
      <!-- 아이디 중복체크, 아이디는 영문자과 숫자 4~10자만 -->
        <td>아이디</td>
        <td>
          <input type="text" name="userID" id="userID" minlength=4 maxlength=10 onkeydown="inputIdChk()" placeholder="영문자와 숫자4~10자">
          <input type="button" value="중복확인" onclick="openIdChk()">	
		  <input type="hidden" name="idDuplication" value="idUncheck" >
        </td>
      </tr>
      <tr>
      <!-- 비밀번호 일치확인, 값은 8자~16자만, 아이디와 비밀번호는 불일치해야함 -->
        <td>비밀번호</td>
        <td>
          <input type="password" name="userPass" id="pwd1" class="form-control" minlength=8 maxlength=16 placeholder="8~16자까지 입력가능">
        </tr>
        <tr>
        <td>비밀번호 확인</td>
        <td>
          <input type="password" name="userPass2" id="pwd2" class="form-control" placeholder="한번 더 입력하세요">
           <div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
           <div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
        </td>
      </tr>
      <tr>
      <!-- 이름에는 한글문자만 입력되어야됨(특수문자,숫자제외), 한글문자 최소 2자이상 제어 -->
        <td>이름</td>
        <td>
          <input type="text" name="userName" id="userName">
        </td>
      </tr>
      <tr>
      <!-- 이메일 선택사항, 입력시 중복체크  -->
        <td>이메일</td>
        <td>
          <input type="email" name="userEmail" id="userEmail" onkeydown="inputEmailChk()">
          <input type="button" value="중복확인" id="checkBtn" onclick="openEmailChk()" placeholder="선택사항" hidden>	
		  <input type="hidden" name="emailDuplication" value="emailUncheck" >
		  
        </td>
      </tr>
      <tr>
      <!-- 주소API 사용 -->
        <td>주소</td>
        <td>
		  <input type="text" id="postcode" name="postcode" placeholder="우편번호" style="width:200px;font-size:15px;">
	      <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
		  <input type="text" id="add1" name="add1" placeholder="도로명주소" style="width:360px;font-size:15px;">
		  <input type="text" id="add2" name="add2" placeholder="지번주소" style="width:360px;font-size:15px;"><br>
		  <span id="guide" style="color:#999;display:none"></span>
		  <input type="text" id="add3" name="add3" placeholder="상세주소" style="width:360px;font-size:15px;">
		  <input type="text" id="add4" name="add4" placeholder="참고항목" style="width:360px;font-size:15px;">
        </td>
      </tr>
      <tr>
      <!-- 전화번호 형식 제어 (숫자만)-->
        <td>전화번호</td>
        <td>
          <input type="text" name="userPhone" id="userPhone" placeholder="숫자만 입력하세요">
        </td>
      </tr>
      <tr>
      <!-- 프로필사진 선택사항 -->
        <td>프로필사진</td>
        <td>
          <input type="file" name="userProfile">
        </td>
      </tr>
      <tr>
      <!-- 닉네임 중복확인 -->
        <td>닉네임</td>
        <td>
          <input type="text" name="userNickName" onkeydown="inputNickChk()">
          <input type="button" value="중복확인" onclick="openNickChk()">	
		  <input type="hidden" name="nickDuplication" value="nickUncheck" >
        </td>
      </tr>
      <tr>
        <td colspan="2">
          <input type="button" value="취소" onclick="location.href='UserLogin.do'">
          <input type="submit" value="가입하기">
        </td>
      </tr>
    </table>
  </form>
</body>

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
                document.getElementById("add1").value = roadAddr;
                document.getElementById("add2").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("add4").value = extraRoadAddr;
                } else {
                    document.getElementById("add4").value = '';
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
</html>