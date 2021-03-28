<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<title>Insert title here</title>
</head>
<body>
	
	<c:set value="${bbsDetail }" var="bbsDetail"  ></c:set>
	
  	<fieldset>
	<form action="./BbsModifyEnd.bo" method="post" enctype="multipart/form-data">
		 <input type="hidden" value="${bbsDetail.bbsID }" name="bbsID">
		 
		  <select name="bbs_category">
		     <option value="1" <c:if test="${bbsDetail.bbs_category==1 }">selected</c:if>>
		     				게시판1</option>
		     <option value="2" <c:if test="${bbsDetail.bbs_category==2 }">selected</c:if>>
		     				게시판2</option>
		     <option value="3" <c:if test="${bbsDetail.bbs_category==3 }">selected</c:if>>
		     				게시판3</option>
		     <option value="4" <c:if test="${bbsDetail.bbs_category==4 }">selected</c:if>>
		     				게시판4</option>
		  </select>
		  
	  	<input type="text" name="bbs_title" cols="60" placeholder="제목을 입력해 주세요." value="${bbsDetail.bbs_title }">
       	<input type='file' onchange="readURL(this);" />
			<img id="blah" src="#" alt="your image" />
			<img src="${contextPath }/upload/${fileName}" alt="your image" />	  	
		  <textarea name="bbs_content" cols="60" rows="30" placeholder="내용을 입력하세요.">${bbsDetail.bbs_content }
		  </textarea>
		  	
		<input type="submit" value="수 정 ">
		<input type="button" value="취 소 " onclick="location.href='./BbsView.bo?bbsID=${bbsDetail.bbsID }'">
</form>
  </fieldset>
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
</body>
</html>