<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<title>Insert title here</title>

</head>
<body>

	<c:set value="${bbsDetail }" var="bbsDetail" > </c:set>
	<c:set value="${fileName }" var="fileName" > </c:set>
	
	<h5>${bbsDetail }</h5>
	 <form action="./BbsModifyEnd.bo" method="post">
		<fieldset style="width: 600px">
		<input type="hidden" value="${bbsDetail.bbsID }" name="bbsID">
		<input type="hidden" value="${bbsDetail.userID }" name="userID">
		 
		 		<!-- 카테고리  -->
					<div> <c:if test="${bbsDetail.bbs_category==1 }"><a href="#">카테고리1 ></a></c:if></div>
					<div> <c:if test="${bbsDetail.bbs_category==2 }"><a href="#">카테고리2 ></a></c:if></div>
					<div> <c:if test="${bbsDetail.bbs_category==3 }"><a href="#">카테고리3 ></a></c:if></div>
					<div> <c:if test="${bbsDetail.bbs_category==4 }"><a href="#">카테고리4 ></a></c:if></div>
				<hr>
				 
					<div><h2>${bbsDetail.bbs_title }<h2></div>  <!-- 제목 -->
			 	<hr>	 
			  	<br>
			  	   <%--  
			  	   		<div> 프로필 사진${bbsDetail.fileID }</div>  <!-- //프로필 사진 -->   
			  	 	 	<div> ${bbsDetail.userNickName } </div> <!-- //유저 닉네임 --> 
			  	 		<div>
			  	 		<fmt:formatDate value="${bbsDetail.bbs_date }" type="both" />
			  	 		 <!-- // 작성일 -->
			  	 		 </div>  
			  	 	 	<div> 조회수 자리 ${bbsDetail.bbs_readcount }</div> <!-- // 조회수 --> 
			  	 		<div> 댓글갯수자리 </div>	 <!-- 댓글갯수 -->
			  	   	 	<div style="margin-left: 450px">첨부파일 들어갈${bbsDetail.fileID }</div> <!-- 첨부파일   -->
			  	 		<div style="height: 300px">  ${bbsDetail.bbs_content }</div> <!-- //내용 -->
			  	 		 <div>
				  	     <a href="#">${bbsDetail.userNickName }님의 게시글 더 보기</a>
				  	 </div>
			  	
			  	 <hr>
					<div>댓글들어갈자리</div> <!-- 댓글작성란  -->
			  	    --%>
			  	    <!-- 예시 -->
	        <img id="blah" src="${contextPath }/upload/${fileName}" alt="your image" />
	
			<div>		  	 	 
	    		 ${bbsDetail.userNickName }  <br>  
	 			<fmt:formatDate value="${bbsDetail.bbs_date }" type="both" /> <!-- // 작성일 -->
	 			  조회 : ${bbsDetail.bbs_readcount }  
	 		 </div> 
			  	 	
			  	 	
			    <hr>
			   		<div style="margin-left: 450px">첨부파일 들어갈${bbsDetail.fileID }</div> <!-- 첨부파일   -->
			  	 	<div style="height: 300px">  ${bbsDetail.bbs_content }</div> <!-- //내용 -->
			  	 
				  	 <div>
				  	     <a href="#">${bbsDetail.userNickName }님의 게시글 더보기</a>
				  	 </div>
			  	
			  	 <hr>
					<div>댓글들어갈자리</div> <!-- 댓글작성란  -->
			 
			 
	  </fieldset>
  </form>
  			
  			<br>
  			<input type="button" value="수 정 " onclick="location.href='./BbsModify.bo?bbsID=${bbsDetail.bbsID}'">
			<input type="button" onclick="location.href='./BbsList.bo'" value=" 목 록 ">
  			<a onclick="return confirm('정말로 삭제하시겠습니까?')"	href="./BbsDelete.bo?bbsID=${bbsDetail.bbsID}">삭제</a>


</body>
<script type="text/javascript">
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#blah').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }
</script>

</html>