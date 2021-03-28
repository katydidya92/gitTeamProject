<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

 <style type="text/css">
  .btn {
  		margin: auto;
  		width: 50%; 
  		height: 50%;
  		text-align: center;
  		padding: 50px;}
  		
  h3, .box {margin: 10%;
  			text-align: center;}		
  
 </style>
</head>
<body onload="pValue()">
	
	<fieldset>

	<h3> 닉네임 중복확인 </h3>

	<form action="NickNameCheckAction.ua" method="post" onsubmit="return nick_check()">
	 
	<div class="box"> 
	 닉네임 : <input type="text" name="userNickName">
	 <input type="submit" value="중복확인">
	</div>  
	  <br>
	  <br>
	 <div class="btn"> 
	 <br>
	  <input type="button" value="사용하기" id="useBtn" onclick="send_check()">
	  <input type="button" value="닫기" id="cancelBtn" onclick="window.close()" >
	 </div>
	</form>  
	</fieldset>
	
	
	<script type="text/javascript">
	 function pValue() {
		document.getElementByNickName("userNickName").value = 
			opener.document.updateForm.userNickName;
	}
	 
	 function nick_check() {
		var nickName = document.getElementByNickName("userNickName").value;
		
		if(!userNickName) {
			alert("닉네임을 입력하세요");
			return false;
		} else {
			var param = "nickname = "+userNickName
			httpRequest = getXMLHttpRequest();
			httpReqeust.onreadystatechange = callback;
			httpReqeust.poen("POST", "NickNameCheckAction.ua", true);
			httpReqeust.setRequestHeader('Content-Type', 'application/x-www-for-urlencoded');
			httpReqeust.send(param);
			
		}
	}
	
	 
	 function callback() {
		 if(httpRequest.readyState == 4) {
			 var resultText = httpRequest.responseText;
			 if(resultText == 0) {
				 alert("사용할수 없는 닉네임 입니다.");
				 document.getElementByNickName("cancelBtn").style.visible = 'visible';
				 document.getElementByNickName("useBtn").style.visible = 'hidden';
				 document.getElementByNickName("btn").innerHTML = "사용 가능한 닉네임입니다."
				 
			 }
		 }
		
	}
	</script>
	

</body>
</html>