<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	

<h1>게시판 3</h1>

  <c:forEach items="${bbsList }" var="bbs">
     <fieldset > 
	 
		<table width="220" >
			<tr>
			  <td colspan="3">
			    <a href="#"><img  src="manhattan.jpg" width="200" height="200"></a>
			  </td>
			   
			</tr>
			
			<tr>
			   <div><td height="50" colspan="3">${bbs.bbs_title }</td></div>
			 
			</tr>
			
			<tr>
			  <td><img src="view.png" width="15" height="`15" >조회수</td>
			  <td><img src="chat.png" width="15" height="15" >리뷰수</td>
			  <td>좋아요?</td>
			</tr>
			
		</table> 
			
     </fieldset>
			<br>
  </c:forEach>
			
			
	 


</body>
</html>